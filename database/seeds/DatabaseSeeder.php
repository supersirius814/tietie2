<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(Business_categoriesTableSeeder::class);
        $this->call(DepartmentsTableSeeder::class);
        $this->call(DistrictsTableSeeder::class);
        $this->call(BlocksTableSeeder::class);
        $this->call(ShopsTableSeeder::class);
        $this->call(RolesTableSeeder::class);
        $this->call(UsersTableSeeder::class);
        $this->call(CategoriesTableSeeder::class);
        $this->call(Sub_categoriesTableSeeder::class);
        $this->call(ManufacturersTableSeeder::class);
        $this->call(Asset_classificationsTableSeeder::class);
        $this->call(EquipmentsTableSeeder::class);
        $this->call(ClientsTableSeeder::class);
        $this->call(Order_typesTableSeeder::class);
        $this->call(ProgressTableSeeder::class);
        $this->call(Final_statusesTableSeeder::class);
        $this->call(MaintenancesTableSeeder::class);
        $this->call(Block_managersTableSeeder::class);
        $this->call(District_managersTableSeeder::class);
        $this->call(Client_equipmentsTableSeeder::class);
        $this->call(Maintenance_progressTableSeeder::class);
        $this->call(Maintenance_imagesTableSeeder::class);
        $this->call(Quotation_infoTableSeeder::class);
        $this->call(Accounting_infoTableSeeder::class);
        $this->call(Bmcategory_tableTableSeeder::class);
        $this->call(Business_category_optionsTableSeeder::class);
        $this->call(Customer_informationTableSeeder::class);
        $this->call(Maintenance_order_reasonsTableSeeder::class);
        $this->call(Order_reasonsTableSeeder::class);
        $this->call(SqlFileSeeder::class);  
    }
}
