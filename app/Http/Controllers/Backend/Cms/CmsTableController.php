<?php

namespace App\Http\Controllers\Backend\Cms;

use App\Http\Controllers\Controller;
use App\Repositories\Backend\Cms\CmsRepository;

use Yajra\DataTables\Facades\DataTables;

class CmsTableController extends Controller
{

    protected $cms;
    public function __construct(CmsRepository $cms)
    {
        $this->cms = $cms;
    }
    /**
     * @param $request
     *
     * @return mixed
     */
    public function __invoke()
    {
        $data = $this->cms->getForDataTable();
        return DataTables::of($data)
            ->escapeColumns(['title'])
            ->addColumn('status', function ($status) {
                if ($status->status == "1") {
                    return '<span class="badge badge-success">'.trans('global.active').'</span>';
                } else {
                    return '<span class="badge badge-danger">'.trans('global.inactive').'</span>';
                }
            })
            ->addColumn('created_at', function ($user) {
				if (!empty($user->created_at)) {
					$createadAt = date('Y-m-d', strtotime($user->created_at));
					return $createadAt;
				}
				return '-';
			})
			->addColumn('updated_at', function ($user) {
				if (!empty($user->updated_at)) {
					$updatedAt = date('Y-m-d', strtotime($user->updated_at));
					return $updatedAt;
				}
				return '-';
			})
            ->addColumn('actions', function ($Customer) {
                return $Customer->action_buttons;
            })
            ->make(true);
    }
}
