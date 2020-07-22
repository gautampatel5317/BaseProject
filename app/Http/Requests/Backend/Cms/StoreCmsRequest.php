<?php

namespace App\Http\Requests\Backend\Cms;

use Illuminate\Auth\Access\Gate;
use Illuminate\Foundation\Http\FormRequest;

class StoreCmsRequest extends FormRequest{
    public function authorize(){
        return \Gate::allows('cms_create');
    }
    public function rules() {
		return [
			'title' => 'required',
            'description' => 'required',
		];
	}
}