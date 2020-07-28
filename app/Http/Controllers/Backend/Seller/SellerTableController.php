<?php

namespace App\Http\Controllers\Backend\Seller;

use App\Http\Controllers\Controller;
use App\Repositories\Backend\Seller\SellerRepository;
use Yajra\DataTables\Facades\DataTables;

class SellerTableController extends Controller
{
    protected $seller;
    public function __construct(SellerRepository $seller)
    {
        $this->seller = $seller;
    }

    public function __invoke()
    {
        $data = $this->seller->getForDataTable();
        return Datatables::of($data)
            ->escapeColumns(['name'])
            ->addColumn('status', function ($status) {
                if ($status->status == "1") {
                    return '<span class="badge badge-success">'.trans('global.active').'</span>';
                } else {
                    return '<span class="badge badge-danger">'.trans('global.inactive').'</span>';
                }
            })
            ->addColumn('actions', function ($seller) {
                return $seller->action_buttons;
            })
            ->make(true);
    }
}
