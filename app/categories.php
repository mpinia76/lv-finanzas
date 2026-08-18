<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

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
