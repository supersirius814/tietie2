<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('user_id');
            $table->bigInteger('staff_id');
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
//            $table->string('password');
            $table->rememberToken();
            $table->timestamps();
			$table->unsignedInteger('shop_id')->nullable();
			$table->foreign('shop_id')->references('shop_id')->on('shops');
			$table->unsignedInteger('business_category_id');
			$table->foreign('business_category_id')->references('business_category_id')->on('business_categories');
			$table->unsignedInteger('role_id')->comment('権限 1:Admin 10:GM 20:DM 30:BM 50:Staff');
			$table->foreign('role_id')->references('role_id')->on('roles');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
