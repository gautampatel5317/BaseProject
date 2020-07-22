<?php

namespace App\Http\Requests\Backend\Permission;

use App\Permission;
use Illuminate\Foundation\Http\FormRequest;

class StorePermissionRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('permission_create');
	}

	public function rules() {
		return [
			'title' => [
				'required',
			],
		];
	}
}
