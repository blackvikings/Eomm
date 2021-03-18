<?php

namespace App\Http\Controllers\API;

use App\Cart;
use App\Category;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Product;
use Illuminate\Support\Facades\DB;
use Validator;

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
//        return $r->all();
        if($r->c){
            $category = $r->c;
        }
        if($r->n)
        {
            $name = $r->n;
        }
        $res = Product::all();
        $cat = Category::all();

        if(isset($category) && isset($name) && $name != "" && $category != ""){
            $name = strtolower($name);
//            return "hello";
            $category = Category::where('name', $category)->pluck('id');
            $sRes = DB::select( DB::raw("SELECT * FROM `products` WHERE LOWER(name) like '%{$name}%' and `category_id` = '$category'" ) );
            //dd("SELECT * FROM `products` WHERE lower(name) like '%$name%' and category_id = $category" );
            //$a = 0;
        }
        else if(isset($name)){
            $name = strtolower($name);
            $sRes = DB::select( DB::raw("SELECT * FROM `products` WHERE LOWER(name) like '%{$name}%'" ) );
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

    public function addTocart(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required',
            'product_name' => 'required',
            'price' => 'required',
            'image' => 'required|mimes:jpeg,jpg,png|max:2048',
            'token' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()], 401);
        }
        $user = User::where('api_token', $request->token)->first();
        if($user == null)
        {
            return response()->json([
                "success" => false,
                "message" => "User token mismatch",
            ]);
        }

        $cart = new Cart;
        $cart->product_id = $request->product_id;
        $cart->product_name = $request->product_name;
        $cart->price = $request->price;

        if ($files = $request->file('image')) {
            $file = $request->image->store('public/uploads/cart');
            $cart->image = $file;
        }


        $cart->user_id =$user->id;
        $cart->save();

        return response()->json([
            "success" => true,
            "message" => "product successfully added in cart",
        ]);
    }

    public function removeCart($id)
    {
        Cart::where('id', $id)->delete();

        return response()->json([
            "success" => true,
            "message" => "product successfully deleted from cart",
        ]);

    }

    public function cartList($token)
    {
        $user = User::where('api_token', $token)->first();
        if($user == null)
        {
            return response()->json([
                "success" => false,
                "message" => "User token mismatch",
            ]);
        }

        $cart = Cart::where('user_id', $user->id)->get();
        if ($cart == null || $cart->isEmpty())
        {
            return response()->json([
                "success" => true,
                "message" => "No products exists in cart.",
            ]);
        }

        return $cart;
    }

}
