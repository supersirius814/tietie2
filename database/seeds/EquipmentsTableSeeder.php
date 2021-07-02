<?php

use Illuminate\Database\Seeder;

class EquipmentsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		DB::table('equipments')->insert([
			[
				'equipment_name' => 'エアコン',
			],
			[
				'equipment_name' => '受電設備１',
			],
		]);
    }
}
