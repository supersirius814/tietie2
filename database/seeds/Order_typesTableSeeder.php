<?php

use Illuminate\Database\Seeder;

class Order_typesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		DB::table('order_types')->insert([
			[
				'type' => '修繕依頼',
			],
			[
				'type' => '発注依頼',
			],
			[
				'type' => '見積依頼',
			],
			[
				'type' => 'その他',
			],
		]);
    }
}
