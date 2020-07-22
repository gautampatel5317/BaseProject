<?php

namespace App\Http\Requests\Backend\Settings;

use Illuminate\Http\Request;

/**
 * Class UpdateSettingsRequest.
 */

class UpdateSettingsRequest extends Request {
	/**
	 * Determine if the user is authorized to make this request.
	 *
	 * @return bool
	 */
	public function authorize() {
		return \Gate::allows('edit-settings');
	}

	/**
	 * Get the validation rules that apply to the request.
	 *
	 * @return array
	 */
	public function rules() {
		return [
			'logo'    => 'image|dimensions:min_width=226,min_height=48',
			'favicon' => 'mimes:jpg,jpeg,png,ico|dimensions:width=16,height=16',
		];
	}

	/**
	 * Get the validation rules that apply to the request.
	 *
	 * @return array
	 */
	public function messages() {
		return [
			'logo.dimensions'    => 'Invalid logo - should be minimum 226*48',
			'favicon.dimensions' => 'Invalid favicon - should be 16*16',
		];
	}
}
