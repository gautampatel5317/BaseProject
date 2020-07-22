<?php

namespace App\Models\Country;

use App\Models\Country\Traits\Attribute\CountryAttribute;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Country extends Model
{
    use SoftDeletes, CountryAttribute;
    protected $fillable = [
        'id',
        'name',
        'code',
        'phonecode',
        'status',
        'created_at',
        'updated_at',
        'deleted_at',
        'created_by',
        'updated_by',
    ];
}
