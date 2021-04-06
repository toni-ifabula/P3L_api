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
    Route::post('role', 'Api\RoleController@store');
    Route::put('role/{id}', 'Api\RoleController@update');

    Route::get('karyawan', 'Api\KaryawanController@index');
    Route::post('karyawan', 'Api\KaryawanController@store');
    Route::put('karyawan/{id}', 'Api\KaryawanController@update');
    Route::put('resignKaryawan/{id}', 'Api\KaryawanController@resign');

    Route::get('meja', 'Api\MejaController@index');
    Route::post('meja', 'Api\MejaController@store');
    Route::put('meja/{id}', 'Api\MejaController@update');
    Route::delete('meja/{id}', 'Api\MejaController@destroy');

    Route::get('customer', 'Api\CustomerController@index');
    Route::post('customer', 'Api\CustomerController@store');
    Route::put('customer/{id}', 'Api\CustomerController@update');
    Route::delete('customer/{id}', 'Api\CustomerController@destroy');
});