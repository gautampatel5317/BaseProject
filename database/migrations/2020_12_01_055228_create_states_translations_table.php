<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStatesTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('states_translations', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('state_id')->unsigned()->comment("state_id of state table");
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
        Schema::dropIfExists('states_translations');
    }
}
