<?php

namespace App\Http\Requests\Backend\State;

use App\State;
use Illuminate\Foundation\Http\FormRequest;

class StoreStateRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('state_create');
	}

	public function rules() {
		return [
			'name' => 'required',
            'country_id' => 'required',
		];
	}
}
