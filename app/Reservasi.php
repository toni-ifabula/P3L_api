<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Reservasi extends Model
{
    protected $table = 'reservasi';

    protected $primaryKey = 'ID_RESERVASI';

    public $timestamps = false;

    protected $fillable = [
        'ID_MEJA',
        'ID_CUSTOMER',
        'SESI_RESERVASI',
        'TANGGAL_RESERVASI'
    ];
}
