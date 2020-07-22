<?php
use App\Exceptions\GeneralException;
use App\Http\Utilities\SendEmail;
use App\Models\Settings\Setting;

/*
 * Global helpers file with misc functions.
 */
if (!function_exists('app_name')) {
	/**
	 * Helper to grab the application name.
	 *
	 * @return mixed
	 */

function app_name() {
		return config('app.name');
	}
}
if (!function_exists('includeRouteFiles')) {
	/**
	 * Loops through a folder and requires all PHP files
	 * Searches sub-directories as well.
	 *
	 * @param $folder
	 */
	function includeRouteFiles($folder) {
		$directory      = $folder;
		$handle         = opendir($directory);
		$directory_list = [$directory];
		while (false !== ($filename = readdir($handle))) {
			if ($filename != '.'
				 && $filename != '..'
				 && is_dir($directory.$filename)) {
				array_push($directory_list, $directory.$filename.'/');
			}
		}
		foreach ($directory_list as $directory) {
			foreach (glob($directory.'*.php') as $filename) {
				require $filename;
			}
		}
	}
	// Creating Notification
	if (!function_exists('createNotification')) {
		/**
		 * create new notification.
		 *
		 * @param  $message    message you want to show in notification
		 * @param  $userId     To Whom You Want To send Notification
		 * @param  $type       type of notification (1 - dashboard, 2 - email, 3 - both) (by default 1)
		 * @param  $option     associate array [ 'data' => $data, 'email_template_type' => $template_type ]
		 *
		 * @return object
		 */
		function createNotification($message, $userId, $options = []) {
			if (!empty($options['data']) && !empty($options['email_template_type'])) {
				$mail        = new SendEmail();
				$emailResult = $mail->sendWithTemplate($options['data'], $options['email_template_type']);
			} else {
				throw new GeneralException('Invalid input given.option array shold contains data and email_template_type');
			}
		}
    }
    /**
     * Get setting data
     */
    function getSettings(){
        $settingData = Setting::all();
        $settingData = $settingData[0];
        if(!empty($settingData['logo'])){
            $settingData['logo'] = Storage::disk('public')->url('images/settings/' . $settingData['logo']);
        }
        if(!empty($settingData['favicon'])){
            $settingData['favicon'] = Storage::disk('public')->url('images/settings/' . $settingData['favicon']);
        }
        return $settingData;
    }

}