<?php

namespace App\Repositories\Backend\City;

use App\Models\CityTranslation\CityTranslation;
use App\Models\City\City;
use App\Repositories\BaseRepository;

class CityRepository extends BaseRepository
{

    protected $model;

    public function __construct(City $model)
    {
        $this->model = $model;
    }
    /**
     * Associated Repository Model.
     */
    const MODEL = City::class;

    /**
     * @return mixed
     */
    public function getForDataTable()
    {
        // return $this->model->select(config("tables.city_table") . '.*', config("tables.country_table") . '.name AS country_name', config("tables.states_table") . '.name AS state_name')
        //     ->leftjoin(config("tables.country_table"), config("tables.country_table") . '.id', '=', config("tables.city_table") . '.country_id')
        //     ->leftjoin(config("tables.states_table"), config("tables.states_table") . '.id', '=', config("tables.city_table") . '.state_id')
        //     ->orderByDesc('cities.id')->get();

        return $this->model
            ->select(
                config('tables.city_table') . '.*',
                config('tables.city_translations_table') . '.name',
                config('tables.state_translations_table') . '.name AS state_name',
                config('tables.country_translations_table') . '.name AS country_name'
            )
            ->join(config('tables.city_translations_table'), function ($join) {
                $join->on(config('tables.city_table') . '.id', '=', config('tables.city_translations_table') . '.city_id')
                    ->where(config('tables.city_translations_table') . '.language', '=', app()->getLocale());
            })
            ->join(config('tables.state_translations_table'), function ($join1) {
                $join1->on(config('tables.city_table') . '.state_id', '=', config('tables.state_translations_table') . '.state_id')
                    ->where(config('tables.state_translations_table') . '.language', '=', app()->getLocale());
            })
            ->join(config('tables.country_translations_table'), function ($join2) {
                $join2->on(config('tables.city_table') . '.country_id', '=', config('tables.country_translations_table') . '.country_id')
                    ->where(config('tables.country_translations_table') . '.language', '=', app()->getLocale());
            })
            ->orderByDesc(config('tables.city_table') . '.id')->get();
    }
    /**
     *
     * {@inheritDoc}
     *
     * @see \App\Repositories\City\CityRepositoryInterface::create()
     */
    function create(array $input)
    {
        $city = new City();
        $city->country_id = $input['country_id'];
        $city->state_id = $input['state_id'];
        $city->status = $input['status'];
        $city->created_by = auth()->user()->id;
        $city->updated_by = auth()->user()->id;

        if ($city->save()) {
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
                $cityTranslate = [];
                $cityTranslate['city_id'] = $city->id;
                $cityTranslate['name'] = (isset($input['name'][$language]) ? $input['name'][$language] : $defaultName);
                $cityTranslate['language'] = $language;
                CityTranslation::create($cityTranslate);
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
    function update(array $input, $city)
    {

        $update = City::where('id', $city->id)->update([
            'country_id' => $input['country_id'],
            'state_id' => $input['state_id'],
            'status' => trim($input['status']),
            'updated_by' => auth()->user()->id,
        ]);
        //Multiple language data
        foreach (config('panel.available_languages') as $language => $value) {
            CityTranslation::updateOrCreate(
                ['city_id' => $city->id, 'language' => $language],
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
    function destroy($city)
    {
        $record = $this->model->find($city->id);
        return $record->delete();
    }
    /**
     * For change City status
     */
    function changeStatus($id, $status)
    {
        return $this->model->where('id', $id)
            ->update(['status' => $status, 'updated_by' => auth()->user()->id]);
    }
    /**
     * Get City Name with all languages
     */
    function getCityName($id)
    {
        $datas = CityTranslation::where('city_id', $id)->get();
        foreach ($datas as $data) {
            $cityName['name'][$data->language] = $data->name;
        }
        return $cityName;
    }
}
