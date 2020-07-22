<?php

namespace App\Http\Requests\Backend\City;

use App\Models\City\City;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;

class UpdateCityRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('city_edit');
	}

	public function rules() {
		return [
			'name' => 'required',
            'country_id' => 'required',
            'state_id' => 'required',
		];
	}
}
