<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\API\RegisterAuthRequest;
use App\User;

class RegisterController extends Controller
{
    private $apiToken;
    public function __construct()
    {
        // Unique Token
        $this->apiToken = uniqid(base64_encode(str_random(60)));
    }
    /**
     * Client Login
     */
    public function postLogin(Request $request)
    {
        // Validations
        $rules = [
            'phone'=>'required',
//            'password'=>'required|min:8'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            // Validation failed
            return response()->json([
                'message' => $validator->messages(),
            ]);
        } else {
            // Fetch User
            $user = User::where('phone',$request->phone)->first();
            if($user) {
                // Verify the password
//                if( password_verify($request->password, $user->password) ) {
                    // Update Token
                    $postArray = ['api_token' => $this->apiToken];
                    $login = User::where('phone',$request->phone)->update($postArray);

                    if($login) {
                        return response()->json([
                            'name'         => $user->name,
                            'phone'        => $user->email,
                            'access_token' => $this->apiToken,
                        ]);
                    }
//                } else {
//                    return response()->json([
//                        'message' => 'Invalid Password',
//                    ]);
//                }
            } else {
                return response()->json([
                    'message' => 'User not found',
                ]);
            }
        }
    }
    /**
     * Register
     */
    public function postRegister(Request $request)
    {
        // Validations
        $rules = [
            'name'     => 'required|min:3',
            'phone'    => 'required|unique:users',
//            'password' => 'required|min:8'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            // Validation failed
            return response()->json([
                'message' => $validator->messages(),
            ]);
        } else {
            $postArray = [
                'name'      => $request->name,
                'phone'     => $request->phone,
//                'password'  => bcrypt($request->password),
                'api_token' => $this->apiToken
            ];
            // $user = User::GetInsertId($postArray);
            $user = User::insert($postArray);

            if($user) {
                return response()->json([
                    'name'         => $request->name,
                    'phone'        => $request->phone,
                    'access_token' => $this->apiToken,
                ]);
            } else {
                return response()->json([
                    'message' => 'Registration failed, please try again.',
                ]);
            }
        }
    }
    /**
     * Logout
     */
    public function postLogout(Request $request)
    {
        $token = $request->header('Authorization');
        $user = User::where('api_token',$token)->first();
        if($user) {
            $postArray = ['api_token' => null];
            $logout = User::where('id',$user->id)->update($postArray);
            if($logout) {
                return response()->json([
                    'message' => 'User Logged Out',
                ]);
            }
        } else {
            return response()->json([
                'message' => 'User not found',
            ]);
        }
    }

//    public function register(RegisterAuthRequest $request)
//    {
//        $user = new User;
//        $user->name = $request->name;
//        $user->phone = $request->phone;
//        $user->api_token = $this->apiToken;
//        $user->save();
//
//        return response()->json([
//            'success' => true,
//            'data' => $user
//        ], 200);
//    }
}
