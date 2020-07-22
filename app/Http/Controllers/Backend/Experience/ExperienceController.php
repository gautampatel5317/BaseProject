<?php

namespace App\Http\Controllers\Backend\Experience;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\Experience\CreateExperienceRequest;
use App\Http\Requests\Backend\Experience\StoreExperienceRequest;
use App\Http\Requests\Backend\Experience\UpdateExperienceRequest;
use App\Models\Experience\Experience;
use App\Repositories\Backend\Experience\ExperienceRepository;
use Illuminate\Http\Request;

class ExperienceController extends Controller
{

    protected $model;
    public function __construct(ExperienceRepository $model)
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
        abort_unless(\Gate::allows('experience_access'), 403);
        return view('backend.experience.index');
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(CreateExperienceRequest $request)
    {
        abort_unless(\Gate::allows('experience_create'), 403);
        return view('backend.experience.create');
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreExperienceRequest $request)
    {
        abort_unless(\Gate::allows('experience_create'), 403);
        $input = $request->except('_token');
        $this->model->create($input);
        flash(trans('alerts.level_experience_add_message'))->success()->important();
        return redirect()->route('admin.experience.index');
    }
    public function show(Experience $experience)
    {
        abort_unless(\Gate::allows('experience_show'), 403);
        return view('backend.experience.show', compact('experience'));
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Experience $experience)
    {
        abort_unless(\Gate::allows('experience_edit'), 403);
        return view('backend.experience.edit', compact('experience'));
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateExperienceRequest $request, Experience $experience)
    {
        abort_unless(\Gate::allows('experience_edit'), 403);
        $input   = $request->except('_token');
        $this->model->update($input, $experience);
        flash(trans('alerts.level_experience_edit_message'))->success()->important();
        return redirect()->route('admin.experience.index');
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Experience $experience)
    {
        abort_unless(\Gate::allows('experience_delete'), 403);
        $this->model->destroy($experience);
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
