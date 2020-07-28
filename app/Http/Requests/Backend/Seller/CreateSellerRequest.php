<?php

namespace App\Http\Requests\Backend\Seller;

use Gate;
use Illuminate\Foundation\Http\FormRequest;

class CreateSellerRequest extends FormRequest {
    public function authorize() {
        return \Gate::allows('seller_create');
    }

    public function rules() {
        return [

        ];
    }
}
