<?php 

namespace App\Http\Controllers;

use App\Models\Answer;
use App\Models\Challenge;
use App\Models\Participant;
use App\Models\Question;
use App\Models\School;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AnalyticsController extends Controller
{
    public function index()
    {
        if (auth()->check()) {
            // If the user is authenticated, redirect to the sign-in page
            return redirect()->route('sign-in');
        }
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

        // Percentage Repetition of Questions
        $repeatedQuestions = Participant::select('participants.username', DB::raw('COUNT(DISTINCT question_id) as total_questions'), DB::raw('COUNT(question_id) as total_attempts'))
            ->join('participant_attempts', 'participants.id', '=', 'participant_attempts.participant_id')
            ->groupBy('participants.id', 'participants.username')
            ->get()
            ->map(function ($participant) {
                $participant->repetition_percentage = ($participant->total_attempts - $participant->total_questions) / $participant->total_attempts * 100;
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
        $incompleteChallenges = Participant::select('participants.username', DB::raw('COUNT(DISTINCT challenges.id) as incomplete_challenges'))
            ->join('participant_attempts', 'participants.id', '=', 'participant_attempts.participant_id')
            ->join('challenges', 'participant_attempts.challenge_id', '=', 'challenges.id')
            ->whereNull('participant_attempts.attempt_number')
            ->groupBy('participants.id', 'participants.username')
            ->get();

        return view('welcome',[
            'mostCorrectlyAnsweredQuestions' => $mostCorrectlyAnsweredQuestions,
            'schoolRankings' => $schoolRankings,
            'performanceOverTime' => $performanceOverTime,
            'repeatedQuestions' => $repeatedQuestions,
            'worstPerformingSchools' => $worstPerformingSchools,
            'bestPerformingSchools' => $bestPerformingSchools,
            'incompleteChallenges' => $incompleteChallenges
        ]);
    }
}
