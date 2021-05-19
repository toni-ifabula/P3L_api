<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Transaksi extends Model
{
    protected $table = 'transaksi';

    protected $primaryKey = 'ID_TRANSAKSI';

    public $timestamps = false;

    protected $fillable = [
        'ID_PESANAN',
        'ID_KARYAWAN',
        'NOMOR_TRANSAKSI',
        'TANGGAL_TRANSAKSI',
        'WAKTU_TRANSAKSI',
        'JENIS_PEMBAYARAN_TRANSAKSI',
        'NOMOR_KARTU_TRANSAKSI',
        'NAMA_CREDIT_TRANSAKSI',
        'KODE_VERIFIKASI_TRANSAKSI'
    ];
}
