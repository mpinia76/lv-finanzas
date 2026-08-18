<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddActiveToAccountTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::hasColumn('account', 'active')) {
            Schema::table('account', function (Blueprint $table) {
                $table->boolean('active')->default(1)->after('type');
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
        if (Schema::hasColumn('account', 'active')) {
            Schema::table('account', function (Blueprint $table) {
                $table->dropColumn('active');
            });
        }
    }
}
