<?php

namespace App\Http\Requests\Backend\Interest;

use App\Interest;
use Illuminate\Foundation\Http\FormRequest;

class StoreInterestRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('interest_create');
	}

	public function rules() {
		return [
			'name' => 'required',
		];
	}
}
