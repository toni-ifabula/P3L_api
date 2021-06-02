<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Validator;
use Illuminate\Support\Facades\DB;

class LaporanController extends Controller
{
    public function laporanPendapatanBulanan($tahun){

        $utama = DB::table('pesanan')->join('reservasi' , 'pesanan.ID_RESERVASI', '=' , 'reservasi.ID_RESERVASI') ->
        join( 'meja' , 'reservasi.ID_MEJA', '=' ,'meja.ID_MEJA') ->
        join('customer' , 'reservasi.ID_CUSTOMER', '=' ,'customer.ID_CUSTOMER') ->
        join('detail_pesanan' , 'detail_pesanan.ID_PESANAN', '=' ,'pesanan.ID_PESANAN') ->
        join('menu' , 'detail_pesanan.ID_MENU', '=' ,'menu.ID_MENU') ->
        join('stok_bahan' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK') ->
        join('transaksi' , 'transaksi.ID_PESANAN', '=' ,'pesanan.ID_PESANAN') ->
        whereYear('transaksi.TANGGAL_TRANSAKSI', '=', $tahun)->
        where('menu.kategori_menu', '=', 'Makanan Utama')->
        select(DB::raw("MONTHNAME(transaksi.TANGGAL_TRANSAKSI) month"), 
            DB::raw('sum(detail_pesanan.JUMLAH_ITEM_PESANAN * menu.HARGA_MENU)AS subtotal'))->
        groupBy('month')
        ->get();

        $sideDish = DB::table('pesanan')->join('reservasi' , 'pesanan.ID_RESERVASI', '=' , 'reservasi.ID_RESERVASI') ->
        join( 'meja' , 'reservasi.ID_MEJA', '=' ,'meja.ID_MEJA') ->
        join('customer' , 'reservasi.ID_CUSTOMER', '=' ,'customer.ID_CUSTOMER') ->
        join('detail_pesanan' , 'detail_pesanan.ID_PESANAN', '=' ,'pesanan.ID_PESANAN') ->
        join('menu' , 'detail_pesanan.ID_MENU', '=' ,'menu.ID_MENU') ->
        join('stok_bahan' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK') ->
        join('transaksi' , 'transaksi.ID_PESANAN', '=' ,'pesanan.ID_PESANAN') ->
        whereYear('transaksi.TANGGAL_TRANSAKSI', '=', $tahun)->
        where('menu.kategori_menu', '=', 'Makanan Side Dish')->
        select(DB::raw("MONTHNAME(transaksi.TANGGAL_TRANSAKSI) month"), 
            DB::raw('sum(detail_pesanan.JUMLAH_ITEM_PESANAN * menu.HARGA_MENU)AS subtotal'))->
        groupBy('month')
        ->get();

        $minuman = DB::table('pesanan')->join('reservasi' , 'pesanan.ID_RESERVASI', '=' , 'reservasi.ID_RESERVASI') ->
        join( 'meja' , 'reservasi.ID_MEJA', '=' ,'meja.ID_MEJA') ->
        join('customer' , 'reservasi.ID_CUSTOMER', '=' ,'customer.ID_CUSTOMER') ->
        join('detail_pesanan' , 'detail_pesanan.ID_PESANAN', '=' ,'pesanan.ID_PESANAN') ->
        join('menu' , 'detail_pesanan.ID_MENU', '=' ,'menu.ID_MENU') ->
        join('stok_bahan' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK') ->
        join('transaksi' , 'transaksi.ID_PESANAN', '=' ,'pesanan.ID_PESANAN') ->
        whereYear('transaksi.TANGGAL_TRANSAKSI', '=', $tahun)->
        where('menu.kategori_menu', '=', 'Minuman')->
        select(DB::raw("MONTHNAME(transaksi.TANGGAL_TRANSAKSI) month"), 
            DB::raw('sum(detail_pesanan.JUMLAH_ITEM_PESANAN * menu.HARGA_MENU)AS subtotal'))->
        groupBy('month')
        ->get();

        if(!is_null($utama)>0 && !is_null($sideDish)>0 && !is_null($minuman)>0){
            return response([
                'message' => 'Retrieve All Success',
                'utama'  => $utama,
                'sideDish' => $sideDish,
                'minuman' => $minuman,
            ],200);
        }       
        
        return response([
            'message' => 'Empty',
            'data' => null
        ], 404);
    }

    public function getTotalPendapatanBulanan($tahun){
        $pesanan = DB::table('pesanan')->join('Reservasi' , 'pesanan.id_reservasi', '=' , 'reservasi.id_reservasi') ->
                            join( 'meja' , 'reservasi.id_meja', '=' ,'meja.id_meja') ->
                            join('customer' , 'reservasi.id_customer', '=' ,'customer.id_customer') ->
                            join('detail_pesanan' , 'detail_pesanan.id_pesanan', '=' ,'pesanan.id_pesanan') ->
                            join('menu' , 'menu.id_menu', '=' ,'detail_pesanan.id_menu') ->
                            join('bahan' , 'bahan.id_bahan', '=' ,'menu.id_bahan') ->
                            join('transaksi' , 'transaksi.id_pesanan', '=' ,'pesanan.id_pesanan') ->
                            whereYear('transaksi.tanggal_transaksi', '=', $tahun)->
                            select(DB::raw("MONTHNAME(transaksi.tanggal_transaksi) month") , DB::raw('sum(detail_pesanan.qty_item_pesanan * menu.harga_menu)AS Sub_Total'))->
                            groupBy('month') -> get();

        if(!is_null($pesanan)>0){
            return response([
                'message' => 'Retrieve All Success',
                'data'  => $pesanan
            ],200);
        }       
        
        return response([
            'message' => 'Empty',
            'data' => null
        ], 404);
    }

    public function laporanPendapatanMakananTahunan($tahun1, $tahun2){
        $pesanan = DB::table('pesanan')->join('Reservasi' , 'pesanan.id_reservasi', '=' , 'reservasi.id_reservasi') ->
                            join( 'meja' , 'reservasi.id_meja', '=' ,'meja.id_meja') ->
                            join('customer' , 'reservasi.id_customer', '=' ,'customer.id_customer') ->
                            join('detail_pesanan' , 'detail_pesanan.id_pesanan', '=' ,'pesanan.id_pesanan') ->
                            join('menu' , 'menu.id_menu', '=' ,'detail_pesanan.id_menu') ->
                            join('bahan' , 'bahan.id_bahan', '=' ,'menu.id_bahan') ->
                            join('transaksi' , 'transaksi.id_pesanan', '=' ,'pesanan.id_pesanan') ->
                            whereBetween(DB::raw('YEAR(transaksi.tanggal_transaksi)'), array($tahun1, $tahun2))->
                            where('menu.kategori_menu', '=', 'Utama')->
                            select(DB::raw("YEAR(transaksi.tanggal_transaksi) year") , DB::raw('sum(detail_pesanan.qty_item_pesanan * menu.harga_menu)AS Sub_Total'))->
                            groupBy('year') -> get();

        if(!is_null($pesanan)>0){
            return response([
                'message' => 'Retrieve All Success',
                'data'  => $pesanan
            ],200);
        }       
        
        return response([
            'message' => 'Empty',
            'data' => null
        ], 404);
    }

    public function laporanPendapatanSideDishTahunan($tahun1, $tahun2){
        $pesanan = DB::table('pesanan')->join('Reservasi' , 'pesanan.id_reservasi', '=' , 'reservasi.id_reservasi') ->
                            join( 'meja' , 'reservasi.id_meja', '=' ,'meja.id_meja') ->
                            join('customer' , 'reservasi.id_customer', '=' ,'customer.id_customer') ->
                            join('detail_pesanan' , 'detail_pesanan.id_pesanan', '=' ,'pesanan.id_pesanan') ->
                            join('menu' , 'menu.id_menu', '=' ,'detail_pesanan.id_menu') ->
                            join('bahan' , 'bahan.id_bahan', '=' ,'menu.id_bahan') ->
                            join('transaksi' , 'transaksi.id_pesanan', '=' ,'pesanan.id_pesanan') ->
                            whereBetween(DB::raw('YEAR(transaksi.tanggal_transaksi)'), array($tahun1, $tahun2))->
                            where('menu.kategori_menu', '=', 'Side Dish')->
                            select(DB::raw("YEAR(transaksi.tanggal_transaksi) year") , DB::raw('sum(detail_pesanan.qty_item_pesanan * menu.harga_menu)AS Sub_Total'))->
                            groupBy('year') -> get();

        if(!is_null($pesanan)>0){
            return response([
                'message' => 'Retrieve All Success',
                'data'  => $pesanan
            ],200);
        }       
        
        return response([
            'message' => 'Empty',
            'data' => null
        ], 404);
    }

    public function laporanPendapatanMinumanTahunan($tahun1, $tahun2){
        $pesanan = DB::table('pesanan')->join('Reservasi' , 'pesanan.id_reservasi', '=' , 'reservasi.id_reservasi') ->
                            join( 'meja' , 'reservasi.id_meja', '=' ,'meja.id_meja') ->
                            join('customer' , 'reservasi.id_customer', '=' ,'customer.id_customer') ->
                            join('detail_pesanan' , 'detail_pesanan.id_pesanan', '=' ,'pesanan.id_pesanan') ->
                            join('menu' , 'menu.id_menu', '=' ,'detail_pesanan.id_menu') ->
                            join('bahan' , 'bahan.id_bahan', '=' ,'menu.id_bahan') ->
                            join('transaksi' , 'transaksi.id_pesanan', '=' ,'pesanan.id_pesanan') ->
                            whereBetween(DB::raw('YEAR(transaksi.tanggal_transaksi)'), array($tahun1, $tahun2))->
                            where('menu.kategori_menu', '=', 'Minuman')->
                            select(DB::raw("YEAR(transaksi.tanggal_transaksi) year") , DB::raw('sum(detail_pesanan.qty_item_pesanan * menu.harga_menu)AS Sub_Total'))->
                            groupBy('year') -> get();

        if(!is_null($pesanan)>0){
            return response([
                'message' => 'Retrieve All Success',
                'data'  => $pesanan
            ],200);
        }       
        
        return response([
            'message' => 'Empty',
            'data' => null
        ], 404);
    }

    public function getTotalPendapatanTahunan($tahun1, $tahun2){
        $pesanan = DB::table('pesanan')->join('Reservasi' , 'pesanan.id_reservasi', '=' , 'reservasi.id_reservasi') ->
                            join( 'meja' , 'reservasi.id_meja', '=' ,'meja.id_meja') ->
                            join('customer' , 'reservasi.id_customer', '=' ,'customer.id_customer') ->
                            join('detail_pesanan' , 'detail_pesanan.id_pesanan', '=' ,'pesanan.id_pesanan') ->
                            join('menu' , 'menu.id_menu', '=' ,'detail_pesanan.id_menu') ->
                            join('bahan' , 'bahan.id_bahan', '=' ,'menu.id_bahan') ->
                            join('transaksi' , 'transaksi.id_pesanan', '=' ,'pesanan.id_pesanan') ->
                            whereBetween(DB::raw('YEAR(transaksi.tanggal_transaksi)'), array($tahun1, $tahun2))->
                            select(DB::raw("YEAR(transaksi.tanggal_transaksi) year") , DB::raw('sum(detail_pesanan.qty_item_pesanan * menu.harga_menu)AS Sub_Total'))->
                            groupBy('year') -> get();

        if(!is_null($pesanan)>0){
            return response([
                'message' => 'Retrieve All Success',
                'data'  => $pesanan
            ],200);
        }       
        
        return response([
            'message' => 'Empty',
            'data' => null
        ], 404);
    }
}
