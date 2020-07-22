<?php

namespace App\Http\Requests\Backend\City;

use App\City;
use Illuminate\Foundation\Http\FormRequest;

class StoreCityRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('city_create');
	}

	public function rules() {
		return [
			'name' => 'required',
            'country_id' => 'required',
            'state_id' => 'required',
		];
	}
}
