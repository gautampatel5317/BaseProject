<?php

namespace App\Http\Requests\Backend\Buyer;

use App\Models\Buyer\Buyer;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;

class UpdateBuyerRequest extends FormRequest
{
    public function authorize()
    {
        return \Gate::allows('buyer_edit');
    }

    public function rules(Request $request)
    {
        $rules = [
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => "required|unique:users,email,{$request->id}",
        ];
        return $rules;
    }
}
