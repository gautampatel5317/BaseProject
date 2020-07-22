<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateIngredientWarningsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ingredient_warnings', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title');
            $table->enum('status',['0','1']);
            $table->softDeletes();
            $table->timestamps();
            $table->bigInteger('created_by')->default('0');
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
        Schema::dropIfExists('ingredient_warnings');
    }
}
