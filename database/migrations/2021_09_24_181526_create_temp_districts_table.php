<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTempDistrictsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('temp_districts', function (Blueprint $table) {
            $table->engine = 'InnoDB';
			$table->bigIncrements('ds_code');
            $table->string('name', 20);
            $table->string('address', 20);
            $table->string('tel',20);
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
        Schema::dropIfExists('temp_districts');
    }
}
