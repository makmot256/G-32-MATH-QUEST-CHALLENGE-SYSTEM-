<?php

namespace App\Imports;

use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use App\Models\Question;
use Illuminate\Support\Facades\Log;

class QuestionImport implements ToModel, WithHeadingRow
{
    public function model(array $row)
    {
        Log::info('Importing Question:', $row);

        return new Question([
            'question_text' => $row['question_text'],
            'answer' => $row['answer'],
            'marks' => $row['marks'],
        ]);
    }
}


