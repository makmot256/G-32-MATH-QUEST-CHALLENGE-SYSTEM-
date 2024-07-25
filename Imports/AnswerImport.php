<?php

namespace App\Imports;

use Maatwebsite\Excel\Concerns\ToModel;
use App\Models\Question;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Illuminate\Support\Facades\Log;


class AnswerImport implements ToModel, WithHeadingRow
{
    public function model(array $row)
    {
        $question = Question::where('question_text', $row['question_text'])->first();

        if ($question) {
            Log::info('Updating Answer for Question:', $row);

            $question->update([
                'answer' => $row['answer'],
                'marks' => $row['marks'],
            ]);
        } else {
            Log::warning('Question not found for Answer:', $row);
        }

        return null; // Returning null to avoid inserting new records
    }
}



