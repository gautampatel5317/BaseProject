<?php

namespace App\Http\Requests\Backend\Country;

use App\Models\Country\Country;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;

class UpdateCountryRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('country_edit');
	}

	public function rules(Request $request) {
		return [
			'name' => 'required',
            'code' => 'required',
            'phonecode' => 'required'
		];
	}
}
