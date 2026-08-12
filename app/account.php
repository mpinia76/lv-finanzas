<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class account extends Model
{
    protected $table = 'account';
    public $timestamps = false;

    /**
     * Scope: solo cuentas activas (no dadas de baja).
     * Uso: account::activas()->get()
     */
    public function scopeActivas($query)
    {
        return $query->where('active', 1);
    }
}
