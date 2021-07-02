<?php

use Illuminate\Database\Seeder;

class ShopsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		DB::table('shops')->insert([
			[
				'shop_code' => 0001,
				'shop_name' => 'はま寿司本部',
				'business_category_id' => 1,
				'block_id' => null,
				'shop_address' => '',
				'shop_phone_number' => '',
				'shop_fax_number' => '',
				'shop_open_date' => null,
			],
			[
				'shop_code' => 2006,
				'shop_name' => '平塚',
				'business_category_id' => 18,
				'block_id' => 22,
				'shop_address' => '',
				'shop_phone_number' => '',
				'shop_fax_number' => '',
				'shop_open_date' => '20191224',
			],
			[
				'shop_code' => 2045,
				'shop_name' => '栃木',
				'business_category_id' => 18,
				'block_id' => 17,
				'shop_address' => '',
				'shop_phone_number' => '',
				'shop_fax_number' => '',
				'shop_open_date' => '20191224',
			],
			[
				'shop_code' => 2062,
				'shop_name' => '浦安',
				'business_category_id' => 18,
				'block_id' => 23,
				'shop_address' => '',
				'shop_phone_number' => '',
				'shop_fax_number' => '',
				'shop_open_date' => '20191224',
			],
			[
				'shop_code' => 2129,
				'shop_name' => '幕張',
				'business_category_id' => 18,
				'block_id' => 23,
				'shop_address' => '',
				'shop_phone_number' => '',
				'shop_fax_number' => '',
				'shop_open_date' => '20191224',
			],
			[
				'shop_code' => 2234,
				'shop_name' => '久留米中央',
				'business_category_id' => 18,
				'block_id' => 40,
				'shop_address' => '',
				'shop_phone_number' => '',
				'shop_fax_number' => '',
				'shop_open_date' => '20191224',
			],
			[
				'shop_code' => 2945,
				'shop_name' => '稲城矢野口',
				'business_category_id' => 18,
				'block_id' => 20,
				'shop_address' => '',
				'shop_phone_number' => '03-5311-2155',
				'shop_fax_number' => '03-5311-2156',
				'shop_open_date' => '20191224',
			],
			[
				'shop_code' => 3131,
				'shop_name' => '岐阜岩崎',
				'business_category_id' => 18,
				'block_id' => 9,
				'shop_address' => '',
				'shop_phone_number' => '',
				'shop_fax_number' => '',
				'shop_open_date' => '20191224',
			],
			[
				'shop_code' => 3636,
				'shop_name' => '八王子みなみ野駅前',
				'business_category_id' => 18,
				'block_id' => 20,
				'shop_address' => '',
				'shop_phone_number' => '',
				'shop_fax_number' => '',
				'shop_open_date' => '20191224',
			],
			[
				'shop_code' => 3646,
				'shop_name' => '豊洲四丁目',
				'business_category_id' => 18,
				'block_id' => 20,
				'shop_address' => '',
				'shop_phone_number' => '',
				'shop_fax_number' => '',
				'shop_open_date' => '20191224',
			],
		]);
    }
}
