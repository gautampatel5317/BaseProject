<?php

namespace App\Http\Controllers\Backend\Products;

use App\Http\Controllers\Controller;
use App\Repositories\Backend\Products\ProductsRepository;
use App\Models\Products\Products;
use Yajra\DataTables\Facades\DataTables;

class ProductsTableController extends Controller
{
    protected $products;
    public function __construct(ProductsRepository $products)
    {
        $this->products = $products;
        $this->imagePath = public_path('images/product/');
        $this->imageHttpPath = url('/images/product');
    }

    public function __invoke()
    {
        $data = $this->products->getForDataTable();
        return Datatables::of($data)
            ->escapeColumns(['name'])
            ->addColumn('image', function ($data) {
                if(file_exists($this->imagePath. $data->id .'/images/'. $data->image )) {
                    $product_url = $this->imageHttpPath. '/'. $data->id .'/images/'. $data->image;
                    return "<img src = '" . $product_url . "' width = '100px' >";
                } else {
                    return '<div class="fa-stack fa-3x"><i class="fa fa-camera-retro fa-stack-1x"></i><i class="fa fa-ban fa-stack-2x"></i></div>';
                }
            })
            ->addColumn('status', function ($status) {
                if ($status->status == "1") {
                    return '<span class="badge badge-success">'.trans('global.active').'</span>';
                } else {
                    return '<span class="badge badge-danger">'.trans('global.inactive').'</span>';
                }
            })
            ->addColumn('actions', function ($products) {
                return $products->action_buttons;
            })
            ->make(true);
    }
}
