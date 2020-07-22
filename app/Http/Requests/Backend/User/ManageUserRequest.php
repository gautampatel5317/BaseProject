<?php

namespace App\Http\Requests\Backend\User;

use Gate;
use Illuminate\Foundation\Http\FormRequest;

class ManageUserRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('user_access');
	}

	public function rules() {
		return [

		];
	}
}
