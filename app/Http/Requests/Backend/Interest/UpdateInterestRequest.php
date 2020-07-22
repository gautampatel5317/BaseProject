<?php

namespace App\Http\Requests\Backend\Interest;

use App\Models\Interest\Interest;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;

class UpdateInterestRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('interest_edit');
	}

	public function rules() {
		return [
			'name' => 'required',
		];
	}
}
