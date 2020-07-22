<?php

namespace App\Http\Requests\Backend\City;

use Gate;
use Illuminate\Foundation\Http\FormRequest;

class CreateCityRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('city_create');
	}

	public function rules() {
		return [

		];
	}
}
