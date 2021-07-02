<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMaintenanceImagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('maintenance_images', function (Blueprint $table) {
			$table->bigIncrements('maintenance_image_id');
			$table->unsignedBigInteger('maintenance_id');
			$table->foreign('maintenance_id')->references('maintenance_id')->on('maintenances');
			$table->string('file_name');
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
        Schema::dropIfExists('maintenance_images');
    }
}
