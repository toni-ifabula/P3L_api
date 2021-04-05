<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Karyawan extends Model
{
    protected $table = 'karyawan';

    protected $primaryKey = 'ID_KARYAWAN';

    public $timestamps = false;

    protected $fillable = [
        'ID_ROLE',
        'NAMA_KARYAWAN',
        'PASSWORD_KARYAWAN',
        'JENIS_KELAMIN_KARYAWAN',
        'TELEPON_KARYAWAN',
        'EMAIL_KARYAWAN',
        'TANGGAL_GABUNG_KARYAWAN',
        'STATUS_KARYAWAN'
    ];
}
