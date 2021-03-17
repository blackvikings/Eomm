<?php

namespace App\Http\Controllers\API;

use http\Env\Response;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Prescription;
use App\User;
use Validator;

class PrescriptionController extends Controller
{
    public function upload(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'token' => 'required',
            'image' => 'required|mimes:jpeg,jpg,png|max:2048'
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()], 401);
        }
        $user = User::where('api_token', $request->token)->first();

//        return response()->json($user);

        if(isset($user->id)){
            if ($files = $request->file('file')) {
                $file = $request->file->store('public/prescription');

                $prescription = new Prescription;
                $prescription->title  = $file;
                $prescription->user_id = $user->id;
                $prescription->save();

                return response()->json([
                    "success" => true,
                    "message" => "File successfully uploaded",
                    "file" => $file
                ]);
            }
        }
        else{
            return response()->json([
                "success" => false,
                "message" => "File not uploaded",
            ]);
        }

    }
}
