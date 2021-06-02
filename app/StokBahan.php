<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StokBahan extends Model
{
    protected $table = 'stok_bahan';

    protected $primaryKey = 'ID_STOK';

    public $timestamps = false;

    protected $fillable = [
        'NAMA_STOK',
        'SERVING_STOK',
        'UNIT_STOK',
        'HARGA_STOK',
    ];
}
