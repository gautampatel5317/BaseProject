<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterUserTables extends Migration {
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up() {
		Schema::table('users', function (Blueprint $table) {
				$table->dropColumn('is_front');
				$table->string('first_name', 191)->after('id')->nullable(true);
				$table->string('last_name', 191)->after('first_name')->nullable(true);

			});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down() {
		Schema::table('users', function (Blueprint $table) {
				$table->dropColumn('first_name');
				$table->dropColumn('last_name');
			});
	}
}
