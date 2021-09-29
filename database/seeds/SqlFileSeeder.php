<?php

use Illuminate\Database\Seeder;

class SqlFileSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //

        $path = public_path('sql/zensho_maintenance.sql');
        $sql = file_get_contents($path);
        DB::unprepared($sql);
    }
}
