<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomerTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customers', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('first_name');
            $table->string('family_name');
            $table->string('email');
            $table->enum('experience',['New','Mid Expert','Expert']);
            $table->enum('business',['1 to 3 months','3 to 6 months','6 to 12 months','1 year +','2 year +','3 year +','Over 3 years']);
            $table->enum('confirmed',['0','1'])->default('0');
            $table->enum('status',['0','1']);
            $table->softDeletes('deleted_at', 0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('customer');
    }
}
