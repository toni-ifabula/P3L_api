<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Validator;
use App\DetailPesanan;

class DetailPesananController extends Controller
{
    // SHOW ALL
    public function index(){
        $detailPesanan = DetailPesanan::all();

        if(count($detailPesanan) > 0){
            return response([
                'message' => 'Retrieve All Success',
                'data' => $detailPesanan
            ], 200);
        }

        return response([
            'message' => 'Empty',
            'data' => null
        ], 404);
    }

    // SHOW BY ID
    public function showByIdPesanan($id){
        $detailPesanan = DetailPesanan::select('*')->where('ID_PESANAN', '=', $id)->get();

        if(count($detailPesanan) > 0){
            return response([
                'message' => 'Retrieve Detail Pesanan Success',
                'data' => $detailPesanan
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
            'ID_PESANAN' => 'required|numeric',
            'ID_MENU' => 'required|numeric',
            'JUMLAH_ITEM_PESANAN' => 'required|numeric',
            'SUBTOTAL_ITEM_PESANAN' => 'required|numeric',
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);
        
        $detailPesanan = DetailPesanan::create($storeData);
        return response([
            'message' => 'Create Detail Pesanan Success',
            'data' => $detailPesanan,
        ], 200);
    }

    // UPDATE
    public function update(Request $request, $id){
        $detailPesanan = DetailPesanan::find($id);
        if(is_null($detailPesanan)){
            return response([
                'message' => 'Detail Pesanan Not Found',
                'data' => null
            ], 404);
        }

        $updateData = $request->all();
        $validate = Validator::make($updateData, [
            'ID_PESANAN' => 'required|numeric',
            'ID_MENU' => 'required|numeric',
            'JUMLAH_ITEM_PESANAN' => 'required|numeric',
            'SUBTOTAL_ITEM_PESANAN' => 'required|numeric',
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);
        
        $detailPesanan->ID_PESANAN = $updateData['ID_PESANAN'];
        $detailPesanan->ID_MENU = $updateData['ID_MENU'];
        $detailPesanan->JUMLAH_ITEM_PESANAN = $updateData['JUMLAH_ITEM_PESANAN'];
        $detailPesanan->SUBTOTAL_ITEM_PESANAN = $updateData['SUBTOTAL_ITEM_PESANAN'];

        if($detailPesanan->save()){
            return response([
                'message' => 'Update Detail Pesanan Success',
                'data' => $detailPesanan,
            ], 200);
        }
        
        return response([
            'message' => 'Update Detail Pesanan Failed',
            'data' => null
        ], 400);
    }

    // DELETE
    public function destroy($id){
        $detailPesanan = DetailPesanan::find($id);

        if(is_null($detailPesanan)){
            return response([
                'message' => 'Detail Pesanan Not Found',
                'data' => null
            ], 404);
        }

        if($detailPesanan->delete()){
            return response([
                'message' => 'Delete Detail Pesanan Success',
                'data' => $detailPesanan
            ], 200);
        }

        return response([
            'message' => 'Delete Detail Pesanan Failed',
            'data' => null
        ], 400);
    }
}
