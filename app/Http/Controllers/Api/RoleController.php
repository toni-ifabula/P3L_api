<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Validator;
use App\Role;

class RoleController extends Controller
{
    // SHOW ALL
    public function index(){
        $role = Role::all();

        if(count($role) > 0){
            return response([
                'message' => 'Retrieve All Success',
                'data' => $role
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
            'NAMA_ROLE' => 'required|alpha',
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);
        
        $role = Role::create($storeData);
        return response([
            'message' => 'Create Role Success',
            'data' => $role,
        ], 200);
    }

    // UPDATE
    public function update(Request $request, $id){
        $role = Role::find($id);
        if(is_null($role)){
            return response([
                'message' => 'Role Not Found',
                'data' => null
            ], 404);
        }

        $updateData = $request->all();
        $validate = Validator::make($updateData, [
            'NAMA_ROLE' => 'required|alpha'
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);
        
        $role->NAMA_ROLE = $updateData['NAMA_ROLE'];

        if($role->save()){
            return response([
                'message' => 'Update Role Success',
                'data' => $role,
            ], 200);
        }
        
        return response([
            'message' => 'Update Role Failed',
            'data' => null
        ], 400);
    }
}
