<?php

namespace App\Http\Controllers\Backend\SubscriptionType;

use App\Http\Controllers\Controller;
use App\Repositories\Backend\SubscriptionType\SubscriptionTypeRepository;
use Illuminate\Http\Request;
use App\Models\SubscriptionType\SubscriptionType;
use Yajra\DataTables\Facades\DataTables;

class SubscriptionTypeTableController extends Controller
{
    protected $subscriptiontype;
    public function __construct(SubscriptionTypeRepository $subscriptiontype)
    {
        $this->subscriptiontype = $subscriptiontype;
    }

    public function __invoke()
    {
        $data = $this->subscriptiontype->getForDataTable();
        return Datatables::of($data)
            ->escapeColumns(['type'])
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
