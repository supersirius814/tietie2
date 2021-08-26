<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddFieldsToMaintenances extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('maintenances', function (Blueprint $table) {
            $table->unsignedBigInteger('category_id')->nullable();
            $table->foreign('category_id')->references('category_id')->on('categories');
            $table->unsignedBigInteger('sub_category_id')->nullable();
            $table->foreign('sub_category_id')->references('sub_category_id')->on('sub_categories');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('maintenances', function (Blueprint $table) {
            $table->dropColumn(['category_id', 'sub_category_id']);
        });
    }
}
