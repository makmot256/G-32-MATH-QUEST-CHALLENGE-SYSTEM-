<!DOCTYPE html>
<html>
<head>
    <title>Challenge Report</title>
    <style>
        body {
            font-family: DejaVu Sans, sans-serif;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h1>Challenge Report</h1>
    <table>
        <thead>
            <tr>
                <th>First Name</th>
                <th>Challenge Name</th>
                <th>Question</th>
                <th>Answer</th>
                <th>Is Correct</th>
                <th>Score</th>
            </tr>
        </thead>
        <tbody>
            @foreach($reportData as $data)
            <tr>
                <td>{{ $data->firstname }}</td>
                <td>{{ $data->challenge_name }}</td>
                <td>{{ $data->question_text }}</td>
                <td>{{ $data->answer }}</td>
                <td>{{ $data->is_correct ? 'Yes' : 'No' }}</td>
                <td>{{ $data->score }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>