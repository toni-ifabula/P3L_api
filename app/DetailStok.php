<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DetailStok extends Model
{
    protected $table = 'detail_stok_bahan';

    protected $primaryKey = 'ID_DETAIL_STOK';

    public $timestamps = false;

    protected $fillable = [
        'ID_STOK',
        'TANGGAL_MASUK_STOK',
        'INCOMING_STOK',
        'REMAINING_STOK',
        'WASTE_STOK'
    ];
}
