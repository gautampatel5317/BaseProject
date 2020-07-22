<?php

namespace App\Http\Requests\Backend\Experience;

use App\Experience;
use Illuminate\Foundation\Http\FormRequest;

class StoreExperienceRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('experience_create');
	}

	public function rules() {
		return [
			'name' => 'required',
		];
	}
}
