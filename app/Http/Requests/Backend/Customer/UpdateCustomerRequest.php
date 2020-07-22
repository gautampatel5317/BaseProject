<?php

namespace App\Http\Requests\Backend\Customer;

use App\Models\Customer\Customer;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;

class UpdateCustomerRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('customer_edit');
	}

	public function rules(Request $request) {
		return [
			'family_name' => 'required',
            'experience' => 'required',
            'business' => 'required'
		];
	}
}
