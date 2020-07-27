<?php
/*
 * Product Management
 */
Route::group(['namespace' => 'Products'], function () {
		// Route::resource('products', 'ProductsController');
		Route::any('products', 'ProductsController@index')->name('products');
		//For Datatables
		// Route::post('products/get', 'ProductsTableController')->name('products.get');
	});
