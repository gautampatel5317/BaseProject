<?php

namespace App\Http\Requests\Backend\Role;

use Gate;
use Illuminate\Foundation\Http\FormRequest;

class CreateRoleRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('role_create');
	}

	public function rules() {
		return [

		];
	}
}
