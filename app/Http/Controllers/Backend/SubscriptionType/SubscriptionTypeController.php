<?php

namespace App\Http\Controllers\Backend\SubscriptionType;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\SubscriptionType\CreateSubscriptionTypeRequest;
use App\Http\Requests\Backend\SubscriptionType\StoreSubscriptionTypeRequest;
use App\Http\Requests\Backend\SubscriptionType\UpdateSubscriptionTypeRequest;
use App\Models\SubscriptionType\SubscriptionType;
use App\Repositories\Backend\SubscriptionType\SubscriptionTypeRepository;
use Illuminate\Http\Request;

class SubscriptionTypeController extends Controller {

	protected $model;
	public function __construct(SubscriptionTypeRepository $model) {
		$this->model = $model;
	}

	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index() {
		abort_unless(\Gate::allows('subscriptiontype_access'), 403);
		return view('backend.subscriptiontype.index');
	}
	/**
	 * Show the form for creating a new resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create(CreateSubscriptionTypeRequest $request) {
		abort_unless(\Gate::allows('subscriptiontype_create'), 403);
		return view('backend.subscriptiontype.create');
	}
	/**
	 * Store a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(StoreSubscriptionTypeRequest $request) {
		abort_unless(\Gate::allows('subscriptiontype_create'), 403);
		$input = $request->except('_token');
        $this->model->create($input);
		flash(trans('alerts.subscription_add_message'))->success()->important();
		return redirect()->route('admin.subscriptiontype.index');
	}
	public function show(SubscriptionType $subscriptiontype) {
		abort_unless(\Gate::allows('subscriptiontype_show'), 403);
		return view('backend.subscriptiontype.show', compact('subscriptiontype'));
	}
	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit(SubscriptionType $subscriptiontype) {
		abort_unless(\Gate::allows('subscriptiontype_edit'), 403);
		return view('backend.subscriptiontype.edit', compact('subscriptiontype'));
	}
	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(UpdateSubscriptionTypeRequest $request, SubscriptionType $subscriptiontype) {
		abort_unless(\Gate::allows('subscriptiontype_edit'), 403);
		$input = $request->except('_token');
		$this->model->update($input, $subscriptiontype);
		flash(trans('alerts.subscription_edit_message'))->success()->important();
		return redirect()->route('admin.subscriptiontype.index');
	}
	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy(SubscriptionType $subscriptiontype) {
		abort_unless(\Gate::allows('subscriptiontype_delete'), 403);
		$this->model->destroy($subscriptiontype);
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
