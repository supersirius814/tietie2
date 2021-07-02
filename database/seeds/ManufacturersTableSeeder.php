<?php

use Illuminate\Database\Seeder;

class ManufacturersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		DB::table('manufacturers')->insert([
			[
				'manufacturer_name' => '東芝',
			],
			[
				'manufacturer_name' => 'ホシザキ',
			],
		]);
    }
}
