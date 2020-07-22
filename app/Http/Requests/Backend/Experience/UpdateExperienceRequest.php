<?php

namespace App\Http\Requests\Backend\Experience;

use App\Models\Experience\Experience;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;

class UpdateExperienceRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('experience_edit');
	}

	public function rules() {
		return [
			'name' => 'required',
		];
	}
}
