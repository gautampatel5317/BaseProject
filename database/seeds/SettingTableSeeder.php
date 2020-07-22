<?php

use Illuminate\Database\Seeder;

class SettingTableSeeder extends Seeder {
	/**
	 * Run the database seeds.
	 *
	 * @return void
	 */
	public function run() {
		$data = [

			[
				'seo_title' => env('APP_NAME'),
			],
		];

		\DB::table(config('tables.settings_table'))->insert($data);
	}
}
