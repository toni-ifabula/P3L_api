<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// GET CURRENT USER DETAILS
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('login', 'Api\KaryawanController@login');

Route::group(['middleware' => 'auth:api'], function(){
    Route::get('role', 'Api\RoleController@index');
    Route::get('IDRole/{nama}', 'Api\RoleController@getIDbyNama');
    Route::post('role', 'Api\RoleController@store');
    Route::put('role/{id}', 'Api\RoleController@update');

    Route::get('karyawanIndex', 'Api\KaryawanController@index');
    Route::get('karyawan', 'Api\KaryawanController@indexCustom');
    Route::post('karyawan', 'Api\KaryawanController@store');
    Route::put('karyawan/{id}', 'Api\KaryawanController@update');
    Route::put('resignKaryawan/{id}', 'Api\KaryawanController@resign');

    Route::get('meja', 'Api\MejaController@index');
    Route::get('IDMeja/{nomor}', 'Api\MejaController@getIDbyNomor');
    Route::post('meja', 'Api\MejaController@store');
    Route::put('meja/{id}', 'Api\MejaController@update');
    Route::delete('meja/{id}', 'Api\MejaController@destroy');
    Route::get('mejaKosong/{idMeja}', 'Api\MejaController@setStatusKosong');

    Route::get('customer', 'Api\CustomerController@index');
    Route::get('IDCustomer/{nama}', 'Api\CustomerController@getIDbyNama');
    Route::post('customer', 'Api\CustomerController@store');
    Route::put('customer/{id}', 'Api\CustomerController@update');
    Route::delete('customer/{id}', 'Api\CustomerController@destroy');

    Route::get('stokBahan', 'Api\StokBahanController@index');
    Route::get('IDStokBahan/{nama}', 'Api\StokBahanController@getIDbyNama');
    Route::post('stokBahan', 'Api\StokBahanController@store');
    Route::put('stokBahan/{id}', 'Api\StokBahanController@update');
    Route::delete('stokBahan/{id}', 'Api\StokBahanController@destroy');

    Route::get('reservasiIndex', 'Api\ReservasiController@index');
    Route::get('reservasi', 'Api\ReservasiController@indexCustom');
    Route::post('reservasi', 'Api\ReservasiController@store');
    Route::put('reservasi/{id}', 'Api\ReservasiController@update');
    Route::delete('reservasi/{id}', 'Api\ReservasiController@destroy');
    
    Route::get('detailStokAll', 'Api\DetailStokController@index');
    Route::get('detailStok/{id}', 'Api\DetailStokController@showByID');
    Route::post('detailStok', 'Api\DetailStokController@store');
    Route::put('detailStok/{id}', 'Api\DetailStokController@update');
    Route::delete('detailStok/{id}', 'Api\DetailStokController@destroy');
    Route::post('detailPesananAutoCalc', 'Api\DetailStokController@calcRemainingWaste');
    
    Route::post('menu', 'Api\MenuController@store');
    Route::put('menu/{id}', 'Api\MenuController@update');
    Route::delete('menu/{id}', 'Api\MenuController@destroy');

    Route::put('pesanan/{id}', 'Api\PesananController@update');
    Route::delete('pesanan/{id}', 'Api\PesananController@destroy');
    Route::put('statusPesanan/{id}', 'Api\PesananController@statusDisajikan');
    Route::put('statusLunasPesanan/{id}', 'Api\PesananController@statusLunas');
    Route::get('mejaBelumBayar', 'Api\PesananController@getMejaBelumBayar');
    Route::get('pembayaranInfo/{nomorMeja}', 'Api\PesananController@getInfoByNomorMeja');

    Route::put('detailPesanan/{id}', 'Api\DetailPesananController@update');
    Route::delete('detailPesanan/{id}', 'Api\DetailPesananController@destroy');

    Route::get('transaksiIndex', 'Api\TransaksiController@index');
    Route::get('transaksi', 'Api\TransaksiController@indexCustom');
    Route::post('transaksi', 'Api\TransaksiController@store');
    Route::put('transaksi/{id}', 'Api\TransaksiController@update');
    Route::delete('transaksi/{id}', 'Api\TransaksiController@destroy');
    Route::get('transaksiStruk/{idTransaksi}', 'Api\TransaksiController@getStrukInfo');
});

Route::get('menuIndex', 'Api\MenuController@index');
Route::get('menu', 'Api\MenuController@indexCustom');
Route::get('reservasiRelation/{id}', 'Api\ReservasiController@getReservasiRelation');
Route::get('pesananIndex', 'Api\PesananController@index');
Route::get('pesanan', 'Api\PesananController@indexCustom');
Route::post('pesanan', 'Api\PesananController@store');
Route::get('checkPesanan/{idReservasi}', 'Api\PesananController@checkPesananByReservasi');
Route::get('detailPesanan/{id}', 'Api\DetailPesananController@showByIdPesanan');
Route::post('detailPesanan', 'Api\DetailPesananController@store');
Route::get('totalPesanan/{id}', 'Api\PesananController@updatePesananTotal');
Route::get('detailPesanan', 'Api\DetailPesananController@index');
// Route::post('jumlahDetailPesanan/{id}', 'Api\DetailPesananController@nambahJumlahPesanan');
Route::put('detailPesanan/{id}', 'Api\DetailPesananController@update');