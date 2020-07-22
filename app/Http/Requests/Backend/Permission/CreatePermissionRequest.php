<?php

namespace App\Http\Requests\Backend\Permission;

use Gate;
use Illuminate\Foundation\Http\FormRequest;

class CreatePermissionRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('permission_create');
	}

	public function rules() {
		return [

		];
	}
}
