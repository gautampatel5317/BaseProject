<?php

namespace App\Http\Requests\Backend\SubscriptionType;

use App\SubscriptionType;
use Illuminate\Foundation\Http\FormRequest;

class StoreSubscriptionTypeRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('subscriptiontype_create');
	}

	public function rules() {
		return [
			'type' => 'required'
		];
	}
}
