<?php

namespace App\Repositories\Backend\Country;

use App\Models\City\City;
use App\Repositories\BaseRepository;
use App\Models\Country\Country;
use App\Models\State\State;
use Illuminate\Support\Facades\DB;

class CountryRepository extends BaseRepository
{

    protected $model;

    public function __construct(Country $model)
    {
        $this->model = $model;
    }
    /**
     * Associated Repository Model.
     */
    const MODEL = Country::class;

    /**
     * @return mixed
     */
    public function getForDataTable()
    {
        return $this->model->orderByDesc('id')->get();
    }

    public function getCountry()
    {
        return $this->model->where('status', '1')->orderByDesc('id')->get();
    }
    /**
     *
     * {@inheritDoc}
     *
     * @see \App\Repositories\Country\CountryRepositoryInterface::create()
     */
    public function create(array $input)
    {
        $input['created_by'] = auth()->user()->id;
        return Country::create($input);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(array $input, $country)
    {
        $input['updated_by'] = auth()->user()->id;
        return $country->update($input);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($country)
    {
        //START : Delete states & cities based on country_id
        City::where('country_id', $country->id)->delete();
        State::where('country_id', $country->id)->delete();
        //END : Delete states & cities based on country_id
        return $country->delete();
    }
    /**
     * For change country status
     */
    public function changeStatus($id, $status)
    {
        return $this->model->where('id', $id)
            ->update(['status' => $status, 'updated_by' => auth()->user()->id]);
    }
}
