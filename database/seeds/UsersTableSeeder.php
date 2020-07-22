<?php

use App\Models\User\User;
use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder {
	public function run() {
		$users = [[
				'id'             => 1,
				'name'           => 'Admin',
				'email'          => 'admin@admin.com',
				'password'       => bcrypt('Admin@123'),
				'remember_token' => null,
				'created_at'     => '2019-04-15 19:13:32',
				'updated_at'     => '2019-04-15 19:13:32',
				'deleted_at'     => null,
			]];

		User::insert($users);
	}
}
