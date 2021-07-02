<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateNegozioLinksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('negozio_links', function (Blueprint $table) {
            $table->unsignedBigInteger('maintenance_id');
			$table->unsignedBigInteger('negozio_maintenance_id')->nullable();
			$table->unsignedBigInteger('business_category_id')->nullable();
			$table->string('business_category')->nullable();
			$table->mediumInteger('shop_id')->nullable();
			$table->string('shop_name')->nullable();
			$table->unsignedBigInteger('applicant_id')->nullable();
			$table->unsignedBigInteger('order_type_id')->nullable();
			$table->string('order_type')->nullable();
			$table->unsignedBigInteger('equipment_id')->nullable();
			$table->string('equipment_name')->nullable();
			$table->unsignedBigInteger('category_id')->nullable();
			$table->string('category_name')->nullable();
			$table->unsignedBigInteger('sub_category_id')->nullable();
			$table->string('sub_category_name')->nullable();
			$table->unsignedBigInteger('client_id')->nullable();
			$table->string('client_name')->nullable();
			$table->text('order')->nullable();
			$table->text('remark')->nullable();
			$table->boolean('is_emergency')->default(0);
			$table->boolean('is_disaster')->default(0);
			$table->date('scheduled_date')->nullable();
			$table->time('scheduled_time')->nullable();
			$table->date('rescheduled_date')->nullable();
			$table->time('rescheduled_time')->nullable();
			$table->unsignedBigInteger('progress_status_code')->default(1);
			$table->string('progress_status')->nullable();
			$table->text('cause_repair')->nullable();
			$table->bigInteger('estimated_cost')->nullable();
			$table->bigInteger('estimated_amount')->nullable();
			$table->date('completed_date')->nullable();
			$table->unsignedBigInteger('judge_id')->nullable();
			$table->string('judge')->nullable();
			$table->unsignedBigInteger('final_status_code')->default(1);
			$table->string('final_status')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('negozio_links');
    }
}
