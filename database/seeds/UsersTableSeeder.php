<?php

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		DB::table('users')->insert([
			'staff_id' => 1,
			'name' => '管理者',
			'email' => 'admin@admin',
//			'password' => bcrypt('aaaa'),
			'shop_id' => null,
			'business_category_id' => 1,
			'role_id' => 1,
		]);
		DB::table('users')->insert([
			'staff_id' => 2,
			'name' => 'GM',
			'email' => 'a@a',
			'shop_id' => null,
			'business_category_id' => 1,
			'role_id' => 10,
		]);
		DB::table('users')->insert([
			'staff_id' => 3,
			'name' => 'DM',
			'email' => 'b@b',
			'shop_id' => null,
			'business_category_id' => 18,
			'role_id' => 20,
		]);
		DB::table('users')->insert([
			'staff_id' => 4,
			'name' => 'DM',
			'email' => 'c@c',
			'shop_id' => 2,
			'business_category_id' => 18,
			'role_id' => 20,
		]);
		DB::table('users')->insert([
			'staff_id' => 5,
			'name' => 'BM',
			'email' => 'yasu.fukuhara@interface-design.jp',
			'shop_id' => null,
			'business_category_id' => 18,
			'role_id' => 30,
		]);
		DB::table('users')->insert([
			'staff_id' => 6,
			'name' => 'BM',
			'email' => 'd@d',
			'shop_id' => 3,
			'business_category_id' => 18,
			'role_id' => 30,
		]);
		DB::table('users')->insert([
			'staff_id' => 7,
			'name' => 'BM',
			'email' => 'e@e',
			'shop_id' => 4,
			'business_category_id' => 18,
			'role_id' => 30,
		]);
		DB::table('users')->insert([
			'staff_id' => 8,
			'name' => '鈴木',
			'email' => 'f@f',
			'shop_id' => 5,
			'business_category_id' => 18,
			'role_id' => 50,
		]);
		DB::table('users')->insert([
			'staff_id' => 9,
			'name' => '伊藤',
			'email' => 'g@g',
			'shop_id' => 6,
			'business_category_id' => 18,
			'role_id' => 50,
		]);
		DB::table('users')->insert([
			'staff_id' => 10,
			'name' => '渡辺',
			'email' => 'fukuhara810@gmail.com',
			'shop_id' => 7,
			'business_category_id' => 18,
			'role_id' => 50,
		]);
		DB::table('users')->insert([
			'staff_id' => 11,
			'name' => '山本',
			'email' => 'h@h',
			'shop_id' => 8,
			'business_category_id' => 18,
			'role_id' => 50,
		]);
		DB::table('users')->insert([
			'staff_id' => 12,
			'name' => '中村',
			'email' => 'i@i',
			'shop_id' => 9,
			'business_category_id' => 18,
			'role_id' => 50,
		]);
		DB::table('users')->insert([
			'staff_id' => 13,
			'name' => '小林',
			'email' => 'j@j',
			'shop_id' => 10,
			'business_category_id' => 18,
			'role_id' => 50,
		]);
		DB::table('users')->insert([
			'staff_id' => 13,
			'name' => '小林',
			'email' => 'k@k',
			'shop_id' => 10,
			'business_category_id' => 17,
			'role_id' => 50,
		]);
    }
}
