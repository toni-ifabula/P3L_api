<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Meja extends Model
{
    protected $table = 'meja';

    protected $primaryKey = 'ID_MEJA';

    public $timestamps = false;

    protected $fillable = [
        'NOMOR_MEJA',
        'STATUS_MEJA'
    ];
}
