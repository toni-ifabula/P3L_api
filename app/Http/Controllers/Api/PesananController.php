<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Validator;
use App\Pesanan;

class PesananController extends Controller
{
    // SHOW ALL
    public function index(){
        $pesanan = Pesanan::all();

        if(count($pesanan) > 0){
            return response([
                'message' => 'Retrieve All Success',
                'data' => $pesanan
            ], 200);
        }

        return response([
            'message' => 'Empty',
            'data' => null
        ], 404);
    }

    // CREATE
    public function store(Request $request){
        $storeData = $request->all();
        $validate = Validator::make($storeData, [
            'ID_KARYAWAN' => 'required|numeric',
            'ID_RESERVASI' => 'required|numeric',
            'STATUS_PESANAN' => 'required',
            'SUBTOTAL_PESANAN' => 'required|numeric',
            'SERVICE_PESANAN' => 'required|numeric',
            'TAX_PESANAN' => 'required|numeric',
            'TOTAL_PESANAN' => 'required|numeric',
            'TOTAL_JUMLAH_PESANAN' => 'required|numeric',
            'TOTAL_ITEM_PESANAN' => 'required|numeric',
            'STATUS_LUNAS_PESANAN' => 'required',
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);
        
        $pesanan = Pesanan::create($storeData);
        return response([
            'message' => 'Create Pesanan Success',
            'data' => $pesanan,
        ], 200);
    }

    // UPDATE
    public function update(Request $request, $id){
        $pesanan = Pesanan::find($id);
        if(is_null($pesanan)){
            return response([
                'message' => 'Pesanan Not Found',
                'data' => null
            ], 404);
        }

        $updateData = $request->all();
        $validate = Validator::make($updateData, [
            'ID_KARYAWAN' => 'required|numeric',
            'ID_RESERVASI' => 'required|numeric',
            'STATUS_PESANAN' => 'required',
            'SUBTOTAL_PESANAN' => 'required|numeric',
            'SERVICE_PESANAN' => 'required|numeric',
            'TAX_PESANAN' => 'required|numeric',
            'TOTAL_PESANAN' => 'required|numeric',
            'TOTAL_JUMLAH_PESANAN' => 'required|numeric',
            'TOTAL_ITEM_PESANAN' => 'required|numeric',
            'STATUS_LUNAS_PESANAN' => 'required',
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);
        
        $pesanan->ID_KARYAWAN = $updateData['ID_KARYAWAN'];
        $pesanan->ID_RESERVASI = $updateData['ID_RESERVASI'];
        $pesanan->STATUS_PESANAN = $updateData['STATUS_PESANAN'];
        $pesanan->SUBTOTAL_PESANAN = $updateData['SUBTOTAL_PESANAN'];
        $pesanan->SERVICE_PESANAN = $updateData['SERVICE_PESANAN'];
        $pesanan->TAX_PESANAN = $updateData['TAX_PESANAN'];
        $pesanan->TOTAL_PESANAN = $updateData['TOTAL_PESANAN'];
        $pesanan->TOTAL_JUMLAH_PESANAN = $updateData['TOTAL_JUMLAH_PESANAN'];
        $pesanan->TOTAL_ITEM_PESANAN = $updateData['TOTAL_ITEM_PESANAN'];
        $pesanan->STATUS_LUNAS_PESANAN = $updateData['STATUS_LUNAS_PESANAN'];

        if($pesanan->save()){
            return response([
                'message' => 'Update Pesanan Success',
                'data' => $pesanan,
            ], 200);
        }
        
        return response([
            'message' => 'Update Pesanan Failed',
            'data' => null
        ], 400);
    }

    // DELETE
    public function destroy($id){
        $pesanan = Pesanan::find($id);

        if(is_null($pesanan)){
            return response([
                'message' => 'Pesanan Not Found',
                'data' => null
            ], 404);
        }

        if($pesanan->delete()){
            return response([
                'message' => 'Delete Pesanan Success',
                'data' => $pesanan
            ], 200);
        }

        return response([
            'message' => 'Delete Pesanan Failed',
            'data' => null
        ], 400);
    }

    // UPDATE STATUS DISAJIKAN
    public function statusDisajikan($id){
        $pesanan = Pesanan::find($id);

        if(is_null($pesanan)){
            return response([
                'message' => 'Pesanan Not Found',
                'data' => null
            ], 404);
        }

        $pesanan->STATUS_PESANAN = 'Disajikan';

        if($pesanan->save()){
            return response([
                'message' => 'Ubah Status Disajikan Success',
                'data' => $pesanan
            ], 200);
        }

        return response([
            'message' => 'Ubah Status Disajikan Failed',
            'data' => null
        ], 400);
    }
}
