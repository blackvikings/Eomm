<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Composition extends Model
{
    protected $table = 'compositions';

    protected $fillable = ['title'];
}
