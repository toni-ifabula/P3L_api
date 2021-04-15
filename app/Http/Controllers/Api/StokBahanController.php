<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Validator;
use App\StokBahan;

class StokBahanController extends Controller
{
    // SHOW ALL
    public function index(){
        $stok_bahan = StokBahan::all();

        if(count($stok_bahan) > 0){
            return response([
                'message' => 'Retrieve All Success',
                'data' => $stok_bahan
            ], 200);
        }

        return response([
            'message' => 'Empty',
            'daa' => null
        ], 404);
    }

    // CREATE
    public function store(Request $request){
        $storeData = $request->all();
        $validate = Validator::make($storeData, [
            'NAMA_STOK' => 'required',
            'UNIT_STOK' => 'required',
            'HARGA_STOK' => 'required|numeric'
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);
        
        $stok_bahan = StokBahan::create($storeData);
        return response([
            'message' => 'Create Stok Bahan Success',
            'data' => $stok_bahan,
        ], 200);
    }

    // UPDATE
    public function update(Request $request, $id){
        $stok_bahan = StokBahan::find($id);
        if(is_null($stok_bahan)){
            return response([
                'message' => 'Stok Bahan Not Found',
                'data' => null
            ], 404);
        }

        $updateData = $request->all();
        $validate = Validator::make($updateData, [
            'NAMA_STOK' => 'required',
            'UNIT_STOK' => 'required',
            'HARGA_STOK' => 'required'
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);
        
        $stok_bahan->NAMA_STOK = $updateData['NAMA_STOK'];
        $stok_bahan->UNIT_STOK = $updateData['UNIT_STOK'];
        $stok_bahan->HARGA_STOK = $updateData['HARGA_STOK'];

        if($stok_bahan->save()){
            return response([
                'message' => 'Update Stok Bahan Success',
                'data' => $stok_bahan,
            ], 200);
        }
        
        return response([
            'message' => 'Update Stok Bahan Failed',
            'data' => null
        ], 400);
    }

    // DELETE
    public function destroy($id){
        $stok_bahan = StokBahan::find($id);

        if(is_null($stok_bahan)){
            return response([
                'message' => 'Stok Bahan Not Found',
                'data' => null
            ], 404);
        }

        if($stok_bahan->delete()){
            return response([
                'message' => 'Delete Stok Bahan Success',
                'data' => $stok_bahan
            ], 200);
        }

        return response([
            'message' => 'Delete Stok Bahan Failed',
            'data' => null
        ], 400);
    }
}
