<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateQuotationInfoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('quotation_info', function (Blueprint $table) {
            $table->engine = 'InnoDB';
			$table->bigIncrements('quotation_info_id');
			$table->unsignedBigInteger('maintenance_id');
            $table->foreign('maintenance_id')->references('maintenance_id')->on('maintenances');
            $table->string('amount', 30);
            $table->text('comment');
            $table->tinyInteger('quotation_files_cnt');
            $table->tinyInteger('photo_files_cnt');
            $table->tinyInteger('report_files_cnt');
            $table->string('date', 40);
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
        Schema::dropIfExists('quotation_info');
    }
}
