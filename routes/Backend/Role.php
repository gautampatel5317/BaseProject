<?php
/*
 * Role Management
 */
Route::group(['namespace' => 'Role'], function () {
		Route::resource('roles', 'RolesController');
		Route::any('roles/{role}/delete', 'RolesController@roleDelete')->name('roles.delete');
		Route::delete('roles/destroy', 'RolesController@massDestroy')->name('roles.massDestroy');
		// For Datatables
		Route::post('roles/get', 'RoleTableController')->name('roles.get');
	});