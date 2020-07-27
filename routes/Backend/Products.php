<?php
/*
 * Products Management
 */
Route::group(['namespace' => 'Products'], function () {
	Route::resource('products', 'ProductsController');
	//For Datatables
    Route::post('products/get', 'ProductsTableController')->name('products.get');
    Route::post('products/changeStatus', 'ProductsController@changeStatus');//For update status
    Route::post('products/deleteImage', 'ProductsController@deleteImage');
});
