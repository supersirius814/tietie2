<?php

use Illuminate\Database\Seeder;

class Client_equipmentsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		DB::table('client_equipments')->insert([
			[
				'client_id' => 11111111,
				'equipment_id' => 1,
				'shop_id' => 2945
			],
			[
				'client_id' => 11111111,
				'equipment_id' => 2,
				'shop_id' => 2945,
			],
			[
				'client_id' => 22222222,
				'equipment_id' => 1,
				'shop_id' => 3636,
			],
			[
				'client_id' => 22222222,
				'equipment_id' => 2,
				'shop_id' => 3636,
			],
		]);
    }
}
