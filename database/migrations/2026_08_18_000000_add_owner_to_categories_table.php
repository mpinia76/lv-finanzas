<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddOwnerToCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * Agrega el duenio de la categoria: 'yo' (Marcos) o 'mama'.
     * Las categorias existentes quedan como 'yo' por defecto.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::hasColumn('categories', 'owner')) {
            Schema::table('categories', function (Blueprint $table) {
                $table->string('owner', 20)->default('yo')->after('type');
            });
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        if (Schema::hasColumn('categories', 'owner')) {
            Schema::table('categories', function (Blueprint $table) {
                $table->dropColumn('owner');
            });
        }
    }
}
