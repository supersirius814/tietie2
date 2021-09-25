<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAccountingInfoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('accounting_info', function (Blueprint $table) {
            $table->engine = 'InnoDB';
			$table->bigIncrements('accounting_info_id');
			$table->unsignedBigInteger('maintenance_id');
            $table->foreign('maintenance_id')->references('maintenance_id')->on('maintenances');
            $table->string('relation_code', 30);
            $table->text('relation_name');
            $table->string('accounting_amount', 20);
            $table->string('unincluding_price', 20);
            $table->string('including_price',20);
            $table->string('accounting_year', 40);
            $table->string('editor',20);
            $table->string('employee',10);
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
        Schema::dropIfExists('accounting_info');
    }
}
