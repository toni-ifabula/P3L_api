<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Validator;
use App\Meja;

class MejaController extends Controller
{
    // SHOW ALL
    public function index(){
        $meja = Meja::all();

        if(count($meja) > 0){
            return response([
                'message' => 'Retrieve All Success',
                'data' => $meja
            ], 200);
        }

        return response([
            'message' => 'Empty',
            'data' => null
        ], 404);
    }

    public function getIDbyNomor($nomor) {
        $idMeja = Meja::select('ID_MEJA')->where('NOMOR_MEJA', '=', $nomor)->get();
        if($idMeja->isEmpty()){
            return response([
                'message' => 'Meja Not Found',
                'data' => null
            ], 404);
        } else {
            return response([
                'message' => 'Meja Found',
                'data' => $idMeja,
            ], 200);
        }
    }

    // CREATE
    public function store(Request $request){
        $storeData = $request->all();
        $validate = Validator::make($storeData, [
            'NOMOR_MEJA' => 'required|numeric|unique:meja',
            'STATUS_MEJA' => 'required|alpha'
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);
        
        $meja = Meja::create($storeData);
        return response([
            'message' => 'Create Meja Success',
            'data' => $meja,
        ], 200);
    }

    // UPDATE
    public function update(Request $request, $id){
        $meja = Meja::find($id);
        if(is_null($meja)){
            return response([
                'message' => 'Meja Not Found',
                'data' => null
            ], 404);
        }

        $updateData = $request->all();
        $validate = Validator::make($updateData, [
            'NOMOR_MEJA' => ['required', 'numeric', Rule::unique('meja')->ignore($meja)],
            'STATUS_MEJA' => 'required|alpha'
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);
        
        $meja->NOMOR_MEJA = $updateData['NOMOR_MEJA'];
        $meja->STATUS_MEJA = $updateData['STATUS_MEJA'];

        if($meja->save()){
            return response([
                'message' => 'Update Meja Success',
                'data' => $meja,
            ], 200);
        }
        
        return response([
            'message' => 'Update Meja Failed',
            'data' => null
        ], 400);
    }

    // DELETE
    public function destroy($id){
        $meja = Meja::find($id);

        if(is_null($meja)){
            return response([
                'message' => 'Meja Not Found',
                'data' => null
            ], 404);
        }

        if($meja->delete()){
            return response([
                'message' => 'Delete Meja Success',
                'data' => $meja
            ], 200);
        }

        return response([
            'message' => 'Delete Meja Failed',
            'data' => null
        ], 400);
    }
}
