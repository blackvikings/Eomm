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

        if(isset($user->id)){
            if ($files = $request->file('image')) {

                $file = $request->image->store('public/uploads/prescription');

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
            else{
                return response()->json(['upload_file_not_found'], 400);
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
