<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Validator;

class ProfileController extends Controller
{
    public function profile($token)
    {
        $user = User::where('api_token', $token)->first();
        
        if($user->exists == false){
            return response()->json([
                    "success" => true,
                    'status' => 400,
                    'message' => "No user found"
                ]);
        }
        else{
            return response()->json([
                    "success" => true,
                    'status' => 200,
                    'data' => $user
                ]);
        }
    }
    
    
    
    public function updateProfile(Request $request, $token) 
    {
        $rules = [
            'phone'=>'required',
            'full_name' => 'required',
            'email' => 'required|email',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            // Validation failed
            return response()->json([
                'status' => false,
                'success' => 400,
                'message' => $validator->messages(),
            ]);
        } else {
            $user = User::where('api_token', $token)->first();
            
            
            if($user->exists == false){
                return response()->json([
                        "success" => true,
                        'status' => 400,
                        'message' => "No user found"
                    ]);
            }
            else{
               
                $user->phone = $request->phone;
                $user->full_name = $request->fullname;
                $user->email = $request->email;
                $user->save();
                
                
                return response()->json([
                    'status' => true,
                    'success' => 200,
                    'message' => 'profile update sucessfully',
                ]);
            }
           
        }
    }
}
