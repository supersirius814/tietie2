<?php

use Illuminate\Database\Seeder;

class Block_managersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		DB::table('block_managers')->insert([
			[
				'block_id' => 20,
				'user_id' => 5,
			],
		]);
    }
}
