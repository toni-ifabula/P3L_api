<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Validator;
use App\Pesanan;
use Illuminate\Support\Facades\DB;

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

    // SHOW ALL CUSTOM
    public function indexCustom(){
        $pesanan = Pesanan::join('karyawan', 'pesanan.ID_KARYAWAN', '=', 'karyawan.ID_KARYAWAN')
            ->join('reservasi', 'pesanan.ID_RESERVASI', '=', 'reservasi.ID_RESERVASI')
            ->join('customer', 'reservasi.ID_CUSTOMER', '=', 'customer.ID_CUSTOMER')
            ->join('meja', 'reservasi.ID_MEJA', '=', 'meja.ID_MEJA')
            ->select('reservasi.ID_RESERVASI', 'customer.NAMA_CUSTOMER', 'karyawan.NAMA_KARYAWAN',
                'meja.NOMOR_MEJA', 'pesanan.*')
            ->get();

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

    public function getMejaBelumBayar() {
        $pesanan = Pesanan::join('reservasi', 'pesanan.ID_RESERVASI', '=', 'reservasi.ID_RESERVASI')
                        ->join('meja', 'reservasi.ID_MEJA', '=', 'meja.ID_MEJA')
                        ->select('meja.NOMOR_MEJA')
                        ->where('pesanan.STATUS_LUNAS_PESANAN', '=', 'Belum')
                        ->pluck('meja.NOMOR_MEJA');
        
        if(count($pesanan) > 0){
            return response([
                'message' => 'Retrieve Pesanan Belum Bayar Success',
                'data' => $pesanan
            ], 200);
        }

        return response([
            'message' => 'Empty',
            'data' => null
        ], 404);
    }

    public function getInfoByNomorMeja($nomor) {
        $pesanan = Pesanan::join('reservasi', 'pesanan.ID_RESERVASI', '=', 'reservasi.ID_RESERVASI')
                        ->join('meja', 'reservasi.ID_MEJA', '=', 'meja.ID_MEJA')
                        ->select('pesanan.*')
                        ->where('meja.NOMOR_MEJA', '=', $nomor)
                        ->where('pesanan.STATUS_LUNAS_PESANAN', '=', 'Belum')
                        ->first();
        
        if(is_null($pesanan)){
            return response([
                'message' => 'Data Pesanan Not Found',
                'data' => null
            ], 404);
        }

        return response([
            'message' => 'Data Found',
            'data' => $pesanan,
        ], 200);
    }

    public function checkPesananByReservasi($idReservasi) {
        $pesanan = Pesanan::where('ID_RESERVASI', '=', $idReservasi)->first();

        if(is_null($pesanan)) {
            return response([
                'message' => 'Data Pesanan Not Found',
                'data' => $pesanan
            ], 202);
        }

        return response([
            'message' => 'Data Pesanan Found',
            'data' => $pesanan
        ], 200);
    }

    public function updatePesananTotal($idPesanan) {
        $pesanan = Pesanan::where('ID_PESANAN', '=', $idPesanan)->first();

        $subtotal = Pesanan::join('detail_pesanan', 'detail_pesanan.ID_PESANAN', '=', 'pesanan.ID_PESANAN')
            ->where('pesanan.ID_PESANAN', '=', $idPesanan)
            ->sum('detail_pesanan.SUBTOTAL_ITEM_PESANAN');

        $service = $subtotal * 5/100;

        $tax = $subtotal * 10/100;

        $total = $subtotal + $service + $tax;

        $totalQty = DB::table('detail_pesanan')
            ->where('ID_PESANAN', '=', $idPesanan)
            ->sum('JUMLAH_ITEM_PESANAN');

        $totalItem = DB::table('detail_pesanan')
        ->where('ID_PESANAN', '=', $idPesanan)
        ->count();

        $pesanan->SUBTOTAL_PESANAN = $subtotal;
        $pesanan->SERVICE_PESANAN = $service;
        $pesanan->TAX_PESANAN = $tax;
        $pesanan->TOTAL_PESANAN = $total;
        $pesanan->TOTAL_JUMLAH_PESANAN = $totalQty;
        $pesanan->TOTAL_ITEM_PESANAN = $totalItem;


        if($pesanan->save()) {
            return response([
                'message' => 'Update Total Pesanan Success',
                'data' => $pesanan
            ], 200);
        }

        return response([
            'message' => 'Update Total Pesanan Failed',
            'data' => $totalQty
        ], 202);
    }
}
