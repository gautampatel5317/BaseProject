<?php

namespace App\Repositories\Backend\Country;

use App\Models\City\City;
use App\Models\CountryTranslation\CountryTranslation;
use App\Models\Country\Country;
use App\Models\State\State;
use App\Repositories\BaseRepository;

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
        return $this->model
            ->select(
                config('tables.country_table') . '.*',
                config('tables.country_translations_table') . '.name'
            )
            ->join(config('tables.country_translations_table'), function ($join) {
                $join->on(config('tables.country_table') . '.id', '=', config('tables.country_translations_table') . '.country_id')
                    ->where(config('tables.country_translations_table') . '.language', '=', app()->getLocale());
            })
            ->orderByDesc(config('tables.country_table') . '.id')->get();
    }

    function getCountry()
    {
        return $this->model
            ->select(
                config('tables.country_table') . '.*',
                config('tables.country_translations_table') . '.name'
            )
            ->join(config('tables.country_translations_table'), function ($join) {
                $join->on(config('tables.country_table') . '.id', '=', config('tables.country_translations_table') . '.country_id')
                    ->where(config('tables.country_translations_table') . '.language', '=', app()->getLocale());
            })
            ->where(config('tables.country_table') . '.status', '=', '1')
            ->orderByDesc(config('tables.country_table') . '.id')->get();
        // return $this->model->where('status', '1')->orderByDesc('id')->get();
    }
    /**
     *
     * {@inheritDoc}
     */
    function create(array $input)
    {
        $country = new Country();
        $country->code = $input['code'];
        $country->phonecode = $input['phonecode'];
        $country->status = $input['status'];
        $country->created_by = auth()->user()->id;
        $country->updated_by = auth()->user()->id;

        if ($country->save()) {
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
                $countryTranslate = [];
                $countryTranslate['country_id'] = $country->id;
                $countryTranslate['name'] = (isset($input['name'][$language]) ? $input['name'][$language] : $defaultName);
                $countryTranslate['language'] = $language;
                CountryTranslation::create($countryTranslate);
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
    function update(array $input, $country)
    {
        $update = Country::where('id', $country->id)->update([
            'code' => $input['code'],
            'phonecode' => $input['phonecode'],
            'status' => trim($input['status']),
            'updated_by' => auth()->user()->id,
        ]);
        //Multiple language data
        foreach (config('panel.available_languages') as $language => $value) {
            CountryTranslation::updateOrCreate(
                ['country_id' => $country->id, 'language' => $language],
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
    function destroy($country)
    {
        //START : Delete states & cities based on country_id
        City::where('country_id', $country->id)->delete();
        State::where('country_id', $country->id)->delete();
        //END : Delete states & cities based on country_id
        CountryTranslation::where('country_id', $country->id)->delete();
        $record = $this->model->find($country->id);
        return $record->delete();
    }
    /**
     * For change country status
     */
    function changeStatus($id, $status)
    {
        return $this->model->where('id', $id)
            ->update(['status' => $status, 'updated_by' => auth()->user()->id]);
    }
    /**
     * Get Country Name with all languages
     */
    function getCountryName($id)
    {
        $datas = CountryTranslation::where('country_id', $id)->get();
        foreach ($datas as $data) {
            $countryName['name'][$data->language] = $data->name;
        }
        return $countryName;
    }
}
