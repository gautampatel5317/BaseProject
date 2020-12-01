<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCitiesTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cities_translations', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('city_id')->unsigned()->comment("city_id of city table");
            $table->string('name', 191);
            $table->string('language', 191);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cities_translations');
    }
}
