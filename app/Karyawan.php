<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Passport\HasApiTokens;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Hash;

class Karyawan extends Authenticatable
{
    use HasApiTokens;

    protected $table = 'karyawan';

    protected $primaryKey = 'ID_KARYAWAN';

    public $timestamps = false;

    protected $fillable = [
        'ID_ROLE',
        'NAMA_KARYAWAN',
        'password',
        'JENIS_KELAMIN_KARYAWAN',
        'TELEPON_KARYAWAN',
        'email',
        'TANGGAL_GABUNG_KARYAWAN',
        'STATUS_KARYAWAN'
    ];

}
