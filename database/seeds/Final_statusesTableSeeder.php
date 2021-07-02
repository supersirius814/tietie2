<?php

use Illuminate\Database\Seeder;

class Final_statusesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		DB::table('final_statuses')->insert([
			[
				'final_status' => '未完了',
			],
			[
				'final_status' => '取完了',
			],
			[
				'final_status' => '店完了',
			],
			[
				'final_status' => '再訪問',
			],
		]);
    }
}
