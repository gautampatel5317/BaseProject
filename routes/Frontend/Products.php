<?php
/*
 * Product Management
 */
Route::group(['namespace' => 'Products'], function () {
		Route::any('products', 'ProductsController@index')->name('products');
		Route::any('products/create', 'ProductsController@create')->name('products.create');
		Route::any('products/store', 'ProductsController@store')->name('products.store');
		Route::any('products/{products}/show', 'ProductsController@show')->name('products.show');
		Route::any('products/{products}/edit', 'ProductsController@edit')->name('products.edit');
		Route::any('products/destroy', 'ProductsController@destroy')->name('products.destroy');
		Route::any('products/{products}/update', 'ProductsController@update')->name('products.update');
		Route::any('products/status/change', 'ProductsController@statusChange')->name('products.status.change');
		//For Datatables
		Route::post('products/get', 'ProductsTableController')->name('products.get');
	});
