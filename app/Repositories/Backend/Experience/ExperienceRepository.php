<?php

namespace App\Repositories\Backend\Experience;

use App\Models\Experience\Experience;
use App\Repositories\BaseRepository;

class ExperienceRepository extends BaseRepository
{

    protected $model;

    public function __construct(Experience $model)
    {
        $this->model = $model;
    }
    /**
     * Associated Repository Model.
     */
    const MODEL = Experience::class;

    /**
     * @return mixed
     */
    public function getForDataTable()
    {
        return $this->model->orderByDesc('id')->get();
    }
    public function getExperience()
    {
        return $this->model->where('status', '1')->orderByDesc('id')->get();
    }
    /**
     *
     * {@inheritDoc}
     *
     * @see \App\Repositories\Experience\ExperienceRepositoryInterface::create()
     */
    public function create(array $input)
    {
        $input['created_by'] = auth()->user()->id;
        return Experience::create($input);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(array $input, $experience)
    {
        $input['updated_by'] = auth()->user()->id;
        return $experience->update($input);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($experience)
    {
        return $experience->delete();
    }
    /**
     * For change Experience status
     */
    public function changeStatus($id, $status)
    {
        return $this->model->where('id', $id)
            ->update(['status' => $status, 'updated_by' => auth()->user()->id]);
    }
}
