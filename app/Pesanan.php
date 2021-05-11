<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pesanan extends Model
{
    protected $table = 'pesanan';

    protected $primaryKey = 'ID_PESANAN';

    public $timestamps = false;

    protected $fillable = [
        'ID_KARYAWAN',
        'ID_RESERVASI',
        'STATUS_PESANAN',
        'SUBTOTAL_PESANAN',
        'SERVICE_PESANAN',
        'TAX_PESANAN',
        'TOTAL_PESANAN',
        'TOTAL_JUMLAH_PESANAN',
        'TOTAL_ITEM_PESANAN',
        'STATUS_LUNAS_PESANAN',
    ];
}
