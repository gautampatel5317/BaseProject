<?php

namespace App\Http\Requests\Backend\Seller;

use App\Models\Seller\Seller;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;

class UpdateSellerRequest extends FormRequest
{
    public function authorize()
    {
        return \Gate::allows('seller_edit');
    }

    public function rules(Request $request)
    {
        $rules = [
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => "required|unique:users,email,{$request->user_id}",
            'password' => '',
            'shop_name' => 'required',
            'shop_url' => 'required',
            'phone_number' => 'required',
        ];
        return $rules;
    }
}
