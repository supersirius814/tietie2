<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMaintenanceOrderReasonsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('maintenance_order_reasons', function (Blueprint $table) {
            $table->engine = 'InnoDB';
			$table->bigIncrements('maintenance_order_reason_id');
			$table->unsignedBigInteger('maintenance_id');
            $table->foreign('maintenance_id')->references('maintenance_id')->on('maintenances');
            $table->string('order_reason_id', 30);
			$table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
        Schema::dropIfExists('maintenance_order_reasons');
    }
}
