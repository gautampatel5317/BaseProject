<?php

namespace App\Http\Controllers\Backend\State;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\State\CreateStateRequest;
use App\Http\Requests\Backend\State\StoreStateRequest;
use App\Http\Requests\Backend\State\UpdateStateRequest;
use App\Models\State\State;
use App\Repositories\Backend\Country\CountryRepository;
use App\Repositories\Backend\State\StateRepository;
use Illuminate\Http\Request;

class StateController extends Controller
{

    protected $model;
    public function __construct(StateRepository $model)
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
        abort_unless(\Gate::allows('state_access'), 403);
        return view('backend.state.index');
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(CreateStateRequest $request, CountryRepository $country)
    {
        $countryData = $country->getCountry();
        abort_unless(\Gate::allows('state_create'), 403);
        return view('backend.state.create', compact('countryData'));
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreStateRequest $request)
    {
        abort_unless(\Gate::allows('state_create'), 403);
        $input = $request->except('_token');
        $this->model->create($input);
        flash(trans('alerts.state_add_message'))->success()->important();
        return redirect()->route('admin.state.index');
    }
    public function show(State $state)
    {
        abort_unless(\Gate::allows('state_show'), 403);
        return view('backend.state.show', compact('state'));
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(State $state, CountryRepository $country)
    {
        $countryData = $country->getCountry();
        abort_unless(\Gate::allows('state_edit'), 403);
        return view('backend.state.edit', compact('state', 'countryData'));
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateStateRequest $request, State $state)
    {
        abort_unless(\Gate::allows('state_edit'), 403);
        $input   = $request->except('_token');
        $this->model->update($input, $state);
        flash(trans('alerts.state_update_message'))->success()->important();
        return redirect()->route('admin.state.index');
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(State $state)
    {
        abort_unless(\Gate::allows('state_delete'), 403);
        $this->model->destroy($state);
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
}
