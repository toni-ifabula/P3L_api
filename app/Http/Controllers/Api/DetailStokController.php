<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Validator;
use App\DetailStok;
use Illuminate\Support\Facades\DB;

class DetailStokController extends Controller
{
    // SHOW ALL
    public function index(){
        $detail_stok = DetailStok::all();

        if(count($detail_stok) > 0){
            return response([
                'message' => 'Retrieve All Success',
                'data' => $detail_stok
            ], 200);
        }

        return response([
            'message' => 'Empty',
            'daa' => null
        ], 404);
    }

    // SHOW BY ID
    public function showByID($id){
        $detail_stok = DetailStok::select('*')->where('ID_STOK', '=', $id)->get();
        if($detail_stok->isEmpty()){
            return response([
                'message' => 'Detail Stok Bahan Not Found',
                'data' => null
            ], 404);
        } else {
            return response([
                'message' => 'Retrieve Detail Stok Bahan Success',
                'data' => $detail_stok
            ], 200);
        }
    }

    // CREATE
    public function store(Request $request){
        $storeData = $request->all();
        $validate = Validator::make($storeData, [
            'ID_STOK' => 'required|numeric',
            'TANGGAL_MASUK_STOK' => 'required|date_format:Y-m-d',
            'INCOMING_STOK' => 'required|numeric',
            'REMAINING_STOK' => 'nullable|numeric',
            'WASTE_STOK' => 'nullable|numeric'
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);
        
        $detail_stok = DetailStok::create($storeData);
        return response([
            'message' => 'Create Detail Stok Bahan Success',
            'data' => $detail_stok,
        ], 200);
    }
    
    // UPDATE
    public function update(Request $request, $id){
        $detail_stok = DetailStok::find($id);
        if(is_null($detail_stok)){
            return response([
                'message' => 'Detail Stok Bahan Not Found',
                'data' => null
            ], 404);
        }

        $updateData = $request->all();
        $validate = Validator::make($updateData, [
            'ID_STOK' => 'required|numeric',
            'TANGGAL_MASUK_STOK' => 'required|date_format:Y-m-d',
            'INCOMING_STOK' => 'required|numeric',
            'REMAINING_STOK' => 'nullable|numeric',
            'WASTE_STOK' => 'nullable|numeric'
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);
        
        $detail_stok->ID_STOK = $updateData['ID_STOK'];
        $detail_stok->TANGGAL_MASUK_STOK = $updateData['TANGGAL_MASUK_STOK'];
        $detail_stok->INCOMING_STOK = $updateData['INCOMING_STOK'];
        if(!empty($updateData['REMAINING_STOK']))
            $detail_stok->REMAINING_STOK = $updateData['REMAINING_STOK'];
        if(!empty($updateData['WASTE_STOK']))
            $detail_stok->WASTE_STOK = $updateData['WASTE_STOK'];

        if($detail_stok->save()){
            return response([
                'message' => 'Update Detail Stok Bahan Success',
                'data' => $detail_stok,
            ], 200);
        }
        
        return response([
            'message' => 'Update Detail Stok Bahan Failed',
            'data' => null
        ], 400);
    }

    // DELETE
    public function destroy($id){
        $detail_stok = DetailStok::find($id);

        if(is_null($detail_stok)){
            return response([
                'message' => 'Stok Bahan Not Found',
                'data' => null
            ], 404);
        }

        if($detail_stok->delete()){
            return response([
                'message' => 'Delete Detail Stok Bahan Success',
                'data' => $detail_stok
            ], 200);
        }

        return response([
            'message' => 'Delete Detail Stok Bahan Failed',
            'data' => null
        ], 400);
    }

    // AUTOMATIC REMAINING STOK CALCULATION
    public function calcRemaining(Request $request) {
        $idMenu = $request->all()['ID_MENU'];
        $tanggal = $request->all()['TANGGAL_MASUK_STOK'];

        $idStok = DB::table('stok_bahan')->join('menu', 'menu.ID_STOK' ,'=', 'stok_bahan.ID_STOK')
                    ->select('stok_bahan.*')->where('menu.ID_MENU', '=', $idMenu)->first();
        
        $remaining = DetailStok::where('ID_STOK', '=', $idStok->ID_STOK)
                    ->where('TANGGAL_MASUK_STOK', '=', $tanggal)->first();

        $servingSize = DB::table('stok_bahan')->where('ID_STOK' , '=', $idStok->ID_STOK)->first();

        $remaining->REMAINING_STOK = $remaining->REMAINING_STOK - $servingSize->SERVING_STOK;

        if($remaining->save()) {
            return response([
                'message' => 'Update Remaining Stok Bahan Success',
                'data' => $remaining->REMAINING_STOK,
            ], 200);
        }

        return response([
            'message' => 'Update Remaining Stok Bahan Failed',
            'data' => $remaining->REMAINING_STOK
        ], 400);
    }
}
