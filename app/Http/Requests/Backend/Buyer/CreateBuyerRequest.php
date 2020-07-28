<?php

namespace App\Http\Requests\Backend\Buyer;

use Gate;
use Illuminate\Foundation\Http\FormRequest;

class CreateBuyerRequest extends FormRequest {
    public function authorize() {
        return \Gate::allows('buyer_create');
    }

    public function rules() {
        return [

        ];
    }
}
