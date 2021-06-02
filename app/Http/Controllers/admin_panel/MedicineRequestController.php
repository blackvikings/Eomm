<?php

namespace App\Http\Controllers\admin_panel;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\MedicineRequest;

class MedicineRequestController extends Controller
{
    public function index()
    {
        $medicineRequest = MedicineRequest::all();
        return view('admin_panel.medicine-request.index', compact('medicineRequest'));
    }

    public function delete($id)
    {
        MedicineRequest::where('id', $id)->delete();
        return redirect('admin_panel/requested-medicine');
    }

}
