<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;

class LoginController extends Controller
{
    public function loginApi(Request $request)
    {
//        return response()->json([
//            'message' => "hello",
//        ]);
        $input = $request->only('phone');
        $jwt_token = null;

        if(!$jwt_token = JWTAuth::attempt($input)){
            return response()->json([
                'success' => false,
                'message' => 'Invalid Mobile No.',
            ], 401);
        }

        return response()->json([
            'success' => true,
            'token' => $jwt_token,
        ]);
    }

    public function logout(Request $request)
    {
        $this->validate($request, [
            'token' => 'required'
        ]);

        try {
            JWTAuth::invalidate($request->token);

            return response()->json([
                'success' => true,
                'message' => 'User logged out successfully'
            ]);
        } catch (JWTException $exception) {
            return response()->json([
                'success' => false,
                'message' => 'Sorry, the user cannot be logged out'
            ], 500);
        }
    }

    public function getAuthUser(Request $request)
    {
        $this->validate($request, [
            'token' => 'required'
        ]);

        $user = JWTAuth::authenticate($request->token);

        return response()->json(['user' => $user]);
    }

}
