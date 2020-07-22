<?php

namespace App\Http\Requests\Backend\User;

use App\User;
use Illuminate\Foundation\Http\FormRequest;

class ProfileUserRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('user_edit');
	}

	public function rules() {
		return [
			'current_password' => [
				'required',
			],
			'new_password' => [
				'required',
				'min:6',
				'confirmed',
			],
		];
	}
}
