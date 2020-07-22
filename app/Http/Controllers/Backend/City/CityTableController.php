<?php

namespace App\Http\Controllers\Backend\City;

use App\Http\Controllers\Controller;
use App\Models\City\City;
use App\Repositories\Backend\City\CityRepository;
use Yajra\DataTables\Facades\DataTables;

class CityTableController extends Controller {
	protected $city;
	public function __construct(CityRepository $city) {
		$this->city = $city;
	}

	public function __invoke() {
		$data = $this->city->getForDataTable();
		return Datatables::of($data)
			->escapeColumns(['name'])
			->addColumn('status', function ($status) {
				if ($status->status == "1") {
					return '<span class="badge badge-success">'.trans('global.active').'</span>';
				} else {
					return '<span class="badge badge-danger">'.trans('global.inactive').'</span>';
				}
			})
			->addColumn('actions', function ($city) {
				return $city->action_buttons;
			})
			->make(true);
	}
}
