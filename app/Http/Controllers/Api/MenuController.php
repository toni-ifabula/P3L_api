<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Validator;
use App\Menu;

class MenuController extends Controller
{
    // SHOW ALL
    public function index(){
        $menu = Menu::all();

        if(count($menu) > 0){
            return response([
                'message' => 'Retrieve All Success',
                'data' => $menu
            ], 200);
        }

        return response([
            'message' => 'Empty',
            'daa' => null
        ], 404);
    }

    // SHOW ALL CUSTOM
    public function indexCustom(){
        $menu = Menu::join('stok_bahan', 'menu.ID_STOK', '=', 'stok_bahan.ID_STOK')
            ->select('menu.*', 'stok_bahan.NAMA_STOK')
            ->get();

        if(count($menu) > 0){
            return response([
                'message' => 'Retrieve All Success',
                'data' => $menu
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
            'ID_STOK' => 'required|numeric',
            'KATEGORI_MENU' => 'required',
            'NAMA_MENU' => 'required|unique:menu',
            'DESKRIPSI_MENU' => 'required',
            'UNIT_MENU' => 'required',
            'HARGA_MENU' => 'required|numeric',
            'IMAGE' => 'required'
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);
        
        $menu = Menu::create($storeData);
        return response([
            'message' => 'Create Menu Success',
            'data' => $menu,
        ], 200);
    }

    // UPDATE
    public function update(Request $request, $id){
        $menu = Menu::find($id);
        if(is_null($menu)){
            return response([
                'message' => 'Menu Not Found',
                'data' => null
            ], 404);
        }

        $updateData = $request->all();
        $validate = Validator::make($updateData, [
            'ID_STOK' => 'required|numeric',
            'KATEGORI_MENU' => 'required',
            'NAMA_MENU' => ['required', Rule::unique('menu')->ignore($menu)],
            'DESKRIPSI_MENU' => 'required',
            'UNIT_MENU' => 'required',
            'HARGA_MENU' => 'required|numeric',
            'IMAGE' => 'required'
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);
        
        $menu->ID_STOK = $updateData['ID_STOK'];
        $menu->KATEGORI_MENU = $updateData['KATEGORI_MENU'];
        $menu->NAMA_MENU = $updateData['NAMA_MENU'];
        $menu->DESKRIPSI_MENU = $updateData['DESKRIPSI_MENU'];
        $menu->UNIT_MENU = $updateData['UNIT_MENU'];
        $menu->HARGA_MENU = $updateData['HARGA_MENU'];
        $menu->IMAGE = $updateData['IMAGE'];

        if($menu->save()){
            return response([
                'message' => 'Update Menu Success',
                'data' => $menu,
            ], 200);
        }
        
        return response([
            'message' => 'Update Menu Failed',
            'data' => null
        ], 400);
    }

    // DELETE
    public function destroy($id){
        $menu = Menu::find($id);

        if(is_null($menu)){
            return response([
                'message' => 'Menu Not Found',
                'data' => null
            ], 404);
        }

        if($menu->delete()){
            return response([
                'message' => 'Delete Menu Success',
                'data' => $menu
            ], 200);
        }

        return response([
            'message' => 'Delete Menu Failed',
            'data' => null
        ], 400);
    }
}
