<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DetailPesanan extends Model
{
    protected $table = 'detail_pesanan';

    protected $primaryKey = 'ID_DETAIL_PESANAN';

    public $timestamps = false;

    protected $fillable = [
        'ID_PESANAN',
        'ID_MENU',
        'JUMLAH_ITEM_PESANAN',
        'SUBTOTAL_ITEM_PESANAN'
    ];
}
