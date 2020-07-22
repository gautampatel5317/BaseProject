<?php

namespace App\Http\Requests\Backend\Ingredient;

use Gate;
use Illuminate\Foundation\Http\FormRequest;

class CreateIngredientRequest extends FormRequest {
	public function authorize() {
		return \Gate::allows('ingredient_create');
	}

	public function rules() {
		return [

		];
	}
}
