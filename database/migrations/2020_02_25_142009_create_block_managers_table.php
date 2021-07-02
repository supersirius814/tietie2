<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBlockManagersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('block_managers', function (Blueprint $table) {
            $table->bigIncrements('block_manager_id');
			$table->unsignedBigInteger('block_id');
			$table->foreign('block_id')->references('block_id')->on('blocks');
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
        Schema::dropIfExists('block_managers');
    }
}
