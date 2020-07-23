<?php

namespace App\Http\Requests\Backend\Products;

use Gate;
use Illuminate\Foundation\Http\FormRequest;

class CreateProductsRequest extends FormRequest {
    public function authorize() {
        return \Gate::allows('products_create');
    }

    public function rules() {
        return [

        ];
    }
}
