<?php
namespace App\Http\Controllers;

use App\Imports\AnswerImport;
use App\Imports\QuestionImport;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Log;

class ChallengeController extends Controller
{
    public function upload(Request $request)
    {
        // Log all incoming request data
        Log::info('Upload Request Data:', $request->all());

        $request->validate([
            'fileInputQuestions' => 'required|mimes:xlsx,xls',
            'fileInputAnswers' => 'required|mimes:xlsx,xls',
        ]);

        try {
            // Import questions
            if ($request->hasFile('fileInputQuestions')) {
                Log::info('Uploading Questions File');
                Excel::import(new QuestionImport, $request->file('fileInputQuestions'));
            }

            // Import answers
            if ($request->hasFile('fileInputAnswers')) {
                Log::info('Uploading Answers File');
                Excel::import(new AnswerImport, $request->file('fileInputAnswers'));
            }

            Log::info('Files uploaded successfully');
            return redirect()->route('upload')->with('success', 'Files uploaded successfully.');
        } catch (\Exception $e) {
            Log::error('Error uploading files:', ['message' => $e->getMessage()]);
            return redirect()->route('upload')->with('error', 'Failed to upload files.');
        }
    }

      public function processForm(Request $request)
     {
        $validator = Validator::make($request->all(), [
        'fileInputQuestions' => 'required|mimes:csv,txt', // Example validation for CSV or TXT files
        'fileInputAnswers' => 'required|mimes:csv,txt',
       ]);

       if ($validator->fails()) {
        return redirect('your-form-route')
                    ->withErrors($validator)
                    ->withInput();
       }

     // Process your form submission here if validation passes
     }

}
