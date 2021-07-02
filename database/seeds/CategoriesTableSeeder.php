<?php

use Illuminate\Database\Seeder;

class CategoriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		DB::table('categories')->insert([
			[
				'category_name' => '厨房機器',
			],
			[
				'category_name' => 'シンク',
			],
			[
				'category_name' => '電気',
			],
			[
				'category_name' => '空調',
			],
		]);
    }
}
