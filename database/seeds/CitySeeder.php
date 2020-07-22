<?php

use Illuminate\Database\Seeder;

class CitySeeder extends Seeder {
	/**
	 * Run the database seeds.
	 *
	 * @return void
	 */
	public function run() {
		if (env('DB_CONNECTION') == 'mysql') {
			\DB::statement('SET FOREIGN_KEY_CHECKS=0;');
			\DB::table(config('tables.city_table'))->truncate();
		}
		$dbInsert = \DB::statement("INSERT INTO `cities` (`id`, `name`,`state_id`,`status`,`created_by`) VALUES
				(1, 'Bombuflat', 1,1,1),
				(2, 'Garacharma', 1,1,1),
				(3, 'Port Blair', 1,1,1),
				(4, 'Rangat', 1,1,1),
				(5, 'Addanki', 2,1,1),
				(6, 'Adivivaram', 2,1,1),
				(7, 'Adoni', 2,1,1),
				(8, 'Aganampudi', 2,1,1),
				(9, 'Ajjaram', 2,1,1),
				(10, 'Akividu', 2,1,1);
			");
	}
}
