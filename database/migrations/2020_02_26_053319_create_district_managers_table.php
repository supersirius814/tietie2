<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDistrictManagersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('district_managers', function (Blueprint $table) {
            $table->bigIncrements('district_manager_id');
			$table->unsignedBigInteger('district_id');
			$table->foreign('district_id')->references('district_id')->on('districts');
			$table->unsignedBigInteger('user_id');
			$table->foreign('user_id')->references('user_id')->on('users');
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
        Schema::dropIfExists('district_managers');
    }
}
