<?php

namespace App\Http\Controllers\Backend\State;

use App\Http\Controllers\Controller;
use App\Repositories\Backend\State\StateRepository;
use App\Models\State\State;
use Yajra\DataTables\Facades\DataTables;

class StateTableController extends Controller
{
    protected $state;
    public function __construct(StateRepository $state)
    {
        $this->state = $state;
    }

    public function __invoke()
    {
        $data = $this->state->getForDataTable();
        return Datatables::of($data)
            ->escapeColumns(['name'])
            ->addColumn('status', function ($status) {
                if ($status->status == "1") {
                    return '<span class="badge badge-success">'.trans('global.active').'</span>';
                } else {
                    return '<span class="badge badge-danger">'.trans('global.inactive').'</span>';
                }
            })
            ->addColumn('actions', function ($state) {
                return $state->action_buttons;
            })
            ->make(true);
    }
}
