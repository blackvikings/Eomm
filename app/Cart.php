<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    protected $fillable = [
        'product_id',
        'product_name',
        'price',
        'image',
        'user_id'
    ];
}
