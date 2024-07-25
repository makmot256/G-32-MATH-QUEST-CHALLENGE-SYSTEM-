<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    use HasFactory;

    protected $table = 'questions';

    protected $fillable = ['question_text','answer','marks'];
    
    public function challenges()
    {
        return $this->belongsToMany(Challenge::class, 'challenge_questions');
    }
}
