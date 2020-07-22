<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder {
	public function run() {
		$this->call([
				PermissionsTableSeeder::class ,
				RolesTableSeeder::class ,
				PermissionRoleTableSeeder::class ,
				UsersTableSeeder::class ,
				RoleUserTableSeeder::class ,
				SettingTableSeeder::class ,
				EmailTemplatePlaceholderTableSeeder::class ,
				EmailTemplateTypeTableSeeder::class ,
				EmailTemplateTableSeeder::class
			]);
	}
}
