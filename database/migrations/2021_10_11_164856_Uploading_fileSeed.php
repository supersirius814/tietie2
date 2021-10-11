<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UploadingFileSeed extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('uploding_files', function (Blueprint $table) {
            $table->engine = 'InnoDB';
			$table->bigIncrements('id');
			$table->unsignedBigInteger('maintenance_id');
			$table->foreign('maintenance_id')->references('maintenance_id')->on('maintenances');
            $table->string('kind', 100);
            $table->string('file_name', 100);
            $table->string('file_path', 100);
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
        Schema::dropIfExists('uploading_files');
    }
}
