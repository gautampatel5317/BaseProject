<?php

namespace App\Http\Controllers\Backend\Interest;

use App\Http\Controllers\Controller;
use App\Models\Interest\Interest;
use App\Repositories\Backend\Interest\InterestRepository;
use Yajra\DataTables\Facades\DataTables;

class InterestTableController extends Controller {
	protected $interest;
	public function __construct(InterestRepository $interest) {
		$this->interest = $interest;
	}

	public function __invoke() {
        $data = $this->interest->getForDataTable();
        return Datatables::of($data)
            ->escapeColumns(['name'])
            ->addColumn('created_at', function ($data) {
				if (!empty($data->created_at)) {
					$createadAt = date('Y-m-d', strtotime($data->created_at));
					return $createadAt;
				}
				return '-';
			})
			->addColumn('updated_at', function ($data) {
				if (!empty($data->updated_at)) {
					$updatedAt = date('Y-m-d', strtotime($data->updated_at));
					return $updatedAt;
				}
				return '-';
			})
			->addColumn('status', function ($status) {
				if ($status->status == "1") {
					return '<span class="badge badge-success">'.trans('global.active').'</span>';
				} else {
					return '<span class="badge badge-danger">'.trans('global.inactive').'</span>';
				}
			})
			->addColumn('actions', function ($interest) {
				return $interest->action_buttons;
			})
			->make(true);
	}
}
