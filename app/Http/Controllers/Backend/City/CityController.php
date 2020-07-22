<?php

namespace App\Http\Controllers\Backend\City;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\City\CreateCityRequest;
use App\Http\Requests\Backend\City\StoreCityRequest;
use App\Http\Requests\Backend\City\UpdateCityRequest;
use App\Models\City\City;
use App\Repositories\Backend\Country\CountryRepository;
use App\Repositories\Backend\City\CityRepository;
use App\Repositories\Backend\State\StateRepository;
use Illuminate\Http\Request;

class CityController extends Controller
{

    protected $model;
    public function __construct(CityRepository $model)
    {
        $this->model = $model;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        abort_unless(\Gate::allows('city_access'), 403);
        return view('backend.city.index');
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(CreateCityRequest $request, CountryRepository $country)
    {
        $countryData = $country->getCountry();
        abort_unless(\Gate::allows('city_create'), 403);
        return view('backend.city.create', compact('countryData'));
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreCityRequest $request)
    {
        abort_unless(\Gate::allows('city_create'), 403);
        $input = $request->except('_token');
        $this->model->create($input);
        flash(trans('alerts.city_add_message'))->success()->important();
        return redirect()->route('admin.city.index');
    }
    public function show(City $city)
    {
        abort_unless(\Gate::allows('city_show'), 403);
        return view('backend.city.show', compact('city'));
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(City $city, CountryRepository $country)
    {
        $countryData = $country->getCountry();
        abort_unless(\Gate::allows('city_edit'), 403);
        return view('backend.city.edit', compact('city', 'countryData'));
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateCityRequest $request, City $city)
    {
        abort_unless(\Gate::allows('city_edit'), 403);
        $input   = $request->except('_token');
        $this->model->update($input, $city);
        flash(trans('alerts.city_edit_message'))->success()->important();
        return redirect()->route('admin.city.index');
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(City $city)
    {
        abort_unless(\Gate::allows('city_delete'), 403);
        $this->model->destroy($city);
        return "success";
    }

    public function changeStatus(Request $request)
    {
        $input = $request->except('_token');
        $flag = $this->model->changeStatus($input['id'], $input['status']);
        if ($flag == 1) {
            return "success";
        } else {
            return "failed";
        }
    }

    public function getStates(Request $request, StateRepository $state)
    {
        $countryID = $request['country_id'];
        $stateID = $request['state_id'];
        $states = $state->getStates($countryID);
        $html = "<option value = ''>" . trans('global.city.fields.select_state') . "</option>";
        if (count($states) > 0) {
            foreach ($states as $state) {
                $html .= "<option value = '" . $state['id'] . "' ".($state['id'] == $stateID ? 'selected' : '' )." >" . $state['name'] . "</option>";
            }
        }
        $data['success'] = true;
        $data['html'] = $html;
        return json_encode($data);
    }
}
