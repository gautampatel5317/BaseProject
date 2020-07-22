<?php

namespace App\Http\Requests\Backend\EmailTemplates;
use Illuminate\Foundation\Http\FormRequest;
/**
 * Class DeleteEmailTemplatesRequest.
 */

class DeleteEmailTemplatesRequest extends FormRequest {
	/**
	 * Determine if the user is authorized to make this request.
	 *
	 * @return bool
	 */
	public function authorize() {
		return true;
		return abort_if(Gate::denies('delete-email-template'), 403, '403 Forbidden')??true;
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
