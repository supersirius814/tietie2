<?php

use Illuminate\Database\Seeder;

class District_managersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		DB::table('district_managers')->insert([
			[
				'district_id' => 4,
				'user_id' => 3,
			],
		]);
    }
}
