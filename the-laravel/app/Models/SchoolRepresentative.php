<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SchoolRepresentative extends Model
{
    use HasFactory;
    protected $table = 'school_representatives';
    protected $fillable = ['email', 'firstname', 'lastname', 'username', 'password', 'validated'];
}
