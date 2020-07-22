<?php

namespace App\Http\Requests\Backend\Customer;

use App\Customer;
use Illuminate\Foundation\Http\FormRequest;

class StoreCustomerRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('customer_create');
	}

	public function rules() {
		return [
			'first_name' => 'required',
            'family_name' => 'required',
            'experience' => 'required',
            'business' => 'required'
		];
	}
}
