<?php

namespace App\Http\Controllers\API;

use App\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Product;
use Illuminate\Support\Facades\DB;

class ProductContoller extends Controller
{
    public function list($category = null)
    {
        if($category == null)
            return Product::all();
        else
            return Product::where('category_id', $category)->get();
    }

    public function product($id)
    {
        return Product::where('id', $id)->first();
    }

    public function search(Request $r)
    {
        $category = '';
        $name = '';
        if($r->query("c")){
            $category = $r->query("c");
        }
        if($r->query("n")){
            $name = $r->query("n");
        }
        $res = Product::all();
        $cat = Category::all();

        if(isset($category) && isset($name)){
            $name = strtolower($name);
            $sRes = DB::select( DB::raw("SELECT * FROM `products` WHERE lower(name) like `%{$name}%` and category_id = $category" ) );
            //dd("SELECT * FROM `products` WHERE lower(name) like '%$name%' and category_id = $category" );
            //$a = 0;
        }
        else if(isset($name)){
            $name = strtolower($name);
            $sRes = DB::select( DB::raw("SELECT * FROM `products` WHERE lower(name) like `%{$name}%`" ) );
            //dd("SELECT * FROM `products` WHERE lower(name) like '%$name%'" );
            // $a = 1;
        }
        else if(isset($category)){
            $sRes = DB::table('products')
                ->where("category_id" , $category)
                ->get();
            //$a = 2;
        }
        else{
            $sRes = DB::table('products')
                ->get();
            // $a= 3;
        }

        if(!isset($category)) {
            $category = -1;
        }
        //dd($sRes);
//        return view('store.search')
//            ->with('products', $sRes)
//            ->with("cat", $cat)
//            ->with("a", $category);

        return response()->json([
            'products' => $sRes,
            'cat' => $cat,
            'a' => $category
        ]);

    }
}
