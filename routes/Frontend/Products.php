<?php
/*
 * Product Management
 */
Route::group(['namespace' => 'Products'], function () {
		// Route::resource('products', 'ProductsController');
		Route::any('products', 'ProductsController@index')->name('products');
		Route::any('products/create', 'ProductsController@create')->name('products.create');
		Route::any('products/store', 'ProductsController@store')->name('products.store');
		Route::any('products/{product}/edit', 'ProductsController@edit')->name('products.edit');
		Route::any('products/show', 'ProductsController@show')->name('products.show');
		Route::any('products/destroy', 'ProductsController@show')->name('products.destroy');
		Route::any('products/{product}/update', 'ProductsController@update')->name('products.update');
		//For Datatables
		Route::post('products/get', 'ProductsTableController')->name('products.get');
	});
