<?php

namespace App\Http\Requests\Backend\Category;

use Gate;
use Illuminate\Foundation\Http\FormRequest;

class CreateCategoryRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('category_create');
	}

	public function rules() {
		return [

		];
	}
}
