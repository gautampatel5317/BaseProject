<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCmsPagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cms_pages', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title');
            $table->text('description');
            $table->string('cannonical_link')->nullable();;
            $table->string('seo_title')->nullable();;
            $table->string('seo_keyword')->nullable();;
            $table->text('seo_description')->nullable();;
            $table->enum('status',['0','1']);
            $table->bigInteger('created_by')->default('0');
            $table->bigInteger('updated_by')->default('0');
            $table->timestamps();
            $table->softDeletes('deleted_at', 0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cms_pages');
    }
}
