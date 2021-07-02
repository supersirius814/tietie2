<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMaintenanceProgressTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('maintenance_progress', function(Blueprint $table) {
			$table->bigIncrements('maintenance_progress_id');
			$table->unsignedBigInteger('maintenance_id');
			$table->foreign('maintenance_id')->references('maintenance_id')->on('maintenances');
			$table->unsignedInteger('progress_id');
			$table->foreign('progress_id')->references('progress_id')->on('progress');
			$table->text('comment')->nullable();
			$table->boolean('faxed_to_client')->default(0);
			$table->boolean('faxed_to_shop')->default(0);
			$table->unsignedBigInteger('entered_by');
			$table->foreign('entered_by')->references('user_id')->on('users');
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
        Schema::dropIFExists('maintenance_progress');
    }
}
