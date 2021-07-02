<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateClientEquipmentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('client_equipments', function (Blueprint $table) {
            $table->bigIncrements('client_equipment_id');
			$table->unsignedBigInteger('client_id')->nullable;
			$table->unsignedBigInteger('equipment_id')->nullable;
			$table->unsignedBigInteger('shop_id')->nullable;
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('client_equipments');
    }
}
