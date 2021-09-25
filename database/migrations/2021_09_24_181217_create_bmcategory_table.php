<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBmcategoryTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bmcategory_table', function (Blueprint $table) {
            $table->engine = 'InnoDB';
			$table->bigIncrements('id');
            $table->string('business_format_code', 50);
            $table->string('big_id', 50);
            $table->string('big_name', 50);
            $table->string('big_equipment', 50);
            $table->string('middle_id', 50);
            $table->string('middle_name', 50);
            $table->string('middle_equipment', 50);
            $table->string('select_category_flag', 50);
            $table->string('modified_code', 50);
            $table->string('update_date', 50);
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
        Schema::dropIfExists('bmcategory_table');
    }
}
