<x-layout bodyClass="g-sidenav-show bg-gray-200">
    <x-navbars.sidebar activePage="Uploads"></x-navbars.sidebar>
    <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg">
        <!-- Navbar -->
        <x-navbars.navs.auth titlePage="Questions and Answers Upload"></x-navbars.navs.auth>
        <!-- End Navbar -->
        <head>
            <title>Upload Excel Documents</title>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
            <style>
                body {
                    font-family: Arial, sans-serif;
                    padding: 20px;
                }
                .upload-form {
                    max-width: 1000px;
                    margin: 0 auto;
                    border: 1px solid #ccc;
                    padding: 20px;
                    background-color: #f9f9f9;
                    text-align: left;
                }
                .upload-form label {
                    font-weight: bold;
                }
                .upload-form input[type="file"] {
                    margin-top: 5px;
                }
                .upload-form .drop-area {
                    border: 2px dashed #ccc;
                    padding: 20px;
                    margin-top: 20px;
                    background-color: #f0f0f0;
                    text-align: left;
                    cursor: pointer;
                }
                .upload-form .drop-area.highlight {
                    border-color: #007bff;
                }
                .upload-form button {
                    margin-top: 10px;
                    padding: 10px 20px;
                    background-color: #007bff;
                    color: white;
                    border: none;
                    cursor: pointer;
                }
                .upload-form button:hover {
                    background-color: #0056b3;
                }
            </style>
        </head>
        <body>

        <div class="upload-form">
            <h2>Upload Questions and Answers</h2>
            <form id="excelUploadForm" action="{{ route('upload') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <p>Upload Questions here</p>
                <div class="drop-area" id="dropAreaQuestions" onclick="document.getElementById('questionsFile').click()" ondragover="handleDragOver(event)" ondragleave="handleDragLeave(event)" ondrop="handleDropQuestions(event)">
                    <p>Drag and drop questions.xlsx here or click to select</p>
                    <input type="file" id="questionsFile" name="questionsFile" accept=".xls,.xlsx" style="display: none;">
                </div>
                <div>
                    <label for="fileInputQuestions">Select Questions File:</label>
                    <input type="file" id="fileInputQuestions" name="fileInputQuestions" accept=".xls,.xlsx">
                </div>
                <p>Upload Answers here</p>
                <div class="drop-area" id="dropAreaAnswers" onclick="document.getElementById('answersFile').click()" ondragover="handleDragOver(event)" ondragleave="handleDragLeave(event)" ondrop="handleDropAnswers(event)">
                    <p>Drag and drop answers.xlsx here or click to select</p>
                    <input type="file" id="answersFile" name="answersFile" accept=".xls,.xlsx" style="display: none;">
                </div>
                <div>
                    <label for="fileInputAnswers">Select Answers File:</label>
                    <input type="file" id="fileInputAnswers" name="fileInputAnswers" accept=".xls,.xlsx">
                </div>
                <button type="submit">Upload Files</button>
            </form>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <script>
            function handleDragOver(event) {
                event.preventDefault();
                event.stopPropagation();
                event.dataTransfer.dropEffect = 'copy';
                event.currentTarget.classList.add('highlight');
            }

            function handleDragLeave(event) {
                event.preventDefault();
                event.stopPropagation();
                event.currentTarget.classList.remove('highlight');
            }

            function handleDropQuestions(event) {
                event.preventDefault();
                event.stopPropagation();
                document.getElementById('dropAreaQuestions').classList.remove('highlight');
                document.getElementById('questionsFile').files = event.dataTransfer.files;
            }

            function handleDropAnswers(event) {
                event.preventDefault();
                event.stopPropagation();
                document.getElementById('dropAreaAnswers').classList.remove('highlight');
                document.getElementById('answersFile').files = event.dataTransfer.files;
            }

            $(document).ready(function() {
                @if(session('success'))
                    toastr.success('{{ session('success') }}');
                @endif

                @if(session('error'))
                    toastr.error('{{ session('error') }}');
                @endif
            });
        </script>

        </body>
        <x-footers.auth></x-footers.auth>
    </main>
    <x-plugins></x-plugins>
</x-layout>
