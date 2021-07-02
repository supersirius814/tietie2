<?php

use Illuminate\Database\Seeder;

class ClientsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		DB::table('clients')->insert([
			[
				'client_code' => '11111111',
				'client_name' => '取引先A',
				'client_phone_number' => '000-000-0000',
				'client_fax_number' => '000-000-0000',
				'client_email' => '',
			],
			[
				'client_code' => '22222222',
				'client_name' => '取引先B',
				'client_phone_number' => '000-000-0000',
				'client_fax_number' => '000-000-0000',
				'client_email' => '',
			],
			[
				'client_code' => '33333333',
				'client_name' => '取引先C',
				'client_phone_number' => '000-000-0000',
				'client_fax_number' => '000-000-0000',
				'client_email' => '',
			],
			[
				'client_code' => '44444444',
				'client_name' => '取引先D',
				'client_phone_number' => '000-000-0000',
				'client_fax_number' => '000-000-0000',
				'client_email' => '',
			],
		]);
    }
}
