<!DOCTYPE html>
<html>
<head>
    <title>Import Data</title>
</head>
<body>
    <h1>Import Data</h1>

    @if (session('success'))
        <div>{{ session('success') }}</div>
    @endif

    @if ($errors->any())
        <div>
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('import') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div>
            <label for="file">Choose Excel file:</label>
            <input type="file" name="file" id="file" required>
        </div>
        <button type="submit">Import</button>
    </form>
</body>
</html>
