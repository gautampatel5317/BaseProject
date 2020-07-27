<?php

namespace App\Http\Requests\Backend\Seller;

use App\Seller;
use Illuminate\Foundation\Http\FormRequest;

class StoreSellerRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('seller_create');
	}

	public function rules() {
        $rules = [
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => 'required|unique:users,email',
            'password' => 'required',
            'shop_name' => 'required',
            'shop_url' => 'required',
            'phone_number' => 'required',
        ];
        
        return $rules;
	}
}
