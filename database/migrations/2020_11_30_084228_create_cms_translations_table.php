<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCmsTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cms_translations', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('cms_id')->unsigned()->comment("cms_id of cms table");
            $table->string('title', 191);
            $table->text('description');
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
        Schema::dropIfExists('cms_translations');
    }
}
