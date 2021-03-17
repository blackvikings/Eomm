<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Product;
class ProductContoller extends Controller
{
    public function list($category = null)
    {
        if($category == null)
            return Product::all();
        else
            return Product::where('category_id', $category)->get();
    }
}
