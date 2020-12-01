<?php

namespace App\Repositories\Backend\State;

use App\Models\City\City;
use App\Models\StateTranslation\StateTranslation;
use App\Models\State\State;
use App\Repositories\BaseRepository;

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
        // return $this->model
        //     ->select(config('tables.states_table') . '.*', config('tables.country_table') . '.name AS country_name')
        //     ->join(config('tables.country_table'), config('tables.country_table') . '.id', '=', config('tables.states_table') . '.country_id')
        //     ->orderByDesc('id')->get();

        return $this->model
            ->select(
                config('tables.states_table') . '.*', config('tables.country_translations_table') . '.name AS country_name',
                config('tables.state_translations_table') . '.name'
            )
            ->join(config('tables.state_translations_table'), function ($join) {
                $join->on(config('tables.states_table') . '.id', '=', config('tables.state_translations_table') . '.state_id')
                    ->where(config('tables.state_translations_table') . '.language', '=', app()->getLocale());
            })
            ->join(config('tables.country_translations_table'), function ($join1) {
                $join1->on(config('tables.country_translations_table') . '.country_id', '=', config('tables.states_table') . '.country_id')
                    ->where(config('tables.country_translations_table') . '.language', '=', app()->getLocale());
            })
            ->orderByDesc(config('tables.states_table') . '.id')->get();
    }
    /**
     *
     * {@inheritDoc}
     *
     * @see \App\Repositories\State\StateRepositoryInterface::create()
     */
    function create(array $input)
    {
        $state = new State();
        $state->country_id = $input['country_id'];
        $state->status = $input['status'];
        $state->created_by = auth()->user()->id;
        $state->updated_by = auth()->user()->id;

        if ($state->save()) {
            if (isset($input['name']['en'])) {
                $defaultName = $input['name']['en'];
            } elseif (isset($input['name']['fr'])) {
                $defaultName = $input['name']['fr'];
            } elseif (isset($input['name']['sp'])) {
                $defaultName = $input['name']['sp'];
            } elseif (isset($input['name']['cr'])) {
                $defaultName = $input['name']['cr'];
            }
            //Multiple language data
            foreach (config('panel.available_languages') as $language => $value) {
                $stateTranslate = [];
                $stateTranslate['state_id'] = $state->id;
                $stateTranslate['name'] = (isset($input['name'][$language]) ? $input['name'][$language] : $defaultName);
                $stateTranslate['language'] = $language;
                StateTranslation::create($stateTranslate);
            }
            return true;
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    function update(array $input, $state)
    {
        $update = State::where('id', $state->id)->update([
            'country_id' => $input['country_id'],
            'status' => trim($input['status']),
            'updated_by' => auth()->user()->id,
        ]);
        //Multiple language data
        foreach (config('panel.available_languages') as $language => $value) {
            StateTranslation::updateOrCreate(
                ['state_id' => $state->id, 'language' => $language],
                [
                    'name' => trim($input['name'][$language]),
                ]
            );
        }
        return true;
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    function destroy($state)
    {
        //START : Delete cities based on state_id
        City::where('state_id', $state->id)->delete();
        //END : Delete cities based on state_id
        StateTranslation::where('state_id', $state->id)->delete();
        $record = $this->model->find($state->id);
        return $record->delete();
    }
    /**
     * For change State status
     */
    function changeStatus($id, $status)
    {
        return $this->model->where('id', $id)
            ->update(['status' => $status, 'updated_by' => auth()->user()->id]);
    }
    /**
     * Get State Name with all languages
     */
    function getStateName($id)
    {
        $datas = StateTranslation::where('state_id', $id)->get();
        foreach ($datas as $data) {
            $stateName['name'][$data->language] = $data->name;
        }
        return $stateName;
    }
    /**
     * Get states list based on country selection
     */
    function getStates($countryID)
    {
        $data = $this->model
            ->select(
                config('tables.states_table') . '.id',
                config('tables.state_translations_table') . '.name'
            )
            ->join(config('tables.state_translations_table'), function ($join) {
                $join->on(config('tables.states_table') . '.id', '=', config('tables.state_translations_table') . '.state_id')
                    ->where(config('tables.state_translations_table') . '.language', '=', app()->getLocale());
            })
            ->where(config('tables.states_table') . '.country_id', '=', $countryID)
            ->orderByDesc(config('tables.states_table') . '.id')->get();
        return $data;
    }
}
