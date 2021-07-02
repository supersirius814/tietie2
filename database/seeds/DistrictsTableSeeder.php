<?php

use Illuminate\Database\Seeder;

class DistrictsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		DB::table('districts')->insert([
			[
				'district_name' => '北日本DS',
                'department_id' => 1,
			],
			[
				'district_name' => '埼玉DS',
                'department_id' => 1,
			],
			[
				'district_name' => '千葉・茨城DS',
                'department_id' => 1,
			],
			[
				'district_name' => '東京・神奈川DS',
                'department_id' => 2,
			],
			[
				'district_name' => '神奈川・静岡DS',
                'department_id' => 2,
			],
			[
				'district_name' => '東海DS',
                'department_id' => 2,
			],
			[
				'district_name' => '甲信越・北関東DS',
                'department_id' => 2,
			],
			[
				'district_name' => '北陸・京滋DS',
                'department_id' => 3,
			],
			[
				'district_name' => '関西DS',
                'department_id' => 3,
			],
			[
				'district_name' => '中国・四国DS',
                'department_id' => 3,
			],
			[
				'district_name' => '九州DS',
                'department_id' => 3,
			],
		]);
    }
}
