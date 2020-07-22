<?php

namespace App\Http\Requests\Backend\Experience;

use Gate;
use Illuminate\Foundation\Http\FormRequest;

class CreateExperienceRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('experience_create');
	}

	public function rules() {
		return [
		];
	}
}
