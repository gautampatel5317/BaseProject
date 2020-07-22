<?php
namespace App\Http\Controllers\Backend\Settings;
use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\Settings\ManageSettingsRequest;
use App\Http\Requests\Backend\Settings\UpdateSettingsRequest;
use App\Models\Settings\Setting;
use App\Repositories\Backend\Settings\SettingsRepository;
use Illuminate\Http\Request;

/**
 * Class SettingsController.
 */

class SettingsController extends Controller {
	protected $settings;
	/**
	 * @param \App\Repositories\Backend\Settings\SettingsRepository $settings
	 */
	public function __construct(SettingsRepository $settings) {
		$this->settings = $settings;
	}
	/**
	 * @param \App\Models\Settings\Setting                              $setting
	 * @param \App\Http\Requests\Backend\Settings\ManageSettingsRequest $request
	 *
	 * @return \App\Http\Responses\Backend\Setting\EditResponse
	 */
	public function edit(Setting $setting, ManageSettingsRequest $request) {
		return view('backend.settings.edit', compact('setting'));
	}
	/**
	 * @param \App\Models\Settings\Setting                              $setting
	 * @param \App\Http\Requests\Backend\Settings\UpdateSettingsRequest $request
	 *
	 * @return \App\Http\Responses\RedirectResponse
	 */
	public function update(Setting $setting, Request $request) {
        $this->settings->update($setting, $request->except(['_token', '_method']));
		flash(trans('alerts.setting_edit_message'))->success()->important();
		return redirect()->route('admin.settings.edit', $setting->id);
	}
}