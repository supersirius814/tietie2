<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateShopsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('shops', function (Blueprint $table) {
			$table->increments('shop_id');
            $table->unsignedMediumInteger('shop_code')->unique();
			$table->string('shop_name');
			$table->unsignedInteger('business_category_id');
			$table->foreign('business_category_id')->references('business_category_id')->on('business_categories');
			$table->unsignedBigInteger('block_id')->nullable();
			$table->foreign('block_id')->references('block_id')->on('blocks');
			$table->string('shop_address');
			$table->string('shop_phone_number');
			$table->string('shop_fax_number');
			$table->date('shop_open_date')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('shops');
    }
}
