<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\MedicineRequest;
class MedicineRequestController extends Controller
{
    public function store(Request $request)
    {
        $rules = [
            'name' => 'required',
            'mobile_no' => 'required',
            'medicine_name' => 'required'
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
            $medicine = new MedicineRequest;
            $medicine->name = $request->name;
            $medicine->mobile_no = $request->medicine_name;
            $medicine->save();

            return response()->json([
                "success" => true,
                'status' => 200,
                'message' => 'Request accepted successfully.'
            ]);
        }
    }
}
