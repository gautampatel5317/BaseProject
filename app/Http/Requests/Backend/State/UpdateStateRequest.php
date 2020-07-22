<?php

namespace App\Http\Requests\Backend\State;

use App\Models\State\State;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;

class UpdateStateRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('state_edit');
	}

	public function rules() {
		return [
			'name' => 'required',
            'country_id' => 'required',
		];
	}
}
