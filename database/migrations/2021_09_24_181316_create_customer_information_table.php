<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCustomerInformationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('customer_information', function (Blueprint $table) {
            $table->engine = 'InnoDB';
			$table->bigIncrements('id');
			$table->unsignedBigInteger('customer_id');
            $table->string('use_flag', 255);
            $table->string('customer_code', 255);
            $table->string('customer_name', 255);
            $table->string('customer_alias', 255);
            $table->string('mail_num', 255);
            $table->string('city_code', 255);
            $table->string('dodo_hyon', 255);
            $table->string('address', 255);
            $table->string('building_name', 255);
            $table->string('TEL', 255);
            $table->string('FAX', 255);
            $table->string('agent_name', 255);
            $table->string('agent_role', 255);
            $table->string('plan_date', 255);
            $table->string('secret_plan', 255);
            $table->string('business_format_code', 255);
            $table->string('customergroup_code', 255);
            $table->string('customergroup', 255);
            $table->string('own_user_num', 255);
            $table->string('own_user_name', 255);
            $table->string('own_user_department', 255);
            $table->string('own_user_role', 255);
            $table->string('own_user_tel', 255);
            $table->string('own_user_fax', 255);
            $table->string('own_user_phone', 255);
            $table->string('own_user_email', 255);
            $table->string('own_user_comment', 255);
            $table->string('information_manager_flag', 255);
            $table->string('totoal_admin_flag', 255);
            $table->string('leave_flag', 255);
            $table->string('modified_user_code', 255);
            $table->string('updated_at', 255);
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
        Schema::dropIfExists('customer_information');
    }
}
