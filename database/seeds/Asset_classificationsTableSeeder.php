<?php

use Illuminate\Database\Seeder;

class Asset_classificationsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		DB::table('asset_classifications')->insert([
			[
				'asset_classification_name' => '家主資産',
			],
		]);
    }
}
