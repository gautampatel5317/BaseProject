<?php

namespace App\Http\Requests\Backend\Country;

use Gate;
use Illuminate\Foundation\Http\FormRequest;

class CreateCountryRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('country_create');
	}

	public function rules() {
		return [

		];
	}
}
