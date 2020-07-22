<?php

namespace App\Http\Requests\Backend\SubscriptionType;

use Gate;
use Illuminate\Foundation\Http\FormRequest;

class CreateSubscriptionTypeRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('subscriptiontype_create');
	}

	public function rules() {
		return [

		];
	}
}
