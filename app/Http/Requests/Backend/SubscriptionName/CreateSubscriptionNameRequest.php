<?php

namespace App\Http\Requests\Backend\SubscriptionName;

use Gate;
use Illuminate\Foundation\Http\FormRequest;

class CreateSubscriptionNameRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('subscriptionname_create');
	}

	public function rules() {
		return [

		];
	}
}
