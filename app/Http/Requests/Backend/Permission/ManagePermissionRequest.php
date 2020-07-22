<?php

namespace App\Http\Requests\Backend\Permission;

use Gate;
use Illuminate\Foundation\Http\FormRequest;

class ManagePermissionRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('permission_access');
	}

	public function rules() {
		return [

		];
	}
}
