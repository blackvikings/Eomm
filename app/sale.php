<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class sale extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id',
        'product_id',
        'order_status',
        'price'
    ];

    public function user()
    {
    	return $this->belongsTo('App\User','user_id');
    }

     public function products()
     {
         return $this->belongsToMany('App\Product', 'product_sale');
     }
}
