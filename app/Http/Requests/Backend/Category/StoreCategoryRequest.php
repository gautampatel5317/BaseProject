<?php

namespace App\Http\Requests\Backend\Category;

use App\Category;
use Illuminate\Foundation\Http\FormRequest;

class StoreCategoryRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('category_create');
	}

	public function rules() {
		return [
			'name' => 'required',
		];
	}
}
