<?php

namespace App\Models\Interest;

use Illuminate\Database\Eloquent\Model;
use App\Models\Interest\Traits\Attribute\InterestAttribute;
use Illuminate\Database\Eloquent\SoftDeletes;


class Interest extends Model
{
    use SoftDeletes, InterestAttribute;
    protected $fillable = [
        'id',
        'name',
        'status',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
        'deleted_at',
    ];
}
