<?php

/*
 * Settings Management
 */
Route::group(['namespace' => 'Settings'], function () {
		// Route::resource('settings', 'SettingsController', ['except' => ['show', 'create', 'save', 'index', 'destroy']]);
		Route::any('settings/{setting}/edit', 'SettingsController@edit')->name('settings.edit');
		Route::any('settings/{setting}/update', 'SettingsController@update')->name('settings.update');

	});
