<?php

namespace App\Http\Requests\Backend\Customer;

use Gate;
use Illuminate\Foundation\Http\FormRequest;

class CreateCustomerRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('customer_create');
	}

	public function rules() {
		return [

		];
	}
}
