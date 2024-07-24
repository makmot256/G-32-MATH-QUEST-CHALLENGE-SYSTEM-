<?php

namespace App\Http\Controllers;

use App\Models\Challenge;
use App\Models\Participant;
use App\Models\School;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index()
    {
        // Most Correctly Answered Questions
        $mostCorrectlyAnsweredQuestions = DB::table('participant_attempts')
            ->select('question_id', DB::raw('COUNT(*) as correct_answers'))
            ->where('is_correct', 1)
            ->groupBy('question_id')
            ->orderBy('correct_answers', 'DESC')
            ->take(10)
            ->get();

        // School Rankings
        $schoolRankings = School::select('schools.name', DB::raw('AVG(participant_attempts.is_correct) as avg_score'))
            ->join('participants', 'schools.school_registration_number', '=', 'participants.school_registration_number')
            ->join('participant_attempts', 'participants.id', '=', 'participant_attempts.participant_id')
            ->groupBy('schools.id')
            ->orderBy('avg_score', 'DESC')
            ->get();

        // Performance of Schools Over Time
        $performanceOverTime = School::select('schools.name', DB::raw('YEAR(participant_attempts.attempt_date) as year'), DB::raw('AVG(participant_attempts.is_correct) as avg_score'))
            ->join('participants', 'schools.school_registration_number', '=', 'participants.school_registration_number')
            ->join('participant_attempts', 'participants.id', '=', 'participant_attempts.participant_id')
            ->groupBy('schools.id', 'year')
            ->orderBy('year', 'ASC')
            ->get();

        // Challenges done per school
        $challengesDonePerSchool = Participant::select(
            'participants.username',
            'schools.name as school_name',
            DB::raw('COUNT(DISTINCT question_id) as total_questions'),
            DB::raw('COUNT(question_id) as total_attempts'),
            DB::raw('SUM(challenges.num_questions) as total_challenge_questions')
        )
        ->join('participant_attempts', 'participants.id', '=', 'participant_attempts.participant_id')
        ->join('challenges', 'participant_attempts.challenge_id', '=', 'challenges.id')
        ->join('schools', 'participants.school_registration_number', '=', 'schools.school_registration_number')
        ->groupBy('participants.id', 'participants.username', 'schools.name')
        ->get()
        ->map(function ($participant) {
            $participant->repetition_percentage = ($participant->total_attempts - $participant->total_questions) / $participant->total_attempts * 100;
            $participant->completion_percentage = ($participant->total_attempts / $participant->total_challenge_questions) * 100;
            return $participant;
        });

        // Worst Performing Schools for a Given Challenge
        $worstPerformingSchools = [];
        $challenges = Challenge::all();
        foreach($challenges as $challenge) {
            $challengeId = $challenge->id;
            $challengeWorstPerformingSchools = School::select('schools.name', DB::raw('AVG(participant_attempts.is_correct) as avg_score'))
                ->join('participants', 'schools.school_registration_number', '=', 'participants.school_registration_number')
                ->join('participant_attempts', 'participants.id', '=', 'participant_attempts.participant_id')
                ->where('participant_attempts.challenge_id', $challengeId)
                ->groupBy('schools.id')
                ->orderBy('avg_score', 'ASC')
                ->take(10)
                ->get();
            
            $worstPerformingSchools[$challenge->name] = $challengeWorstPerformingSchools;
        }

        // Best Performing Schools for All Challenges
        $bestPerformingSchools = School::select('schools.name', DB::raw('AVG(participant_attempts.is_correct) as avg_score'))
            ->join('participants', 'schools.school_registration_number', '=', 'participants.school_registration_number')
            ->join('participant_attempts', 'participants.id', '=', 'participant_attempts.participant_id')
            ->groupBy('schools.id')
            ->orderBy('avg_score', 'DESC')
            ->take(10)
            ->get();

        // Participants with Incomplete Challenges
        $incompleteChallenges = Participant::select(
            'participants.username',
            'schools.name as school_name',
            'challenges.num_questions', 
            DB::raw('COUNT(participant_attempts.id) as attempts_made'),
            DB::raw('COUNT(DISTINCT challenges.id) as incomplete_challenges')
        )
        ->join('schools', 'participants.school_registration_number', '=', 'schools.school_registration_number')
        ->leftJoin('participant_attempts', 'participants.id', '=', 'participant_attempts.participant_id')
        ->join('challenges', 'challenges.id', '=', 'participant_attempts.challenge_id')
        ->groupBy('participants.id', 'participants.username', 'schools.name', 'challenges.num_questions')
        ->havingRaw('attempts_made < num_questions')
        ->get();

        // Fetching data for the bar chart
        $attemptedChallenges = DB::table('challenges')
            ->select(DB::raw('DAY(created_at) as day'), DB::raw('COUNT(*) as count'))
            ->whereMonth('created_at', now()->month)
            ->groupBy(DB::raw('DAY(created_at)'))
            ->pluck('count', 'day');

        // Fetching data for the line chart (Yearly)
        $yearlyChallenges = DB::table('challenges')
            ->select(DB::raw('YEAR(created_at) as year'), DB::raw('COUNT(*) as count'))
            ->groupBy(DB::raw('YEAR(created_at)'))
            ->pluck('count', 'year');

        // Fetching data for the monthly line chart
        $monthlyChallenges = DB::table('challenges')
            ->select(DB::raw('MONTH(created_at) as month'), DB::raw('COUNT(*) as count'))
            ->groupBy(DB::raw('MONTH(created_at)'))
            ->pluck('count', 'month');
        
        $topTwoWinners = Participant::select(
                'participants.username',
                'schools.name as school_name',
                DB::raw('SUM(participant_attempts.score) as total_score')
            )
            ->join('participant_attempts', 'participants.id', '=', 'participant_attempts.participant_id')
            ->join('schools', 'participants.school_registration_number', '=', 'schools.school_registration_number')
            ->groupBy('participants.id', 'participants.username', 'schools.name')
            ->orderBy('total_score', 'desc')
            ->limit(2)
            ->get();

        return view('dashboard.index',[
            'mostCorrectlyAnsweredQuestions' => $mostCorrectlyAnsweredQuestions,
            'schoolRankings' => $schoolRankings,
            'performanceOverTime' => $performanceOverTime,
            'challengesDonePerSchool' => $challengesDonePerSchool,
            'worstPerformingSchools' => $worstPerformingSchools,
            'bestPerformingSchools' => $bestPerformingSchools,
            'incompleteChallenges' => $incompleteChallenges,
            'attemptedChallenges' => $attemptedChallenges,
            'yearlyChallenges' => $yearlyChallenges,
            'monthlyChallenges' => $monthlyChallenges,
            'topTwoWinners' => $topTwoWinners
        ]);
    }
}
