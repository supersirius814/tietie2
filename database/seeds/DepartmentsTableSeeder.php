<?php

use Illuminate\Database\Seeder;

class DepartmentsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('departments')->insert([
            [
                'department_name' => '東日本営業部',
            ],
            [
                'department_name' => '中日本営業部',
            ],
            [
                'department_name' => '西日本営業部',
            ],
        ]);
    }
}
