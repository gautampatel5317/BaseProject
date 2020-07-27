<?php

namespace App\Http\Controllers\Frontend\Products;

use App\Http\Controllers\Controller;
use App\Repositories\Frontend\Products\ProductsRepository;
use Yajra\DataTables\Facades\DataTables;

class ProductsTableController extends Controller {

	protected $product;
	public function __construct(ProductsRepository $product) {
		$this->product = $product;
	}

	public function __invoke() {
		$data = $this->product->getForDataTable();
		return Datatables::of($data)
			->escapeColumns(['category_id'])
			->addColumn('image', function ($product) {
				if (!empty($product->ProductImage)) {
					$image = '<img style="height: 40px;" src="https://rukminim1.flixcart.com/image/416/416/mouse/m/b/s/amkette-kwik-pro-kp-10-usb-original-imaekwwrqkgxcdf2.jpeg?q=70">';
				} else {
					$image = '<img style="height: 40px;" src="https://rukminim1.flixcart.com/image/416/416/mouse/m/b/s/amkette-kwik-pro-kp-10-usb-original-imaekwwrqkgxcdf2.jpeg?q=70">';
				}
				return $image;
			})
			->addColumn('status', function ($status) {
				if ($status->status == "1") {
					return '<span class="badge badge-success">'.trans('global.active').'</span>';
				} else {
					return '<span class="badge badge-danger">'.trans('global.inactive').'</span>';
				}
			})
			->addColumn('actions', function ($product) {
				return $product->action_buttons;
			})
			->make(true);
	}
}
