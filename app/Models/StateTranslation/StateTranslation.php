<?php

namespace App\Models\StateTranslation;

use Illuminate\Database\Eloquent\Model;

class StateTranslation extends Model
{
    protected $table = 'states_translations';
    public $timestamps = false;
    protected $fillable = [
        'id',
        'state_id',
        'name',
        'language',
    ];
}
