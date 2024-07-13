<?php

namespace App\Imports;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToModel;
use App\Models\Question;
use Maatwebsite\Excel\Concerns\WithBatchInserts;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class AnswerImport implements ToModel,WithHeadingRow
{

    public function model(array $row)
    {
        $question = Question::where('question_text', $row['question_text'])->first();

        if ($question) {
            // Update existing question with answer and marks
            $question->updateOrCreate([
                'answer' => $row['answer'],
                'marks' => $row['marks'],
            ]);
        }

        return null; // Return null to avoid inserting new records
    }
}