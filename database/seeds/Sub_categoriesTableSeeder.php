<?php

use Illuminate\Database\Seeder;

class Sub_categoriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		DB::table('sub_categories')->insert([
			[
				'sub_category_name' => 'ウォークイン冷蔵庫',
			],
			[
				'sub_category_name' => 'ドロアー冷凍庫',
			],
			[
				'sub_category_name' => 'フライヤー',
			],
			[
				'sub_category_name' => '受電設備',
			],
			[
				'sub_category_name' => 'エアコン',
			],
		]);
    }
}
