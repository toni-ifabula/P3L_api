<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    protected $table = 'menu';

    protected $primaryKey = 'ID_MENU';

    public $timestamps = false;

    protected $fillable = [
        'ID_STOK',
        'KATEGORI_MENU',
        'NAMA_MENU',
        'DESKRIPSI_MENU',
        'UNIT_MENU',
        'HARGA_MENU'
    ];
}
