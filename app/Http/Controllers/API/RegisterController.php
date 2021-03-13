<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\API\RegisterAuthRequest;
use App\User;

class RegisterController extends Controller
{
    public function register(RegisterAuthRequest $request)
    {
        $user = new User;
        $user->name = $request->name;
        $user->phone = $request->phone;
        $user->save();

        return response()->json([
           'success' => true,
            'data' => $user
        ], 200);
    }
}
