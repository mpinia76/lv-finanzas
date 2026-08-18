<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Schema;

class categories extends Model
{
    protected $table = 'categories';
    public $timestamps = false;

    /**
     * Duenios posibles de una categoria.
     * La clave es lo que se guarda en la base, el valor es lo que se muestra.
     */
    public static function owners()
    {
        return array(
            'yo'   => 'Mías',
            'mama' => 'De mamá',
        );
    }

    /**
     * Indica si la columna `owner` ya existe en la base.
     * Permite que las pantallas sigan funcionando si todavia no se corrio la migracion.
     */
    public static function hasOwnerColumn()
    {
        static $has = null;
        if ($has === null) {
            $has = Schema::hasColumn('categories', 'owner');
        }
        return $has;
    }

    /**
     * Etiqueta legible del duenio de esta categoria.
     */
    public function ownerLabel()
    {
        $owners = self::owners();
        return isset($owners[$this->owner]) ? $owners[$this->owner] : $owners['yo'];
    }

    /**
     * Scope: filtrar por duenio.
     * Uso: categories::deOwner('mama')->get()
     * Si $owner viene vacio o no es valido, no filtra nada.
     */
    public function scopeDeOwner($query, $owner = null)
    {
        if ($owner && array_key_exists($owner, self::owners())) {
            return $query->where('owner', '=', $owner);
        }
        return $query;
    }

    /**
     * Normaliza un valor de duenio recibido por request.
     */
    public static function normalizeOwner($owner)
    {
        return array_key_exists($owner, self::owners()) ? $owner : 'yo';
    }
}
