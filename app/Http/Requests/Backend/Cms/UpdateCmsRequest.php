<?php

namespace App\Http\Requests\Backend\Cms;

use App\Models\Cms\Cms;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;

class UpdateCmsRequest extends FormRequest{
    public function authorize() {
		return \Gate::allows('cms_edit');
	}

	public function rules(Request $request) {
		return [
			'title' => 'required',
            'description' => 'required',
		];
    }
}