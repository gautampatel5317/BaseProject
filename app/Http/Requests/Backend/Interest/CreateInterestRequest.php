<?php

namespace App\Http\Requests\Backend\Interest;

use Gate;
use Illuminate\Foundation\Http\FormRequest;

class CreateInterestRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('interest_create');
	}

	public function rules() {
		return [
		];
	}
}
