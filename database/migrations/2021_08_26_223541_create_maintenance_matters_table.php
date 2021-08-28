<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMaintenanceMattersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('maintenance_matters', function(Blueprint $table) {
            $table->engine = 'InnoDB';
			$table->bigIncrements('maintenance_matter_id');
			$table->unsignedBigInteger('maintenance_id');
			$table->foreign('maintenance_id')->references('maintenance_id')->on('maintenances');
			$table->unsignedInteger('matter_option_id');
			$table->foreign('matter_option_id')->references('matter_option_id')->on('matter_options');
			$table->unsignedInteger('matter_value_id');
			$table->foreign('matter_value_id')->references('matter_value_id')->on('matter_values');
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
        Schema::dropIfExists('maintenance_matters');
    }
}
