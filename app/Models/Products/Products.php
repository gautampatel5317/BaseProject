<?php

namespace App\Models\Products;
use App\Models\Products\Traits\Attribute\ProductsAttribute;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Products extends Model {
	use SoftDeletes, ProductsAttribute;
	protected $fillable = [
		'id',
		'title',
		'description',
        'category_id',
        'seller_id',
        'rate',
        'sale_rate',
        'status',
		'created_at',
		'updated_at',
		'deleted_at',
		'created_by',
		'updated_by',
	];

}
