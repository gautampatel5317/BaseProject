<?php

namespace App\Http\Controllers\Backend\Country;

use App\Http\Controllers\Controller;
use App\Repositories\Backend\Country\CountryRepository;
use App\Models\Country\Country;
use Yajra\DataTables\Facades\DataTables;

class CountryTableController extends Controller
{
    protected $country;
    public function __construct(CountryRepository $country)
    {
        $this->country = $country;
    }

    public function __invoke()
    {
        $data = $this->country->getForDataTable();
        return Datatables::of($data)
            ->escapeColumns(['name'])
            ->addColumn('status', function ($status) {
                if ($status->status == "1") {
                    return '<span class="badge badge-success">'.trans('global.active').'</span>';
                } else {
                    return '<span class="badge badge-danger">'.trans('global.inactive').'</span>';
                }
            })
            ->addColumn('actions', function ($country) {
                return $country->action_buttons;
            })
            ->make(true);
    }
}
