<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMaintenancesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('maintenances', function (Blueprint $table) {
            $table->bigIncrements('maintenance_id');
            $table->string('maintenance_code', 10)->nullable();
			$table->unsignedInteger('shop_id');
			$table->foreign('shop_id')->references('shop_id')->on('shops');
			$table->unsignedBigInteger('applicant_id');
			$table->foreign('applicant_id')->references('user_id')->on('users');
            $table->timestamps();
//			$table->boolean('is_sendbacked')->default(0);
//			$table->text('sendback_comment')->nullable();
//			$table->boolean('is_approved')->default(0);
//			$table->unsignedBigInteger('approved_by')->nullable();
//			$table->foreign('approved_by')->references('user_id')->on('users');
//			$table->dateTime('approved_date')->nullable();
//			$table->unsignedBigInteger('equipment_id')->nullable();
//			$table->foreign('equipment_id')->references('equipment_id')->on('equipments');
			$table->string('equipment');
//			$table->string('equipment_image01')->nullable();
//			$table->string('equipment_image02')->nullable();
//			$table->string('equipment_image03')->nullable();
			$table->string('manufacturer')->nullable();
			$table->string('model_number')->nullable();
			$table->unsignedBigInteger('order_type_id')->nullable();
			$table->foreign('order_type_id')->references('order_type_id')->on('order_types');
//			$table->unsignedInteger('client_id')->nullable();
//			$table->foreign('client_id')->references('client_id')->on('clients');
			$table->string('when')->nullable();
			$table->text('situation')->nullable();
			$table->text('order')->nullable();
			$table->text('remark')->nullable();
			$table->boolean('is_emergency')->default(0);
			$table->boolean('is_disaster')->default(0);
//			$table->date('scheduled_date')->nullable();
//			$table->time('scheduled_time')->nullable();
//			$table->date('rescheduled_date')->nullable();
//			$table->time('rescheduled_time')->nullable();
			$table->unsignedInteger('progress_id')->default(1);
			$table->foreign('progress_id')->references('progress_id')->on('progress');
//			$table->text('cause_repair')->nullable();
//			$table->bigInteger('estimated_cost')->nullable();
//			$table->bigInteger('estimated_amount')->nullable();
			$table->date('completed_date')->nullable();
			$table->unsignedBigInteger('judge_id')->nullable();
			$table->string('judge')->nullable();
//			$table->unsignedBigInteger('final_status_id')->default(1);
//			$table->foreign('final_status_id')->references('final_status_id')->on('final_statuses');
			$table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('maintenances');
    }
}
