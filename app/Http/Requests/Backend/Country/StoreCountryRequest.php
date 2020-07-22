<?php

namespace App\Http\Requests\Backend\Country;

use App\Country;
use Illuminate\Foundation\Http\FormRequest;

class StoreCountryRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('country_create');
	}

	public function rules() {
		return [
			'name' => 'required',
            'code' => 'required',
            'phonecode' => 'required'
		];
	}
}
