<?php

namespace App\Http\Controllers\Backend\Country;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\Country\CreateCountryRequest;
use App\Http\Requests\Backend\Country\StoreCountryRequest;
use App\Http\Requests\Backend\Country\UpdateCountryRequest;
use App\Models\Country\Country;
use App\Repositories\Backend\Country\CountryRepository;
use Illuminate\Http\Request;

class CountryController extends Controller {

	protected $model;
	public function __construct(CountryRepository $model) {
		$this->model = $model;
	}

	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index() {
		abort_unless(\Gate::allows('country_access'), 403);
		return view('backend.country.index');
	}
	/**
	 * Show the form for creating a new resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create(CreateCountryRequest $request) {
		abort_unless(\Gate::allows('country_create'), 403);
		return view('backend.country.create');
	}
	/**
	 * Store a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(StoreCountryRequest $request) {
		abort_unless(\Gate::allows('country_create'), 403);
		$input = $request->except('_token');
		$this->model->create($input);
		flash(trans('alerts.country_add_message'))->success()->important();
		return redirect()->route('admin.country.index');
	}
	public function show(Country $country) {
		abort_unless(\Gate::allows('country_show'), 403);
		return view('backend.country.show', compact('country'));
	}
	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit(Country $country) {
		abort_unless(\Gate::allows('country_edit'), 403);
		return view('backend.country.edit', compact('country'));
	}
	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(UpdateCountryRequest $request, Country $country) {
		abort_unless(\Gate::allows('country_edit'), 403);
		$input = $request->except('_token');
        $this->model->update($input, $country);
        flash(trans('alerts.country_edit_message'))->success()->important();
		return redirect()->route('admin.country.index');
	}
	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy(Country $country) {
		abort_unless(\Gate::allows('country_delete'), 403);
		$this->model->destroy($country);
		return "success";
	}

	public function changeStatus(Request $request) {
		$input = $request->except('_token');
		$flag  = $this->model->changeStatus($input['id'], $input['status']);
		if ($flag == 1) {
			return "success";
		} else {
			return "failed";
		}
	}
}
