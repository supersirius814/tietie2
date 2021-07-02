<?php

use Illuminate\Database\Seeder;

class EmployeesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		DB::table('employees')->insert([
			[
				'name' => '斉藤　太郎',
				'shop' => 2006,
			],
			[
				'name' => '伊藤　太郎',
				'shop' => 2045,
			],
		]);

    }
}
