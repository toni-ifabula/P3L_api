<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Validator;
use App\Transaksi;

class TransaksiController extends Controller
{
    // SHOW ALL
    public function index(){
        $transaksi = Transaksi::all();

        if(count($transaksi) > 0){
            return response([
                'message' => 'Retrieve All Success',
                'data' => $transaksi
            ], 200);
        }

        return response([
            'message' => 'Empty',
            'data' => null
        ], 404);
    }

    // SHOW ALL CUSTOM
    public function indexCustom(){
        $transaksi = Transaksi::join('pesanan', 'transaksi.ID_PESANAN', '=', 'pesanan.ID_PESANAN')
            ->join('karyawan', 'pesanan.ID_KARYAWAN', '=', 'karyawan.ID_KARYAWAN')
            ->select('karyawan.NAMA_KARYAWAN', 'pesanan.TOTAL_PESANAN', 'transaksi.*')
            ->get();

        if(count($transaksi) > 0){
            return response([
                'message' => 'Retrieve All Success',
                'data' => $transaksi
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
            'ID_KARYAWAN' => 'required|numeric',
            'NOMOR_TRANSAKSI' => 'required',
            'TANGGAL_TRANSAKSI' => 'required|date_format:Y-m-d',
            'WAKTU_TRANSAKSI' => 'required',
            'JENIS_PEMBAYARAN_TRANSAKSI' => 'required',
            'NOMOR_KARTU_TRANSAKSI' => 'nullable|numeric',
            'NAMA_CREDIT_TRANSAKSI' => 'nullable',
            'KODE_VERIFIKASI_TRANSAKSI' => 'nullable',
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);
        
        $transaksi = Transaksi::create($storeData);
        return response([
            'message' => 'Create Transaksi Success',
            'data' => $transaksi,
        ], 200);
    }

    // UPDATE
    public function update(Request $request, $id){
        $transaksi = Transaksi::find($id);
        if(is_null($transaksi)){
            return response([
                'message' => 'Transaksi Not Found',
                'data' => null
            ], 404);
        }

        $updateData = $request->all();
        $validate = Validator::make($updateData, [
            'ID_PESANAN' => 'required|numeric',
            'ID_KARYAWAN' => 'required|numeric',
            'NOMOR_TRANSAKSI' => 'required',
            'TANGGAL_TRANSAKSI' => 'required|date_format:Y-m-d',
            'WAKTU_TRANSAKSI' => 'required',
            'JENIS_PEMBAYARAN_TRANSAKSI' => 'required',
            'NOMOR_KARTU_TRANSAKSI' => 'nullable|numeric',
            'NAMA_CREDIT_TRANSAKSI' => 'nullable',
            'KODE_VERIFIKASI_TRANSAKSI' => 'nullable',
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);
        
        $transaksi->ID_PESANAN = $updateData['ID_PESANAN'];
        $transaksi->ID_KARYAWAN = $updateData['ID_KARYAWAN'];
        $transaksi->NOMOR_TRANSAKSI = $updateData['NOMOR_TRANSAKSI'];
        $transaksi->TANGGAL_TRANSAKSI = $updateData['TANGGAL_TRANSAKSI'];
        $transaksi->WAKTU_TRANSAKSI = $updateData['WAKTU_TRANSAKSI'];
        $transaksi->JENIS_PEMBAYARAN_TRANSAKSI = $updateData['JENIS_PEMBAYARAN_TRANSAKSI'];
        if(!empty($updateData['NOMOR_KARTU_TRANSAKSI'])){
            $transaksi->NOMOR_KARTU_TRANSAKSI = $updateData['NOMOR_KARTU_TRANSAKSI'];
        } else {
            $transaksi->NOMOR_KARTU_TRANSAKSI = null;
        }
            
        if(!empty($updateData['NAMA_CREDIT_TRANSAKSI'])) {
            $transaksi->NAMA_CREDIT_TRANSAKSI = $updateData['NAMA_CREDIT_TRANSAKSI'];
        } else {
            $transaksi->NAMA_CREDIT_TRANSAKSI = null;
        }

        if(!empty($updateData['KODE_VERIFIKASI_TRANSAKSI'])) {
            $transaksi->KODE_VERIFIKASI_TRANSAKSI = $updateData['KODE_VERIFIKASI_TRANSAKSI'];
        } else {
            $transaksi->KODE_VERIFIKASI_TRANSAKSI = null;
        }

        if($transaksi->save()){
            return response([
                'message' => 'Update Transaksi Success',
                'data' => $transaksi,
            ], 200);
        }
        
        return response([
            'message' => 'Update Transaksi Failed',
            'data' => null
        ], 400);
    }

    // DELETE
    public function destroy($id){
        $transaksi = Transaksi::find($id);

        if(is_null($transaksi)){
            return response([
                'message' => 'Transaksi Not Found',
                'data' => null
            ], 404);
        }

        if($transaksi->delete()){
            return response([
                'message' => 'Delete Transaksi Success',
                'data' => $transaksi
            ], 200);
        }

        return response([
            'message' => 'Delete Transaksi Failed',
            'data' => null
        ], 400);
    }
}
