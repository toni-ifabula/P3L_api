<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $table = 'role';

    protected $primaryKey = 'ID_ROLE';

    public $timestamps = false;

    protected $fillable = [
        'NAMA_ROLE'
    ];

}
