<?php

namespace App\Http\Controllers;

use App\Imports\QuestionImport;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

class QuestionController extends Controller
{
    public function create()
    {
        return view('uploadquestions');
    }

    public function upload(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,xls'
        ]);

        $file = $request->file('file');
        Excel::import(new QuestionImport, $file);
        
        return redirect()->route('questions.create')->with('success', 'Questions uploaded successfully.');
    }
}
