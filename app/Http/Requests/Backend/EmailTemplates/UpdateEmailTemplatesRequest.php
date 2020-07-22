<?php

namespace App\Http\Requests\Backend\EmailTemplates;
use Illuminate\Foundation\Http\FormRequest;

/**
 * Class UpdateEmailTemplatesRequest.
 */

class UpdateEmailTemplatesRequest extends FormRequest {
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
			'title'   => 'required|max:191',
			'type_id' => 'required',
			'subject' => 'required|max:191',
			'body'    => 'required',
		];
	}
}
