<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateProductsImageTable extends Migration {
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up() {
		Schema::create('products_image', function (Blueprint $table) {
				$table->bigIncrements('id');
				$table->unsignedInteger('product_id');
				// $table->foreign('product_id')->references('id')->on('products');
				$table->string('image');
				$table->timestamps();
			});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down() {
		Schema::dropIfExists('products_image');
	}
}
