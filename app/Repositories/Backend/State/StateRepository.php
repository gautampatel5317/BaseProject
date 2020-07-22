<?php

namespace App\Repositories\Backend\State;

use App\Models\City\City;
use App\Repositories\BaseRepository;
use App\Models\State\State;

class StateRepository extends BaseRepository
{

    protected $model;

    public function __construct(State $model)
    {
        $this->model = $model;
    }
    /**
     * Associated Repository Model.
     */
    const MODEL = State::class;

    /**
     * @return mixed
     */
    public function getForDataTable()
    {
        return $this->model
        ->select(config('tables.states_table').'.*', config('tables.country_table').'.name AS country_name')
        ->join(config('tables.country_table'), config('tables.country_table').'.id', '=', config('tables.states_table').'.country_id')
        ->orderByDesc('id')->get();
    }
    /**
     *
     * {@inheritDoc}
     *
     * @see \App\Repositories\State\StateRepositoryInterface::create()
     */
    public function create(array $input)
    {
        $input['created_by'] = auth()->user()->id;
        return State::create($input);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(array $input, $state)
    {
        $input['updated_by'] = auth()->user()->id;
        return $state->update($input);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($state)
    {
        //START : Delete cities based on state_id
        City::where('state_id', $state->id)->delete();
        //END : Delete cities based on state_id
        return $state->delete();
    }
    /**
     * For change State status
     */
    public function changeStatus($id, $status)
    {
        return $this->model->where('id', $id)
            ->update(['status' => $status, 'updated_by' => auth()->user()->id]);
    }

    /**
     * Get states list based on country selection
     */
    public function getStates($countryID)
    {
        $data = $this->model
            ->where('country_id', $countryID)
            ->where('status', '1')
            ->orderByDesc('id')
            ->get();
        return $data;
    }
}
