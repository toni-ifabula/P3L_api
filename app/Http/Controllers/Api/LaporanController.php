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

        $utama = DB::table('pesanan')->join('reservasi' , 'pesanan.ID_RESERVASI', '=' , 'reservasi.ID_RESERVASI')
            ->join( 'meja' , 'reservasi.ID_MEJA', '=' ,'meja.ID_MEJA')
            ->join('customer' , 'reservasi.ID_CUSTOMER', '=' ,'customer.ID_CUSTOMER')
            ->join('detail_pesanan' , 'detail_pesanan.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->join('menu' , 'detail_pesanan.ID_MENU', '=' ,'menu.ID_MENU')
            ->join('stok_bahan' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->join('transaksi' , 'transaksi.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->whereYear('transaksi.TANGGAL_TRANSAKSI', '=', $tahun)
            ->where('menu.KATEGORI_MENU', '=', 'Makanan Utama')
            ->select(DB::raw("MONTHNAME(transaksi.TANGGAL_TRANSAKSI) month"), 
                DB::raw('sum(detail_pesanan.JUMLAH_ITEM_PESANAN * menu.HARGA_MENU)AS subtotal'))
            ->groupBy('month')
            ->groupBy('menu.KATEGORI_MENU')
            ->get();

        $sideDish = DB::table('pesanan')->join('reservasi' , 'pesanan.ID_RESERVASI', '=' , 'reservasi.ID_RESERVASI')
            ->join( 'meja' , 'reservasi.ID_MEJA', '=' ,'meja.ID_MEJA')
            ->join('customer' , 'reservasi.ID_CUSTOMER', '=' ,'customer.ID_CUSTOMER')
            ->join('detail_pesanan' , 'detail_pesanan.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->join('menu' , 'detail_pesanan.ID_MENU', '=' ,'menu.ID_MENU')
            ->join('stok_bahan' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->join('transaksi' , 'transaksi.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->whereYear('transaksi.TANGGAL_TRANSAKSI', '=', $tahun)
            ->where('menu.KATEGORI_MENU', '=', 'Makanan Side Dish')
            ->select(DB::raw("MONTHNAME(transaksi.TANGGAL_TRANSAKSI) month"), 
                DB::raw('sum(detail_pesanan.JUMLAH_ITEM_PESANAN * menu.HARGA_MENU)AS subtotal'))
            ->groupBy('month')
            ->get();

        $minuman = DB::table('pesanan')->join('reservasi' , 'pesanan.ID_RESERVASI', '=' , 'reservasi.ID_RESERVASI')
            ->join( 'meja' , 'reservasi.ID_MEJA', '=' ,'meja.ID_MEJA')
            ->join('customer' , 'reservasi.ID_CUSTOMER', '=' ,'customer.ID_CUSTOMER')
            ->join('detail_pesanan' , 'detail_pesanan.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->join('menu' , 'detail_pesanan.ID_MENU', '=' ,'menu.ID_MENU')
            ->join('stok_bahan' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->join('transaksi' , 'transaksi.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->whereYear('transaksi.TANGGAL_TRANSAKSI', '=', $tahun)
            ->where('menu.KATEGORI_MENU', '=', 'Minuman')
            ->select(DB::raw("MONTHNAME(transaksi.TANGGAL_TRANSAKSI) month"), 
                DB::raw('sum(detail_pesanan.JUMLAH_ITEM_PESANAN * menu.HARGA_MENU)AS subtotal'))
            ->groupBy('month')
            ->get();

        $total = DB::table('pesanan')->join('reservasi' , 'pesanan.ID_RESERVASI', '=' , 'reservasi.ID_RESERVASI')
            ->join( 'meja' , 'reservasi.ID_MEJA', '=' ,'meja.ID_MEJA')
            ->join('customer' , 'reservasi.ID_CUSTOMER', '=' ,'customer.ID_CUSTOMER')
            ->join('detail_pesanan' , 'detail_pesanan.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->join('menu' , 'detail_pesanan.ID_MENU', '=' ,'menu.ID_MENU')
            ->join('stok_bahan' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->join('transaksi' , 'transaksi.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->whereYear('transaksi.TANGGAL_TRANSAKSI', '=', $tahun)
            ->select(DB::raw("MONTHNAME(transaksi.TANGGAL_TRANSAKSI) month"), 
                DB::raw('sum(detail_pesanan.JUMLAH_ITEM_PESANAN * menu.HARGA_MENU)AS subtotal'))
            ->groupBy('month')
            ->get();

        if(!is_null($utama) && !is_null($sideDish) && !is_null($minuman) && !is_null($total)){
            return response([
                'message' => 'Retrieve All Success',
                'utama'  => $utama,
                'sideDish' => $sideDish,
                'minuman' => $minuman,
                'total' => $total
            ],200);
        }       
        
        return response([
            'message' => 'Empty',
            'data' => null
        ], 404);
    }

    public function laporanPendapatanTahunan($tahun1, $tahun2){
        $utama = DB::table('pesanan')->join('reservasi' , 'pesanan.ID_RESERVASI', '=' , 'reservasi.ID_RESERVASI')
            ->join( 'meja' , 'reservasi.ID_MEJA', '=' ,'meja.ID_MEJA')
            ->join('customer' , 'reservasi.ID_CUSTOMER', '=' ,'customer.ID_CUSTOMER')
            ->join('detail_pesanan' , 'detail_pesanan.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->join('menu' , 'detail_pesanan.ID_MENU', '=' ,'menu.ID_MENU')
            ->join('stok_bahan' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->join('transaksi' , 'transaksi.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->whereBetween(DB::raw('YEAR(transaksi.TANGGAL_TRANSAKSI)'), array($tahun1, $tahun2))
            ->where('menu.KATEGORI_MENU', '=', 'Makanan Utama')
            ->select(DB::raw("YEAR(transaksi.TANGGAL_TRANSAKSI) year"), 
                DB::raw('sum(detail_pesanan.JUMLAH_ITEM_PESANAN * menu.HARGA_MENU)AS subtotal'))
            ->groupBy('year')
            ->get();

        $sideDish = DB::table('pesanan')->join('reservasi' , 'pesanan.ID_RESERVASI', '=' , 'reservasi.ID_RESERVASI')
            ->join( 'meja' , 'reservasi.ID_MEJA', '=' ,'meja.ID_MEJA')
            ->join('customer' , 'reservasi.ID_CUSTOMER', '=' ,'customer.ID_CUSTOMER')
            ->join('detail_pesanan' , 'detail_pesanan.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->join('menu' , 'detail_pesanan.ID_MENU', '=' ,'menu.ID_MENU')
            ->join('stok_bahan' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->join('transaksi' , 'transaksi.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->whereBetween(DB::raw('YEAR(transaksi.TANGGAL_TRANSAKSI)'), array($tahun1, $tahun2))
            ->where('menu.KATEGORI_MENU', '=', 'Makanan Side Dish')
            ->select(DB::raw("YEAR(transaksi.TANGGAL_TRANSAKSI) year"), 
                DB::raw('sum(detail_pesanan.JUMLAH_ITEM_PESANAN * menu.HARGA_MENU)AS subtotal'))
            ->groupBy('year')
            ->get();

        $minuman = DB::table('pesanan')->join('reservasi' , 'pesanan.ID_RESERVASI', '=' , 'reservasi.ID_RESERVASI')
            ->join( 'meja' , 'reservasi.ID_MEJA', '=' ,'meja.ID_MEJA')
            ->join('customer' , 'reservasi.ID_CUSTOMER', '=' ,'customer.ID_CUSTOMER')
            ->join('detail_pesanan' , 'detail_pesanan.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->join('menu' , 'detail_pesanan.ID_MENU', '=' ,'menu.ID_MENU')
            ->join('stok_bahan' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->join('transaksi' , 'transaksi.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->whereBetween(DB::raw('YEAR(transaksi.TANGGAL_TRANSAKSI)'), array($tahun1, $tahun2))
            ->where('menu.KATEGORI_MENU', '=', 'Minuman')
            ->select(DB::raw("YEAR(transaksi.TANGGAL_TRANSAKSI) year"), 
                DB::raw('sum(detail_pesanan.JUMLAH_ITEM_PESANAN * menu.HARGA_MENU)AS subtotal'))
            ->groupBy('year')
            ->get();

        $total = DB::table('pesanan')->join('reservasi' , 'pesanan.ID_RESERVASI', '=' , 'reservasi.ID_RESERVASI')
            ->join( 'meja' , 'reservasi.ID_MEJA', '=' ,'meja.ID_MEJA')
            ->join('customer' , 'reservasi.ID_CUSTOMER', '=' ,'customer.ID_CUSTOMER')
            ->join('detail_pesanan' , 'detail_pesanan.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->join('menu' , 'detail_pesanan.ID_MENU', '=' ,'menu.ID_MENU')
            ->join('stok_bahan' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->join('transaksi' , 'transaksi.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->whereBetween(DB::raw('YEAR(transaksi.TANGGAL_TRANSAKSI)'), array($tahun1, $tahun2))
            ->select(DB::raw("YEAR(transaksi.TANGGAL_TRANSAKSI) year"), 
                DB::raw('sum(detail_pesanan.JUMLAH_ITEM_PESANAN * menu.HARGA_MENU)AS subtotal'))
            ->groupBy('year')
            ->get();

        if(!is_null($utama) && !is_null($sideDish) && !is_null($minuman) && !is_null($total)){
            return response([
                'message' => 'Retrieve All Success',
                'utama'  => $utama,
                'sideDish' => $sideDish,
                'minuman' => $minuman,
                'total' => $total,
            ],200);
        }       
        
        return response([
            'message' => 'Empty',
            'data' => null
        ], 404);
    }

    public function laporanPengeluaranBulanan($tahun){
        $utama = DB::table('stok_bahan')
            ->join('detail_stok_bahan' , 'detail_stok_bahan.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->join('menu' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->whereYear('detail_stok_bahan.TANGGAL_MASUK_STOK', '=', $tahun)
            ->where('menu.KATEGORI_MENU', '=', 'Makanan Utama')
            ->select(DB::raw("MONTHNAME(detail_stok_bahan.TANGGAL_MASUK_STOK) month"), 
                DB::raw('sum(stok_bahan.HARGA_STOK * detail_stok_bahan.INCOMING_STOK)AS subtotal'))
            ->groupBy('month')
            ->get();
        
        $sideDish = DB::table('stok_bahan')
            ->join('detail_stok_bahan' , 'detail_stok_bahan.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->join('menu' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->whereYear('detail_stok_bahan.TANGGAL_MASUK_STOK', '=', $tahun)
            ->where('menu.KATEGORI_MENU', '=', 'Makanan Side Dish')
            ->select(DB::raw("MONTHNAME(detail_stok_bahan.TANGGAL_MASUK_STOK) month"), 
                DB::raw('sum(stok_bahan.HARGA_STOK * detail_stok_bahan.INCOMING_STOK)AS subtotal'))
            ->groupBy('month')
            ->get();

        $minuman = DB::table('stok_bahan')
            ->join('detail_stok_bahan' , 'detail_stok_bahan.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->join('menu' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->whereYear('detail_stok_bahan.TANGGAL_MASUK_STOK', '=', $tahun)
            ->where('menu.KATEGORI_MENU', '=', 'Minuman')
            ->select(DB::raw("MONTHNAME(detail_stok_bahan.TANGGAL_MASUK_STOK) month"), 
                DB::raw('sum(stok_bahan.HARGA_STOK * detail_stok_bahan.INCOMING_STOK)AS subtotal'))
            ->groupBy('month')
            ->get();

        $total = DB::table('stok_bahan')
            ->join('detail_stok_bahan' , 'detail_stok_bahan.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->join('menu' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->whereYear('detail_stok_bahan.TANGGAL_MASUK_STOK', '=', $tahun)
            ->select(DB::raw("MONTHNAME(detail_stok_bahan.TANGGAL_MASUK_STOK) month"),
                DB::raw('sum(stok_bahan.HARGA_STOK * detail_stok_bahan.INCOMING_STOK)AS subtotal'))
            ->groupBy('month')
            ->get();

        if(!is_null($utama) && !is_null($sideDish) && !is_null($minuman) && !is_null($total)){
            return response([
                'message' => 'Retrieve All Success',
                'utama'  => $utama,
                'sideDish' => $sideDish,
                'minuman' => $minuman,
                'total' => $total,
            ],200);
        }       
        
        return response([
            'message' => 'Empty',
            'data' => null
        ], 404);
    }

    public function laporanPengeluaranTahunan($tahun1, $tahun2){
        $utama = DB::table('stok_bahan')
            ->join('detail_stok_bahan' , 'detail_stok_bahan.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->join('menu' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->whereBetween(DB::raw('YEAR(detail_stok_bahan.TANGGAL_MASUK_STOK)'), array($tahun1, $tahun2))
            ->where('menu.KATEGORI_MENU', '=', 'Makanan Utama')
            ->select(DB::raw("YEAR(detail_stok_bahan.TANGGAL_MASUK_STOK) year"),
                DB::raw('sum(stok_bahan.HARGA_STOK * menu.HARGA_MENU)AS subtotal'))
            ->groupBy('year')
            ->get();

        $sideDish = DB::table('stok_bahan')
            ->join('detail_stok_bahan' , 'detail_stok_bahan.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->join('menu' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->whereBetween(DB::raw('YEAR(detail_stok_bahan.TANGGAL_MASUK_STOK)'), array($tahun1, $tahun2))
            ->where('menu.KATEGORI_MENU', '=', 'Makanan Side Dish')
            ->select(DB::raw("YEAR(detail_stok_bahan.TANGGAL_MASUK_STOK) year"),
                DB::raw('sum(stok_bahan.HARGA_STOK * menu.HARGA_MENU)AS subtotal'))
            ->groupBy('year')
            ->get();

        $minuman = DB::table('stok_bahan')
            ->join('detail_stok_bahan' , 'detail_stok_bahan.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->join('menu' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->whereBetween(DB::raw('YEAR(detail_stok_bahan.TANGGAL_MASUK_STOK)'), array($tahun1, $tahun2))
            ->where('menu.KATEGORI_MENU', '=', 'Minuman')
            ->select(DB::raw("YEAR(detail_stok_bahan.TANGGAL_MASUK_STOK) year"),
                DB::raw('sum(stok_bahan.HARGA_STOK * menu.HARGA_MENU)AS subtotal'))
            ->groupBy('year')
            ->get();

        $total = DB::table('stok_bahan')
            ->join('detail_stok_bahan' , 'detail_stok_bahan.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->join('menu' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->whereBetween(DB::raw('YEAR(detail_stok_bahan.TANGGAL_MASUK_STOK)'), array($tahun1, $tahun2))
            ->select(DB::raw("YEAR(detail_stok_bahan.TANGGAL_MASUK_STOK) year"),
                DB::raw('sum(stok_bahan.HARGA_STOK * menu.HARGA_MENU)AS subtotal'))
            ->groupBy('year')
            ->get();

        if(!is_null($utama) && !is_null($sideDish) && !is_null($minuman) && !is_null($total)){
            return response([
                'message' => 'Retrieve All Success',
                'utama'  => $utama,
                'sideDish' => $sideDish,
                'minuman' => $minuman,
                'total' => $total,
            ],200);
        }  
        
        return response([
            'message' => 'Empty',
            'data' => null
        ], 404);
    }

    public function laporanPenjualanPerBulan($tahun, $bulan){
        $utama = DB::table('pesanan')->join('reservasi' , 'pesanan.ID_RESERVASI', '=' , 'reservasi.ID_RESERVASI')
            ->join( 'meja' , 'reservasi.ID_MEJA', '=' ,'meja.ID_MEJA')
            ->join('customer' , 'reservasi.ID_CUSTOMER', '=' ,'customer.ID_CUSTOMER')
            ->join('detail_pesanan' , 'detail_pesanan.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->join('menu' , 'detail_pesanan.ID_MENU', '=' ,'menu.ID_MENU')
            ->join('stok_bahan' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->join('transaksi' , 'transaksi.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->whereYear('transaksi.TANGGAL_TRANSAKSI', '=', $tahun)
            ->whereMonth('transaksi.TANGGAL_TRANSAKSI', '=', $bulan)
            ->where('menu.KATEGORI_MENU', '=', 'Makanan Utama')
            ->select(DB::raw('max(detail_pesanan.JUMLAH_ITEM_PESANAN) as max' ),
                DB::raw('sum(detail_pesanan.JUMLAH_ITEM_PESANAN) AS total'), 'menu.NAMA_MENU', 'menu.UNIT_MENU')
            ->groupBy('menu.NAMA_MENU', 'menu.UNIT_MENU')
            ->get();

        $sideDish = DB::table('pesanan')->join('reservasi' , 'pesanan.ID_RESERVASI', '=' , 'reservasi.ID_RESERVASI')
            ->join( 'meja' , 'reservasi.ID_MEJA', '=' ,'meja.ID_MEJA')
            ->join('customer' , 'reservasi.ID_CUSTOMER', '=' ,'customer.ID_CUSTOMER')
            ->join('detail_pesanan' , 'detail_pesanan.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->join('menu' , 'detail_pesanan.ID_MENU', '=' ,'menu.ID_MENU')
            ->join('stok_bahan' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->join('transaksi' , 'transaksi.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->whereYear('transaksi.TANGGAL_TRANSAKSI', '=', $tahun)
            ->whereMonth('transaksi.TANGGAL_TRANSAKSI', '=', $bulan)
            ->where('menu.KATEGORI_MENU', '=', 'Makanan Side Dish')
            ->select(DB::raw('max(detail_pesanan.JUMLAH_ITEM_PESANAN) as max' ),
                DB::raw('sum(detail_pesanan.JUMLAH_ITEM_PESANAN) AS total'), 'menu.NAMA_MENU', 'menu.UNIT_MENU')
            ->groupBy('menu.NAMA_MENU', 'menu.UNIT_MENU')
            ->get();

        $minuman = DB::table('pesanan')->join('reservasi' , 'pesanan.ID_RESERVASI', '=' , 'reservasi.ID_RESERVASI')
            ->join( 'meja' , 'reservasi.ID_MEJA', '=' ,'meja.ID_MEJA')
            ->join('customer' , 'reservasi.ID_CUSTOMER', '=' ,'customer.ID_CUSTOMER')
            ->join('detail_pesanan' , 'detail_pesanan.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->join('menu' , 'detail_pesanan.ID_MENU', '=' ,'menu.ID_MENU')
            ->join('stok_bahan' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->join('transaksi' , 'transaksi.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->whereYear('transaksi.TANGGAL_TRANSAKSI', '=', $tahun)
            ->whereMonth('transaksi.TANGGAL_TRANSAKSI', '=', $bulan)
            ->where('menu.KATEGORI_MENU', '=', 'Minuman')
            ->select(DB::raw('max(detail_pesanan.JUMLAH_ITEM_PESANAN) as max' ),
                DB::raw('sum(detail_pesanan.JUMLAH_ITEM_PESANAN) AS total'), 'menu.NAMA_MENU', 'menu.UNIT_MENU')
            ->groupBy('menu.NAMA_MENU', 'menu.UNIT_MENU')
            ->get();


        if(!is_null($utama) && !is_null($sideDish) && !is_null($minuman)){
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

    public function laporanPenjualanSetahun($tahun){
        $utama = DB::table('pesanan')->join('reservasi' , 'pesanan.ID_RESERVASI', '=' , 'reservasi.ID_RESERVASI')
            ->join( 'meja' , 'reservasi.ID_MEJA', '=' ,'meja.ID_MEJA')
            ->join('customer' , 'reservasi.ID_CUSTOMER', '=' ,'customer.ID_CUSTOMER')
            ->join('detail_pesanan' , 'detail_pesanan.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->join('menu' , 'detail_pesanan.ID_MENU', '=' ,'menu.ID_MENU')
            ->join('stok_bahan' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->join('transaksi' , 'transaksi.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->whereYear('transaksi.TANGGAL_TRANSAKSI', '=', $tahun)
            ->where('menu.KATEGORI_MENU', '=', 'Makanan Utama')
            ->select(DB::raw('max(detail_pesanan.JUMLAH_ITEM_PESANAN) as max' ),
                DB::raw('sum(detail_pesanan.JUMLAH_ITEM_PESANAN) AS total'), 'menu.NAMA_MENU', 'menu.UNIT_MENU')
            ->groupBy('menu.NAMA_MENU', 'menu.UNIT_MENU')
            ->get();

        $sideDish = DB::table('pesanan')->join('reservasi' , 'pesanan.ID_RESERVASI', '=' , 'reservasi.ID_RESERVASI')
            ->join( 'meja' , 'reservasi.ID_MEJA', '=' ,'meja.ID_MEJA')
            ->join('customer' , 'reservasi.ID_CUSTOMER', '=' ,'customer.ID_CUSTOMER')
            ->join('detail_pesanan' , 'detail_pesanan.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->join('menu' , 'detail_pesanan.ID_MENU', '=' ,'menu.ID_MENU')
            ->join('stok_bahan' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->join('transaksi' , 'transaksi.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->whereYear('transaksi.TANGGAL_TRANSAKSI', '=', $tahun)
            ->where('menu.KATEGORI_MENU', '=', 'Makanan Side Dish')
            ->select(DB::raw('max(detail_pesanan.JUMLAH_ITEM_PESANAN) as max' ),
                DB::raw('sum(detail_pesanan.JUMLAH_ITEM_PESANAN) AS total'), 'menu.NAMA_MENU', 'menu.UNIT_MENU')
            ->groupBy('menu.NAMA_MENU', 'menu.UNIT_MENU')
            ->get();

        $minuman = DB::table('pesanan')->join('reservasi' , 'pesanan.ID_RESERVASI', '=' , 'reservasi.ID_RESERVASI')
            ->join( 'meja' , 'reservasi.ID_MEJA', '=' ,'meja.ID_MEJA')
            ->join('customer' , 'reservasi.ID_CUSTOMER', '=' ,'customer.ID_CUSTOMER')
            ->join('detail_pesanan' , 'detail_pesanan.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->join('menu' , 'detail_pesanan.ID_MENU', '=' ,'menu.ID_MENU')
            ->join('stok_bahan' , 'menu.ID_STOK', '=' ,'stok_bahan.ID_STOK')
            ->join('transaksi' , 'transaksi.ID_PESANAN', '=' ,'pesanan.ID_PESANAN')
            ->whereYear('transaksi.TANGGAL_TRANSAKSI', '=', $tahun)
            ->where('menu.KATEGORI_MENU', '=', 'Minuman')
            ->select(DB::raw('max(detail_pesanan.JUMLAH_ITEM_PESANAN) as max' ),
                DB::raw('sum(detail_pesanan.JUMLAH_ITEM_PESANAN) AS total'), 'menu.NAMA_MENU', 'menu.UNIT_MENU')
            ->groupBy('menu.NAMA_MENU', 'menu.UNIT_MENU')
            ->get();

        if(!is_null($utama) && !is_null($sideDish) && !is_null($minuman)){
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

    public function laporanStokPerBulan($namaStok, $tahun, $bulan) {
        // $data = $request->all();

        // $validate = Validator::make($data, [
        //     'NAMA_MENU' => 'required',
        // ]);

        // if($validate->fails())
        //     return response(['message' => $validate->errors()], 400);

        $stokBahan = DB::table('stok_bahan')
            ->join('detail_stok_bahan', 'detail_stok_bahan.ID_STOK', '=', 'stok_bahan.ID_STOK')
            ->where('stok_bahan.NAMA_STOK', '=', $namaStok)
            ->whereYear('detail_stok_bahan.TANGGAL_MASUK_STOK', '=', $tahun)
            ->whereMonth('detail_stok_bahan.TANGGAL_MASUK_STOK', '=', $bulan)
            ->select("detail_stok_bahan.*", "stok_bahan.UNIT_STOK")
            ->get();

        if(!is_null($stokBahan)){
            return response([
                'message' => 'Retrieve All Success',
                'data'  => $stokBahan,
            ],200);
        }    
        
        return response([
            'message' => 'Empty',
            'data' => null
        ], 404);
    }
}
