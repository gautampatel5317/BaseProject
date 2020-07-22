<?php

namespace App\Http\Controllers\Backend\SubscriptionName;

use App\Http\Controllers\Controller;
use App\Repositories\Backend\SubscriptionName\SubscriptionNameRepository;
use Illuminate\Http\Request;
use App\Models\SubscriptionName\SubscriptionName;
use Yajra\DataTables\Facades\DataTables;

class SubscriptionNameTableController extends Controller
{
    protected $subscriptionname;
    public function __construct(SubscriptionNameRepository $subscriptionname)
    {
        $this->subscriptionname = $subscriptionname;
    }

    public function __invoke()
    {
        $data = $this->subscriptionname->getForDataTable();
        return Datatables::of($data)
            ->escapeColumns(['name'])
            ->addColumn('checkbox', function ($subscription) {
				return "";
			})
            ->addColumn('status', function ($status) {
                if ($status->status == "1") {
                    return '<span class="badge badge-success">'.trans('global.active').'</span>';
                } else {
                    return '<span class="badge badge-danger">'.trans('global.inactive').'</span>';
                }
            })
            ->addColumn('actions', function ($subscription) {
                return $subscription->action_buttons;
            })
            ->make(true);
    }
}
