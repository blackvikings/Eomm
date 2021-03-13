<?php

use Illuminate\Http\Request;
use App\Http\Controllers\API\ProductContoller;
use App\Http\Controllers\API\RegisterController;
use App\Http\Controllers\API\LoginController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('products', [ProductContoller::class, 'list']);
Route::get('register', [RegisterController::class, 'register']);

Route::post('login', [LoginController::class, 'login']);

Route::group(['middleware' => 'auth.jwt'], function (){
    Route::get('logout', [LoginController::class, 'logout']);
});

