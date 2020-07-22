<?php

namespace App\Models\Ingredient;

use App\Models\Ingredient\Traits\Attribute\IngredientAttribute;
use App\Models\ModelTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;

class Ingredient extends Model
{
    use SoftDeletes, Notifiable, ModelTrait, IngredientAttribute;
    public $table = 'ingredient_warnings';
    protected $fillable = [
        'id',
        'title',
        'status',
        'created_at',
        'updated_at',
        'deleted_at',
        'created_by',
        'updated_by',
    ];
}
