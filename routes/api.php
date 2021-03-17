<?php

use Illuminate\Http\Request;
use App\Http\Controllers\API\ProductContoller;
use App\Http\Controllers\API\RegisterController;
use App\Http\Controllers\API\CategoryController;
use App\Http\Controllers\API\PrescriptionController;
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

Route::get('products/{category?}', [ProductContoller::class, 'list']);
Route::get('product/{id}', [ProductContoller::class, 'product']);
//Route::post('register', [RegisterController::class, 'register']);
Route::post('/login',[RegisterController::class,'postLogin']);
// Register
Route::post('/register',[RegisterController::class, 'postRegister']);
// Protected with APIToken Middleware
Route::get('categories', [CategoryController::class, 'index']);

Route::post('search', [ProductContoller::class, 'search']);

Route::middleware('APIToken')->group(function () {
    // Logout
    Route::post('/logout',[RegisterController::class, 'postLogout']);
    Route::post('upload-prescription', [PrescriptionController::class, 'upload']);
});

