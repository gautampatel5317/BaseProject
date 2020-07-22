<?php

namespace App\Http\Requests\Backend\SubscriptionName;

use App\SubscriptionName;
use Illuminate\Foundation\Http\FormRequest;

class StoreSubscriptionNameRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('subscriptionname_create');
	}

	public function rules() {
		return [
			'name' => 'required'
		];
	}
}
