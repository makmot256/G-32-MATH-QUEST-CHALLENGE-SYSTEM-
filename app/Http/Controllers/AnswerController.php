<?php

namespace App\Http\Controllers;

use App\Imports\AnswerImport;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

class AnswerController extends Controller
{
    public function create()
    {
        return view('uploadanswers');
    }

    public function upload(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,xls'
        ]);

        // Import answers
        Excel::import(new AnswerImport, $request->file('file'));

        return redirect()->route('answers.create')->with('success', 'Answers uploaded successfully.');
    }
}

