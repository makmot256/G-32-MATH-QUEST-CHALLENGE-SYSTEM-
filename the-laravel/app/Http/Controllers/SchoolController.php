<?php

namespace App\Http\Controllers;

use App\Models\School;
use Illuminate\Http\Request;

class SchoolController extends Controller
{
    public function index()
    {
        $schools = School::all();
        return view('pages.schools', compact('schools'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'district' => 'required',
            'school_registration_number' => 'required',
            'representative_email' => 'required|email',
            'representative_name' => 'required',
            'created_at' => 'required',
            'updated_at' => 'required',
        ]);

        School::create($request->all());
        return redirect()->route('schools');


    }
}
