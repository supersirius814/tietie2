<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBusinessCategoryOptionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('business_category_options', function (Blueprint $table) {
            $table->increments('option_id');
			$table->unsignedInteger('business_category_id');
			$table->foreign('business_category_id')->references('business_category_id')->on('business_categories');
            $table->string('option_name')->nullable();
            $table->text('option_value')->nullable();
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
        Schema::dropIfExists('business_category_options');
    }
}
