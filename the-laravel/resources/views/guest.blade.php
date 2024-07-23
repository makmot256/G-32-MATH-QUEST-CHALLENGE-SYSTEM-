<x-layout bodyClass="g-sidenav-show  bg-gray-200">
    <x-navbars.sidebar activePage='dashboard'></x-navbars.sidebar>
    <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
        <!-- Navbar -->
        <x-navbars.navs.auth titlePage="Dashboard"></x-navbars.navs.auth>
        <!-- End Navbar -->
        <div class="container-fluid py-4">
            <div class="row">
                <div class="col-xl-12 col-sm-6 mb-xl-0 mb-4">
                    <div class="card">
                        <div class="card-header p-3 pt-2">
                            <div
                                class="icon icon-lg icon-shape bg-gradient-dark shadow-dark text-center border-radius-xl mt-n4 position-absolute">
                                <i class="material-icons opacity-10">weekend</i>
                            </div>

                            <!-- Iam editing this div alone  -->
                            <div class="text-start pt-6" class="row"  class="col-lg-div "class="col-lg-15 col-md-6 mb-md-0 mb-4">
                                <p class="text-sm mb-0 text-capitalize"></p>
                                <h4 class="mb-13">
                                    WELCOME TO THE MATH QUEST CHALLENGE
                                </h4>
                                <br>
                                <h5 class="mb-0">
                                    Providing the best Challenges for Primary School Students
                                </h5>
                            </div>
                        </div>
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
                <td>{{ $school}}</td>
                {{-- <td>{{ $school->avg_score }}</td> --}}
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-layout>