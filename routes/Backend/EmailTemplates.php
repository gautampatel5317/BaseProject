<?php

/*
 * Email Templates Management
 */
Route::group(['namespace'                                                 => 'EmailTemplates'], function () {
		Route::resource('emailtemplates', 'EmailTemplatesController', ['except' => ['show', 'create', 'save']]);
		Route::any('emailtemplates/{emailtemplate}/delete', 'EmailTemplatesController@delete')->name('emailtemplates.delete');
		Route::any('emailtemplates/change/status', 'EmailTemplatesController@changeStatus')->name('emailtemplates.changestatus');
		//For DataTables
		Route::post('emailtemplates/get', 'EmailTemplatesTableController')
			->name('emailtemplates.get');
	});
