<?php

namespace App\Http\Requests\Backend\User;

use Gate;
use Illuminate\Foundation\Http\FormRequest;

class CreateUserRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('user_create');
	}

	public function rules() {
		return [

		];
	}
}
