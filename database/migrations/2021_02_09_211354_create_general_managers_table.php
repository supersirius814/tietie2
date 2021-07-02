<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGeneralManagersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('general_managers', function (Blueprint $table) {
            $table->increments('general_manager_id');
			$table->unsignedInteger('department_id');
			$table->foreign('department_id')->references('department_id')->on('departments');
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
        Schema::dropIfExists('general_managers');
    }
}
