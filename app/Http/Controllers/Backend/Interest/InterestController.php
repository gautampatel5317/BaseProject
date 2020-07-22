<?php

namespace App\Http\Controllers\Backend\Interest;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\Interest\CreateInterestRequest;
use App\Http\Requests\Backend\Interest\StoreInterestRequest;
use App\Http\Requests\Backend\Interest\UpdateInterestRequest;
use App\Models\Interest\Interest;
use App\Repositories\Backend\Interest\InterestRepository;
use Illuminate\Http\Request;

class InterestController extends Controller
{

    protected $model;
    public function __construct(InterestRepository $model)
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
        abort_unless(\Gate::allows('interest_access'), 403);
        return view('backend.interest.index');
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(CreateInterestRequest $request)
    {
        abort_unless(\Gate::allows('interest_create'), 403);
        return view('backend.interest.create');
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreInterestRequest $request)
    {
        abort_unless(\Gate::allows('interest_create'), 403);
        $input = $request->except('_token');
        $this->model->create($input);
        flash('The Interest Management has been created successfully!')->success()->important();
        return redirect()->route('admin.interest.index');
    }
    public function show(Interest $interest)
    {
        abort_unless(\Gate::allows('interest_show'), 403);
        return view('backend.interest.show', compact('interest'));
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Interest $interest)
    {
        abort_unless(\Gate::allows('interest_edit'), 403);
        return view('backend.interest.edit', compact('interest'));
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateInterestRequest $request, Interest $interest)
    {
        abort_unless(\Gate::allows('interest_edit'), 403);
        $input   = $request->except('_token');
        $this->model->update($input, $interest);
        flash('The Interest Management has been updated successfully!')->success()->important();
        return redirect()->route('admin.interest.index');
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Interest $interest)
    {
        abort_unless(\Gate::allows('interest_delete'), 403);
        $this->model->destroy($interest);
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
