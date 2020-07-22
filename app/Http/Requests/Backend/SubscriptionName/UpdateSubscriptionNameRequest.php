<?php

namespace App\Http\Requests\Backend\SubscriptionName;

use App\Models\SubscriptionName\SubscriptionName;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;

class UpdateSubscriptionNameRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('subscriptionname_edit');
	}

	public function rules(Request $request) {
		return [
			'name' => 'required'
		];
	}
}
