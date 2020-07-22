<?php

use App\Models\Permission\Permission;

use Carbon\Carbon as Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PermissionsTableSeeder extends Seeder {
	public function run() {
		DB::table('permission_role')->delete();
		DB::table('permissions')->delete();
		DB::statement('SET FOREIGN_KEY_CHECKS=0;');
		if (env('DB_CONNECTION') == 'mysql') {
			DB::table(config('tables.permissions_table'))->truncate();
		}
		$permissions = [[
				'id'         => '1',
				'title'      => 'user_management_access',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],
			[
				'id'         => '2',
				'title'      => 'permission_create',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],
			[
				'id'         => '3',
				'title'      => 'permission_edit',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],
			[
				'id'         => '4',
				'title'      => 'permission_show',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],
			[
				'id'         => '5',
				'title'      => 'permission_delete',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],
			[
				'id'         => '6',
				'title'      => 'permission_access',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],
			[
				'id'         => '7',
				'title'      => 'role_create',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],
			[
				'id'         => '8',
				'title'      => 'role_edit',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],
			[
				'id'         => '9',
				'title'      => 'role_show',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],
			[
				'id'         => '10',
				'title'      => 'role_delete',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],
			[
				'id'         => '11',
				'title'      => 'role_access',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],
			[
				'id'         => '12',
				'title'      => 'user_create',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],
			[
				'id'         => '13',
				'title'      => 'user_edit',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],
			[
				'id'         => '14',
				'title'      => 'user_show',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],
			[
				'id'         => '15',
				'title'      => 'user_delete',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],
			[
				'id'         => '16',
				'title'      => 'user_access',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],
			[
				'id'         => '17',
				'title'      => 'product_create',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],
			[
				'id'         => '18',
				'title'      => 'product_edit',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],
			[
				'id'         => '19',
				'title'      => 'product_show',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],
			[
				'id'         => '20',
				'title'      => 'product_delete',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],
			[
				'id'         => '21',
				'title'      => 'product_access',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],
			[
				'id'         => '22',
				'title'      => 'edit-settings',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],
			[
				'id'         => '23',
				'title'      => 'view-email-template',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now()
			],
			[
				'id'         => '24',
				'title'      => 'edit-email-template',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now()
			],
			[
				'id'         => '25',
				'title'      => 'delete-email-template',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now()
			],
			[
				'id'         => '26',
				'title'      => 'cms_access',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now()
			],
			[
				'id'         => '27',
				'title'      => 'cms_create',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now()
			],
			[
				'id'         => '28',
				'title'      => 'cms_edit',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now()
			],
			[
				'id'         => '29',
				'title'      => 'cms_show',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now()
			],
			[
				'id'         => '30',
				'title'      => 'cms_delete',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now()
			],
			[
				'id'         => '31',
				'title'      => 'country_access',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now()
			],
			[
				'id'         => '32',
				'title'      => 'country_create',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now()
			],
			[
				'id'         => '33',
				'title'      => 'country_edit',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now()
			],
			[
				'id'         => '34',
				'title'      => 'country_show',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now()
			],
			[
				'id'         => '35',
				'title'      => 'country_delete',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now()
			],
			[
				'id'         => '36',
				'title'      => 'state_access',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now()
			],
			[
				'id'         => '37',
				'title'      => 'state_create',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now()
			],
			[
				'id'         => '38',
				'title'      => 'state_edit',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now()
			],
			[
				'id'         => '39',
				'title'      => 'state_show',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now()
			],
			[
				'id'         => '40',
				'title'      => 'state_delete',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now()
			],
			[
				'id'         => '41',
				'title'      => 'city_access',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now()
			],
			[
				'id'         => '42',
				'title'      => 'city_create',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now()
			],
			[
				'id'         => '43',
				'title'      => 'city_edit',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now()
			],
			[
				'id'         => '44',
				'title'      => 'city_delete',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now()
			],
			[
				'id'         => '45',
				'title'      => 'view-front-end',
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now()
			],
		];
		Permission::insert($permissions);
		DB::statement('SET FOREIGN_KEY_CHECKS=1;');
	}
}
