@extends('app')

@section('content')
<div class="container">
    <h1>Analytics</h1>

    <h2>Most Correctly Answered Questions</h2>
    <table class="table">
        <thead>
            <tr>
                <th>Question ID</th>
                <th>Correct Answers</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($mostCorrectlyAnsweredQuestions as $question)
            <tr>
                <td>{{ $question->question_id }}</td>
                <td>{{ $question->correct_answers }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <h2>School Rankings</h2>
    <table class="table">
        <thead>
            <tr>
                <th>School Name</th>
                <th>Average Score</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($schoolRankings as $school)
            <tr>
                <td>{{ $school->name }}</td>
                <td>{{ $school->avg_score }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <h2>Performance of Schools Over Time</h2>
    <table class="table">
        <thead>
            <tr>
                <th>School Name</th>
                <th>Year</th>
                <th>Average Score</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($performanceOverTime as $performance)
            <tr>
                <td>{{ $performance->name }}</td>
                <td>{{ $performance->year }}</td>
                <td>{{ $performance->avg_score }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <h2>Percentage Repetition of Questions</h2>
    <table class="table">
        <thead>
            <tr>
                <th>Participant Name</th>
                <th>Repetition Percentage</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($repeatedQuestions as $participant)
            <tr>
                <td>{{ $participant->name }}</td>
                <td>{{ $participant->repetition_percentage }}%</td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <h2>Worst Performing Schools for a Given Challenge</h2>
    <table class="table">
        <thead>
            <tr>
                <th>School Name</th>
                <th>Average Score</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($worstPerformingSchools as $school)
            <tr>
                <td>{{ $school->name }}</td>
                <td>{{ $school->avg_score }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <h2>Best Performing Schools for All Challenges</h2>
    <table class="table">
        <thead>
            <tr>
                <th>School Name</th>
                <th>Average Score</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($bestPerformingSchools as $school)
            <tr>
                <td>{{ $school->name }}</td>
                <td>{{ $school->avg_score }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <h2>Participants with Incomplete Challenges</h2>
    <table class="table">
        <thead>
            <tr>
                <th>Participant Name</th>
                <th>Incomplete Challenges</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($incompleteChallenges as $participant)
            <tr>
                <td>{{ $participant->name }}</td>
                <td>{{ $participant->incomplete_challenges }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection
