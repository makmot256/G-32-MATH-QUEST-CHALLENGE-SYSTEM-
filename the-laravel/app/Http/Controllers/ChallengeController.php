<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Challenge;
use Illuminate\Support\Facades\Log;

class ChallengeController extends Controller
{
    public function index()
    {
        $challenges = Challenge::all();
        return view('pages.challenges', compact('challenges'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'start_date' => 'required|date',
            'end_date' => 'required|date',
            'duration' => 'required|integer',
            'num_questions' => 'required|integer',
        ]);

        Log::info('Store Challenge Request Data:', $request->all());

        try {
            $challenge = Challenge::create($request->all());
            Log::info('Challenge saved successfully:', $challenge->toArray());

            return redirect()->route('challenges')->with('success', 'Challenge created successfully.');
        } catch (\Exception $e) {
            Log::error('Error saving challenge:', ['message' => $e->getMessage()]);
            return redirect()->route('challenges')->with('error', 'Failed to create challenge.');
        }
    }
}
