<?php

namespace App\Repositories\Backend\Settings;

use App\Models\Settings\Setting;
use App\Repositories\BaseRepository;
use File;

/**
 * Class SettingsRepository.
 */

class SettingsRepository extends BaseRepository
{
    /**
     * Associated Repository Model.
     */
    const MODEL = Setting::class;
    protected $models;
    protected $settingsPath;
    /**
     * Constructor.
     */
    public function __construct(Setting $models)
    {
        $this->models = $models;
        $this->settingsPath = storage_path('images/settings');
    }
    /**
     * @param \App\Models\Settings\Setting $setting
     * @param array                        $input
     *
     * @throws \App\Exceptions\GeneralException
     *
     * @return bool
     */
    public function update(Setting $setting, array $input)
    {
        if (!empty($input['logo'])) {
            if (!empty($input['existing_logo'])) {
                $this->removeLogo($this->settingsPath, $input['existing_logo']);
            }
            $input['logo'] = $this->uploadLogo($input['logo'], 'site_logo');
        }
        if (!empty($input['favicon'])) {
            if (!empty($input['existing_favicon'])) {
                $this->removeLogo($this->settingsPath, $input['existing_favicon']);
            }
            $input['favicon'] = $this->uploadLogo($input['favicon'], 'favicon');
        }
        if ($setting->update($input)) {
            return true;
        }
    }

    /*
	 * Upload image
	 */
    public function uploadLogo($input, $type = "site_logo")
    {
        $path = $this->settingsPath;
        if (!File::isDirectory($path)) {
            File::makeDirectory($path, 0777, true, true);
        }
        $fileExtension = $input->getClientOriginalExtension();

        $image_name = $type . "_" . time() . "." . $fileExtension;
        $input->move($path, $image_name);
        return $image_name;
    }

    /**
     * Remove image
     */
    public function removeLogo($path, $fileName)
    {
        File::delete($path . '/' . $fileName);
    }
}
