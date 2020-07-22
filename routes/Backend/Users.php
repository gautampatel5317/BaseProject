<?php
/*
 * Users Management
 */
Route::group(['namespace' => 'User'], function () {
		Route::resource('users', 'UsersController');
		Route::any('users/{user}/delete', 'UsersController@deleteUser')->name('users.delete');
		Route::delete('users/destroy', 'UsersController@massDestroy')->name('users.massDestroy');
		Route::any('users/status', 'UsersController@changeStatus')->name('users.status');
		// For Datatables
		Route::post('users/get', 'UserTableController')->name('users.get');

		Route::get('profile', 'UserPasswordController@edit')->name('users.profile');
		Route::post('changeProfile', 'UserPasswordController@update')->name('users.changeProfile');
	});