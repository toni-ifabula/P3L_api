<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Validator;
use App\Reservasi;
use App\Meja;

class ReservasiController extends Controller
{
    // SHOW ALL
    public function index(){
        $reservasi = Reservasi::all();

        if(count($reservasi) > 0){
            return response([
                'message' => 'Retrieve All Success',
                'data' => $reservasi
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
            'ID_MEJA' => 'required|numeric',
            'ID_CUSTOMER' => 'required|numeric',
            'SESI_RESERVASI' => 'required',
            'TANGGAL_RESERVASI' => 'required|date_format:Y-m-d'
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);
        
        $reservasi = Reservasi::create($storeData);

        // otomatis ubah status meja jadi "isi"
        $idMeja = $request->input('ID_MEJA');
        $meja = Meja::find($idMeja);
        $meja->STATUS_MEJA = 'Isi';
        $meja->save();

        return response([
            'message' => 'Create Reservasi Success',
            'data' => $reservasi,
        ], 200);
    }

    // UPDATE
    public function update(Request $request, $id){
        $reservasi = Reservasi::find($id);
        if(is_null($reservasi)){
            return response([
                'message' => 'Reservasi Not Found',
                'data' => null
            ], 404);
        }

        $updateData = $request->all();
        $validate = Validator::make($updateData, [
            'ID_MEJA' => 'required|numeric',
            'ID_CUSTOMER' => 'required|numeric',
            'SESI_RESERVASI' => 'required',
            'TANGGAL_RESERVASI' => 'required|date_format:Y-m-d'
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);
        
        $reservasi->ID_MEJA = $updateData['ID_MEJA'];
        $reservasi->ID_CUSTOMER = $updateData['ID_CUSTOMER'];
        $reservasi->SESI_RESERVASI = $updateData['SESI_RESERVASI'];
        $reservasi->TANGGAL_RESERVASI = $updateData['TANGGAL_RESERVASI'];

        if($reservasi->save()){
            return response([
                'message' => 'Update Reservasi Success',
                'data' => $reservasi,
            ], 200);
        }
        
        return response([
            'message' => 'Update Reservasi Failed',
            'data' => null
        ], 400);
    }

    // DELETE
    public function destroy($id){
        $reservasi = Reservasi::find($id);

        if(is_null($reservasi)){
            return response([
                'message' => 'Reservasi Not Found',
                'data' => null
            ], 404);
        }

        if($reservasi->delete()){
            return response([
                'message' => 'Delete Reservasi Success',
                'data' => $reservasi
            ], 200);
        }

        return response([
            'message' => 'Delete Reservasi Failed',
            'data' => null
        ], 400);
    }
}
