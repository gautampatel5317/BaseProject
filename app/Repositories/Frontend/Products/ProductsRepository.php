<?php

namespace App\Repositories\Backend\Products;

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
	 * @return mixed
	 */
	public function getForDataTable() {
	}
}