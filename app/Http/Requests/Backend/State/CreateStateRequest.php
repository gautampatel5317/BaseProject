<?php

namespace App\Http\Requests\Backend\State;

use Gate;
use Illuminate\Foundation\Http\FormRequest;

class CreateStateRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('state_create');
	}

	public function rules() {
		return [

		];
	}
}
