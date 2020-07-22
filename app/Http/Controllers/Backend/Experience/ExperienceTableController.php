<?php

namespace App\Http\Controllers\Backend\Experience;

use App\Http\Controllers\Controller;
use App\Models\Experience\Experience;
use App\Repositories\Backend\Experience\ExperienceRepository;
use Yajra\DataTables\Facades\DataTables;

class ExperienceTableController extends Controller {
	protected $experience;
	public function __construct(ExperienceRepository $experience) {
		$this->experience = $experience;
	}

	public function __invoke() {
        $data = $this->experience->getForDataTable();
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
			->addColumn('actions', function ($experience) {
				return $experience->action_buttons;
			})
			->make(true);
	}
}
