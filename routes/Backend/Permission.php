<?php
/*
 * Permission Management
 */
Route::group(['namespace' => 'Permission'], function () {
		Route::resource('permissions', 'PermissionsController');
		Route::delete('permissions/destroy', 'PermissionsController@massDestroy')->name('permissions.massDestroy');
		// For Datatables
		Route::post('permissions/get', 'PermissionTableController')->name('permissions.get');
	});