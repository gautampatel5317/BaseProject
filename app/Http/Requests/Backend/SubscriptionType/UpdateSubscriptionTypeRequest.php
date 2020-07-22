<?php

namespace App\Http\Requests\Backend\SubscriptionType;

use App\Models\SubscriptionType\SubscriptionType;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;

class UpdateSubscriptionTypeRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('subscriptiontype_edit');
	}

	public function rules(Request $request) {
		return [
			'type' => 'required'
		];
	}
}
