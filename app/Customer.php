<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    protected $table = 'customer';

    protected $primaryKey = 'ID_CUSTOMER';

    public $timestamps = false;

    protected $fillable = [
        'NAMA_CUSTOMER',
        'TELEPON_CUSTOMER',
        'EMAIL_CUSTOMER',
    ];
}
