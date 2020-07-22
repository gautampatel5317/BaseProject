<?php

namespace App\Http\Requests\Backend\Ingredient;

use App\Ingredient;
use Illuminate\Foundation\Http\FormRequest;

class StoreIngredientRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('ingredient_create');
	}

	public function rules() {
		return [
			'title' => 'required'
		];
	}
}
