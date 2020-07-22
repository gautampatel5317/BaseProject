<?php

namespace App\Http\Requests\Backend\Role;

use Gate;
use Illuminate\Foundation\Http\FormRequest;

class ManageRoleRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('role_access');
	}

	public function rules() {
		return [

		];
	}
}
