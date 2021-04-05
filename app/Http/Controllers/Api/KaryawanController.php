<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Validator;
use App\Karyawan;

class KaryawanController extends Controller
{
    // SHOW ALL
    public function index(){
        $karyawan = Karyawan::all();

        if(count($karyawan) > 0){
            return response([
                'message' => 'Retrieve All Success',
                'data' => $karyawan
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
            'ID_ROLE' => 'required|numeric',
            'NAMA_KARYAWAN' => 'required|alpha',
            'PASSWORD_KARYAWAN' => 'required',
            'JENIS_KELAMIN_KARYAWAN' => 'required|alpha_dash',
            'TELEPON_KARYAWAN' => 'required|numeric',
            'EMAIL_KARYAWAN' => 'required|email:rfc,dns|unique:karyawan',
            'TANGGAL_GABUNG_KARYAWAN' => 'required|date_format:Y-m-d',
            'STATUS_KARYAWAN' => 'required|alpha'
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);
        
        $karyawan = Karyawan::create($storeData);
        return response([
            'message' => 'Create Karyawan Success',
            'data' => $karyawan,
        ], 200);
    }

    // UPDATE
    public function update(Request $request, $id){
        $karyawan = Karyawan::find($id);
        if(is_null($karyawan)){
            return response([
                'message' => 'Karyawan Not Found',
                'data' => null
            ], 404);
        }

        $updateData = $request->all();
        $validate = Validator::make($updateData, [
            'ID_ROLE' => 'required|numeric',
            'NAMA_KARYAWAN' => 'required|alpha',
            'PASSWORD_KARYAWAN' => 'required',
            'JENIS_KELAMIN_KARYAWAN' => 'required|alpha_dash',
            'TELEPON_KARYAWAN' => 'required|numeric',
            'EMAIL_KARYAWAN' => ['required', 'email:rfc,dns', Rule::unique('karyawan')->ignore($karyawan)],
            'TANGGAL_GABUNG_KARYAWAN' => 'required|date_format:Y-m-d',
            'STATUS_KARYAWAN' => 'required|alpha'
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);
        
        $karyawan->ID_ROLE = $updateData['ID_ROLE'];
        $karyawan->NAMA_KARYAWAN = $updateData['NAMA_KARYAWAN'];
        $karyawan->PASSWORD_KARYAWAN = $updateData['PASSWORD_KARYAWAN'];
        $karyawan->JENIS_KELAMIN_KARYAWAN = $updateData['JENIS_KELAMIN_KARYAWAN'];
        $karyawan->TELEPON_KARYAWAN = $updateData['TELEPON_KARYAWAN'];
        $karyawan->EMAIL_KARYAWAN = $updateData['EMAIL_KARYAWAN'];
        $karyawan->TANGGAL_GABUNG_KARYAWAN = $updateData['TANGGAL_GABUNG_KARYAWAN'];
        $karyawan->STATUS_KARYAWAN = $updateData['STATUS_KARYAWAN'];

        if($karyawan->save()){
            return response([
                'message' => 'Update Karyawan Success',
                'data' => $karyawan,
            ], 200);
        }
        
        return response([
            'message' => 'Update Karyawan Failed',
            'data' => null
        ], 400);
    }

    // DEACTIVATE ACCOUNT
    public function resign($id){
        $karyawan = Karyawan::find($id);

        if(is_null($karyawan)){
            return response([
                'message' => 'Karyawan Not Found',
                'data' => null
            ], 404);
        }

        $karyawan->STATUS_KARYAWAN = 'Resign';

        if($karyawan->save()){
            return response([
                'message' => 'Resign Account Success',
                'data' => $karyawan
            ], 200);
        }

        return response([
            'message' => 'Resign Account Failed',
            'data' => null
        ], 400);
    }

}
