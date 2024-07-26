<?php

namespace App\Http\Controllers;

use App\Models\School;
use App\Models\SchoolRepresentative;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

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
        ]);

        School::create($request->all());
        SchoolRepresentative::create([
            'email' => $request->representative_email,
            'firstname' => $request->representative_name,
            'lastname' => $request->representative_name,
            'username' => $request->representative_name,
            'password' => $request->password,
            'validated' => $request->validated ? true : false
        ]);
        return redirect()->route('schools');


    }
}
