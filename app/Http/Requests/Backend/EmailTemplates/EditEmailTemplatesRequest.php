<?php

namespace App\Http\Requests\Backend\EmailTemplates;
use Illuminate\Foundation\Http\FormRequest;

/**
 * Class EditEmailTemplatesRequest.
 */

class EditEmailTemplatesRequest extends FormRequest {
	/**
	 * Determine if the user is authorized to make this request.
	 *
	 * @return bool
	 */
	public function authorize() {
		return true;
		return abort_if(Gate::denies('edit-email-template'), 403, '403 Forbidden')??true;
	}

	/**
	 * Get the validation rules that apply to the request.
	 *
	 * @return array
	 */
	public function rules() {
		return [
			//
		];
	}
}
