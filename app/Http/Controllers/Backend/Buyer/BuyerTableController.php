<?php

namespace App\Http\Controllers\Backend\Buyer;

use App\Http\Controllers\Controller;
use App\Repositories\Backend\Buyer\BuyerRepository;
use Yajra\DataTables\Facades\DataTables;

class BuyerTableController extends Controller
{
    protected $buyer;
    public function __construct(BuyerRepository $buyer)
    {
        $this->buyer = $buyer;
    }

    public function __invoke()
    {
        $data = $this->buyer->getForDataTable();
        return Datatables::of($data)
            ->escapeColumns(['name'])
            ->addColumn('status', function ($status) {
                if ($status->status == "1") {
                    return '<span class="badge badge-success">'.trans('global.active').'</span>';
                } else {
                    return '<span class="badge badge-danger">'.trans('global.inactive').'</span>';
                }
            })
            ->addColumn('actions', function ($buyer) {
                return $buyer->action_buttons;
            })
            ->make(true);
    }
}
