<?php

namespace App\Http\Controllers\Backend\City;

use App\Http\Controllers\Controller;
use App\Models\Products\Products;
use App\Repositories\Backend\Products\ProductsRepository;

class ProductsTableController extends Controller {
	protected $products;
	public function __construct(ProductsRepository $products) {
		$this->products = $products;
	}
	public function __invoke() {
		$data = $this->products->getForDataTable();
	}
}