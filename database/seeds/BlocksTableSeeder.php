<?php

use Illuminate\Database\Seeder;

class BlocksTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		DB::table('blocks')->insert([
			[
				'block_name' => '北海道',
				'district_id' => 1,
			],
			[
				'block_name' => '青森',
				'district_id' => 2,
			],
			[
				'block_name' => '秋田',
				'district_id' => 2,
			],
			[
				'block_name' => '岩手',
				'district_id' => 2,
			],
			[
				'block_name' => '山形',
				'district_id' => 2,
			],
			[
				'block_name' => '宮城',
				'district_id' => 2,
			],
			[
				'block_name' => '福島',
				'district_id' => 2,
			],
			[
				'block_name' => '新潟',
				'district_id' => 3,
			],
			[
				'block_name' => '岐阜',
				'district_id' => 3,
			],
			[
				'block_name' => '富山',
				'district_id' => 3,
			],
			[
				'block_name' => '山梨',
				'district_id' => 3,
			],
			[
				'block_name' => '石川',
				'district_id' => 3,
			],
			[
				'block_name' => '静岡',
				'district_id' => 3,
			],
			[
				'block_name' => '福井',
				'district_id' => 3,
			],
			[
				'block_name' => '愛知',
				'district_id' => 3,
			],
			[
				'block_name' => '長野',
				'district_id' => 3,
			],
			[
				'block_name' => '栃木',
				'district_id' => 4,
			],
			[
				'block_name' => '埼玉',
				'district_id' => 4,
			],
			[
				'block_name' => '群馬',
				'district_id' => 4,
			],
			[
				'block_name' => '東京',
				'district_id' => 4,
			],
			[
				'block_name' => '茨城',
				'district_id' => 4,
			],
			[
				'block_name' => '神奈川',
				'district_id' => 4,
			],
			[
				'block_name' => '千葉',
				'district_id' => 4,
			],
			[
				'block_name' => '三重',
				'district_id' => 5,
			],
			[
				'block_name' => '奈良',
				'district_id' => 5,
			],
			[
				'block_name' => '滋賀',
				'district_id' => 5,
			],
			[
				'block_name' => '和歌山',
				'district_id' => 5,
			],
			[
				'block_name' => '京都',
				'district_id' => 5,
			],
			[
				'block_name' => '兵庫',
				'district_id' => 5,
			],
			[
				'block_name' => '大阪',
				'district_id' => 5,
			],
			[
				'block_name' => '岡山',
				'district_id' => 6,
			],
			[
				'block_name' => '香川',
				'district_id' => 6,
			],
			[
				'block_name' => '広島',
				'district_id' => 6,
			],
			[
				'block_name' => '徳島',
				'district_id' => 6,
			],
			[
				'block_name' => '山口',
				'district_id' => 6,
			],
			[
				'block_name' => '愛媛',
				'district_id' => 6,
			],
			[
				'block_name' => '鳥取',
				'district_id' => 6,
			],
			[
				'block_name' => '高知',
				'district_id' => 6,
			],
			[
				'block_name' => '島根',
				'district_id' => 6,
			],
			[
				'block_name' => '福岡',
				'district_id' => 7,
			],
			[
				'block_name' => '宮崎',
				'district_id' => 7,
			],
			[
				'block_name' => '佐賀',
				'district_id' => 7,
			],
			[
				'block_name' => '熊本',
				'district_id' => 7,
			],
			[
				'block_name' => '長崎',
				'district_id' => 7,
			],
			[
				'block_name' => '鹿児島',
				'district_id' => 7,
			],
			[
				'block_name' => '大分',
				'district_id' => 7,
			],
			[
				'block_name' => '沖縄',
				'district_id' => 7,
			],
		]);
    }
}
