<?php

namespace App\Models\Category;
use App\Models\Category\Traits\Attribute\CategoryAttribute;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model {
    use SoftDeletes, CategoryAttribute;
    protected $table = "category";
	protected $fillable = [
		'id',
		'name',
		'status',
		'created_at',
		'updated_at',
		'deleted_at',
		'created_by',
		'updated_by',
	];
}
