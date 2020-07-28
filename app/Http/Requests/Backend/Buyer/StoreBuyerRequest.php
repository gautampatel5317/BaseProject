<?php

namespace App\Http\Requests\Backend\Buyer;

use App\Buyer;
use Illuminate\Foundation\Http\FormRequest;

class StoreBuyerRequest extends FormRequest
{
    public function authorize()
    {
        return \Gate::allows('buyer_create');
    }

    public function rules()
    {
        $rules = [
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => 'required|unique:users,email',
            'password' => 'required',
        ];

        return $rules;
    }
}
