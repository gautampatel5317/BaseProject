<?php

namespace App\Models\CityTranslation;

use Illuminate\Database\Eloquent\Model;

class CityTranslation extends Model
{
    protected $table = 'cities_translations';
    public $timestamps = false;
    protected $fillable = [
        'id',
        'city_id',
        'name',
        'language',
    ];
}
