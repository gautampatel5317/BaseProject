<?php

use App\Models\Role\Role;
use Carbon\Carbon as Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RolesTableSeeder extends Seeder {
	public function run() {
		DB::statement('SET FOREIGN_KEY_CHECKS=0;');
		if (env('DB_CONNECTION') == 'mysql') {
			DB::table(config('tables.roles_table'))->truncate();
		}
		$roles = [[
				'id'         => 1,
				'title'      => 'Admin',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
				'deleted_at' => null,
			],
			[
				'id'         => 2,
				'title'      => 'Sellers',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
				'deleted_at' => null,
			],
			[
				'id'         => 3,
				'title'      => 'User',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
				'deleted_at' => null,
			]];
		Role::insert($roles);
		DB::statement('SET FOREIGN_KEY_CHECKS=1;');
	}
}
