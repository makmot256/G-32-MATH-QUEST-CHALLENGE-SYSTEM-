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

        $school = new School([
            'name' => $request->get('name'),
            'district' => $request->get('district'),
            'school_registration_number' => $request->get('school_registration_number'),
            'representative_email' => $request->get('representative_email'),
            'representative_name' => $request->get('representative_name'),
            'created_at' => $request->get('created_at'),
            'updated_at' => $request->get('updated_at'),
        ]);

        
        try {
            $school->save();
            Log::info('Schools saved successfully:', $school->toArray());

            // Redirect to the challenges page with a success message
            return redirect()->route('school')->with('success', 'School created successfully.');
        } catch (\Exception $e) {
            Log::error('Error saving school:', ['message' => $e->getMessage()]);
            return redirect()->route('school')->with('error', 'Failed to create school.');
        }


    }
}
