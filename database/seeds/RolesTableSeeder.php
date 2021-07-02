<?php

use Illuminate\Database\Seeder;

class RolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		DB::table('roles')->insert([
			[
				'role_id' => 1,
				'role_name' => '管理者',
			],
			[
				'role_id' => 10,
				'role_name' => 'GM',
			],
			[
				'role_id' => 20,
				'role_name' => 'DM',
			],
			[
				'role_id' => 30,
				'role_name' => 'BM',
			],
			[
				'role_id' => 50,
				'role_name' => '一般社員',
			],
		]);
    }
}
