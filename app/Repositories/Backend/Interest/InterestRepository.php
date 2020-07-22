<?php

namespace App\Repositories\Backend\Interest;

use App\Models\Interest\Interest;
use App\Repositories\BaseRepository;

class InterestRepository extends BaseRepository
{

    protected $model;

    public function __construct(Interest $model)
    {
        $this->model = $model;
    }
    /**
     * Associated Repository Model.
     */
    const MODEL = Interest::class;

    /**
     * @return mixed
     */
    public function getForDataTable()
    {
        return $this->model->orderByDesc('id')->get();
    }
    public function getInterest()
    {
        return $this->model->where('status', '1')->orderByDesc('id')->get();
    }
    /**
     *
     * {@inheritDoc}
     *
     * @see \App\Repositories\Interest\InterestRepositoryInterface::create()
     */
    public function create(array $input)
    {
        $input['created_by'] = auth()->user()->id;
        return Interest::create($input);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(array $input, $interest)
    {
        $input['updated_by'] = auth()->user()->id;
        return $interest->update($input);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($interest)
    {
        return $interest->delete();
    }
    /**
     * For change Interest status
     */
    public function changeStatus($id, $status)
    {
        return $this->model->where('id', $id)
            ->update(['status' => $status, 'updated_by' => auth()->user()->id]);
    }
}
