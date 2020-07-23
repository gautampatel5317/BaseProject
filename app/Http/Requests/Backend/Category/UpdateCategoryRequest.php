<?php

namespace App\Http\Requests\Backend\Category;

use App\Models\Category\Category;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;

class UpdateCategoryRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('category_edit');
	}

	public function rules() {
		return [
			'name' => 'required',
		];
	}
}
