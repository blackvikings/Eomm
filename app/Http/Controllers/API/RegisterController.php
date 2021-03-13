<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\API\RegisterAuthRequest;
use App\User;
use Tymon\JWTAuth\Facades\JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use App\Http\Controllers\API\LoginController;

class RegisterController extends Controller
{
    public $loginAfterSignUp = True;

    protected $LoginController;

    public function __construct(LoginController $LoginController)
    {
        $this->LoginController = $LoginController;
    }


    public function register(RegisterAuthRequest $request)
    {
        $user = new User;
        $user->name = $request->name;
        $user->phone = $request->phone;
        $user->save();

        if($this->loginAfterSignUp) {
            return $this->LoginController->login($request);
        }

        return response()->json([
           'success' => true,
            'data' => $user
        ], 200);
    }
}
