<?php

namespace App\Http\Controllers\Frontend\Products;

use App\Http\Controllers\Controller;
use App\Repositories\Frontend\Products\ProductsRepository;
use Yajra\DataTables\Facades\DataTables;

class ProductsTableController extends Controller {

	protected $product;
	public function __construct(ProductsRepository $product) {
		$this->product       = $product;
		$this->imagePath     = public_path(config('path.upload.product'));
		$this->imageHttpPath = url(config('path.upload.product'));
	}

	public function __invoke() {
		$data = $this->product->getForDataTable();
		return Datatables::of($data)
			->escapeColumns(['category_id'])
			->addColumn('image', function ($product) {
				if (!empty($product->ProductImage)) {
					$imageArr = $product->ProductImage->first();
					if (file_exists($this->imagePath.$product->id.'/'.$imageArr->image)) {
						$product_url = $this->imageHttpPath.'/'.$product->id.'/'.$imageArr->image;
						return "<img src = '".$product_url."' width = '100px' >";
					} else {
						return '<div class="fa-stack fa-3x"><i class="fa fa-camera-retro fa-stack-1x"></i><i class="fa fa-ban fa-stack-2x"></i></div>';
					}
				}

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
