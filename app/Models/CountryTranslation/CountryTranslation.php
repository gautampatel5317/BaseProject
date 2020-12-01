<?php

namespace App\Models\CountryTranslation;

use Illuminate\Database\Eloquent\Model;

class CountryTranslation extends Model
{
    protected $table = 'countries_translations';
    public $timestamps = false;
    protected $fillable = [
        'id',
        'country_id',
        'name',
        'language',
    ];
}
