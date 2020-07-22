<?php
/*
 * Customer Management
 */
Route::group(['namespace' => 'Customer'], function () {
		Route::resource('customers', 'CustomersController');
		Route::POST('customers/massdestroy', 'CustomersController@massDestroy')->name('customers.massDestroy');
		//For Datatables
		Route::post('customers/get', 'CustomerTableController')->name('customers.get');
	});