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
            <form id="excelUploadForm" method="POST" enctype="multipart/form-data">
                @csrf
                <p>Upload Questions here</p>
                <div>
                    <label for="fileInputQuestions">Select Questions File:</label>
                    <input type="file" id="fileInputQuestions" name="fileInputQuestions" accept=".xls,.xlsx">
                </div>
                <p>Upload Answers here</p>
                <div>
                    <label for="fileInputAnswers">Select Answers File:</label>
                    <input type="file" id="fileInputAnswers" name="fileInputAnswers" accept=".xls,.xlsx">
                </div>
                <button type="button" onclick="uploadExcel()">Upload Files</button>
            </form>
         </div>

         <script>
           function uploadExcel() {
           var fileInputQuestions = document.getElementById('fileInputQuestions').files[0];
           var fileInputAnswers = document.getElementById('fileInputAnswers').files[0];

           if (!fileInputQuestions || !fileInputAnswers) {
            alert("Please select both question and answer files.");
            return;
         }

         var formData = new FormData();
         formData.append('fileInputQuestions', fileInputQuestions);
         formData.append('fileInputAnswers', fileInputAnswers);

         fetch('{{ route("upload") }}', {
            method: 'POST',
            body: formData,
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            }
         })
         .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok: ' + response.statusText);
            }
            return response.text();
         })
         .then(data => {
            console.log('Server Response:', data);
            alert('Files uploaded successfully!');
         })
         .catch(error => {
            console.error('Error:', error);
            alert('Error uploading files.');
         });
         }
         </script>
        </body>
        <x-footers.auth></x-footers.auth>
    </main>
    <x-plugins></x-plugins>
</x-layout>
