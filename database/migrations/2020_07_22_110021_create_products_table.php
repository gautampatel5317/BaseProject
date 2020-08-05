<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title');
            $table->text('description');
            $table->unsignedInteger('category_id');
            // $table->foreign('category_id')->references('id')->on('category');
            $table->unsignedInteger('seller_id');
            // $table->foreign('seller_id')->references('id')->on('seller_detail');
            $table->float('rate', 8, 2);
            $table->float('sale_rate', 8, 2);
            $table->enum('status',['0','1']);
            $table->timestamps();
            $table->softDeletes('deleted_at', 0);
            $table->bigInteger('created_by');
            $table->bigInteger('updated_by')->default('0');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
