<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Validator;
use App\DetailPesanan;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

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
        $detailPesanan = DetailPesanan::join('pesanan', 'detail_pesanan.ID_PESANAN', '=', 'pesanan.ID_PESANAN')
            ->join('menu', 'detail_pesanan.ID_MENU', '=', 'menu.ID_MENU')
            ->select('menu.NAMA_MENU', 'menu.HARGA_MENU', 'detail_pesanan.*')
            ->where('detail_pesanan.ID_PESANAN', '=', $id)->get();

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

        $serving = DB::table('stok_bahan')->join('menu', 'menu.ID_STOK', '=', 'stok_bahan.ID_STOK')
            ->where('ID_MENU', '=', $storeData['ID_MENU'])
            ->select('SERVING_STOK')
            ->first();

        $today = Carbon::now('Asia/Jakarta')->format('Y-m-d');

        $available = DB::table('stok_bahan')->join('menu', 'menu.ID_STOK', '=', 'stok_bahan.ID_STOK')
            ->join('detail_stok_bahan', 'detail_stok_bahan.ID_STOK', '=', 'stok_bahan.ID_STOK')
            ->where('ID_MENU', '=', $storeData['ID_MENU'])
            ->where('TANGGAL_MASUK_STOK', '=', $today)
            ->select('REMAINING_STOK')
            ->first();

        if($available->REMAINING_STOK < $serving->SERVING_STOK) { // ON TODAY
            return response([
                'message' => 'Stok Bahan Habis',
                'remaining' => $available->REMAINING_STOK,
                'serving' => $serving->SERVING_STOK
            ], 200);
        }
        
        $detailPesanan = DetailPesanan::create($storeData);

        return response([
            'message' => 'Create Detail Pesanan Success',
            'data' => $storeData,
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

            $serving = DB::table('stok_bahan')->join('menu', 'menu.ID_STOK', '=', 'stok_bahan.ID_STOK')
            ->where('ID_MENU', '=', $updateData['ID_MENU'])
            ->select('SERVING_STOK')
            ->first();

        $today = Carbon::now('Asia/Jakarta')->format('Y-m-d');

        $available = DB::table('stok_bahan')->join('menu', 'menu.ID_STOK', '=', 'stok_bahan.ID_STOK')
            ->join('detail_stok_bahan', 'detail_stok_bahan.ID_STOK', '=', 'stok_bahan.ID_STOK')
            ->where('ID_MENU', '=', $updateData['ID_MENU'])
            ->where('TANGGAL_MASUK_STOK', '=', $today)
            ->select('REMAINING_STOK')
            ->first();

        if($available->REMAINING_STOK < $serving->SERVING_STOK) { // ON TODAY
            return response([
                'message' => 'Stok Bahan Habis',
                'remaining' => $available->REMAINING_STOK,
                'serving' => $serving->SERVING_STOK
            ], 200);
        }
        
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

    //nambah jumlah pesanan
    // public function nambahJumlahPesanan(Request $request, $idDetailYangNambah) {
    //     $detailPesanan = DetailPesanan::where('ID_DETAIL_PESANAN', '=', $idDetailYangNambah)->first();
    //     if(is_null($detailPesanan)){
    //         return response([
    //             'message' => 'Detail Pesanan Not Found',
    //             'data' => null
    //         ], 404);
    //     }

    //     $data = $request->all();
    //     $detailPesanan->JUMLAH_ITEM_PESANAN = $data['JUMLAH_ITEM_PESANAN'];
    //     $detailPesanan->SUBTOTAL_ITEM_PESANAN = $data['SUBTOTAL_ITEM_PESANAN'];

    //     if($detailPesanan->save()){
    //         return response([
    //             'message' => 'Update Jumlah Detail Pesanan Success',
    //             'data' => $detailPesanan,
    //         ], 200);
    //     }
        
    //     return response([
    //         'message' => 'Update Jumlah Detail Pesanan Failed',
    //         'data' => null
    //     ], 400);
    // }
}
