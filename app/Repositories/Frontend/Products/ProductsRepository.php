<?php

namespace App\Repositories\Frontend\Products;

use App\Http\Utilities\FileUploads;
use App\Models\ProductImage\ProductImage;
use App\Models\Products\Products;
use App\Repositories\BaseRepository;

class ProductsRepository extends BaseRepository {
	protected $model;
	public function __construct(Products $model) {
		$this->model = $model;
	}
	/**
	 * Associated Repository Model.
	 */
	const MODEL = Products::class ;

	/**
	 * Get Data For Data Table
	 *
	 * @return mixed
	 */
	public function getForDataTable() {
		//Seller Products for frontside.
		$query = Products::with('ProductImage')->
		leftjoin(config('tables.category_table'), config('tables.products_table').'.category_id', '=', config('tables.category_table').'.id')
		->leftjoin(config('tables.users_table'), config('tables.products_table').'.seller_id', '=', config('tables.users_table').'.id')
		->select(
			config('tables.category_table').'.id as category_id',
			config('tables.category_table').'.name',
			config('tables.products_table').'.id',
			config('tables.products_table').'.title',
			config('tables.products_table').'.description',
			config('tables.products_table').'.rate',
			config('tables.products_table').'.sale_rate',
			config('tables.products_table').'.status',
			config('tables.products_table').'.created_at',
			config('tables.users_table').'.id as user_id',
			config('tables.users_table').'.first_name',
			config('tables.users_table').'.last_name'
		)
		->where(config('tables.products_table').'.seller_id', '=', auth()->user()->id)
		->where(config('tables.products_table').'.status', "=", '1');
		return $query;
	}
	/**
	 * Product Store
	 *
	 * @param array $input
	 */
	public function create($input) {
		// check Product Exist
		$checkExist = Products::where('title', trim($input['title']))->exists();
		if ($checkExist) {
			flash(trans('Product already exists! Please give new name.'))->error()->important();
			return false;
		}
		$product              = new Products();
		$product->title       = $input['title'];
		$product->description = $input['description'];
		$product->category_id = $input['category_id'];
		$product->seller_id   = auth()->user()->id;
		$product->rate        = $input['rate'];
		$product->sale_rate   = $input['sale_rate'];
		$product->status      = $input['status'];
		$product->created_by  = auth()->user()->id;
		if ($product->save()) {
			//upload Product Image
			foreach ($input['image'] as $key => $value) {
				$path        = public_path(config('path.upload.product')).$product->id.'/';
				$upload      = new FileUploads();
				$uploadFiles = $upload->upload($value, $path);
				//Product Image Insert
				$productImage             = new ProductImage();
				$productImage->product_id = $product->id;
				$productImage->image      = $uploadFiles;
				$productImage->save();
			}
			return true;
		}
	}
}