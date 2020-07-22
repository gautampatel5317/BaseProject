<?php

namespace App\Http\Requests\Backend\Ingredient;

use App\Models\Ingredient\Ingredient;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;

class UpdateIngredientRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('ingredient_edit');
	}

	public function rules(Request $request) {
		return [
			'title' => 'required'
		];
	}
}
