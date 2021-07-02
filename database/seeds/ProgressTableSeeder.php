<?php

use Illuminate\Database\Seeder;

class ProgressTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		DB::table('progress')->insert([
			[
				'status' => 'BM承認待ち',
			],
			[
				'status' => 'BM承認',
			],
			[
				'status' => 'BM差戻し',
			],
			[
				'status' => 'BM却下',
			],
			[
				'status' => 'BM保留',
			],
			[
				'status' => '本部受付前',
			],
			[
				'status' => '本部差戻し',
			],
			[
				'status' => '本部見送り',
			],
			[
				'status' => '依頼確定',
			],
			[
				'status' => '依頼済',
			],
			[
				'status' => '見積待ち',
			],
			[
				'status' => '見積精査中',
			],
			[
				'status' => '入荷待ち',
			],
			[
				'status' => 'DM承認待ち',
			],
			[
				'status' => '稟議中',
			],
			[
				'status' => '見積発注済み',
			],
			[
				'status' => '日程調整中',
			],
			[
				'status' => '訪問待ち',
			],
			[
				'status' => '報告待ち',
			],
			[
				'status' => '店完了',
			],
			[
				'status' => '取完了',
			],
		]);
    }
}
