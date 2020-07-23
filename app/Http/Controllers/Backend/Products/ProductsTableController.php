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
    }

    public function __invoke()
    {
        $data = $this->products->getForDataTable();
        // dd($data);
        return Datatables::of($data)
            ->escapeColumns(['name'])
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
