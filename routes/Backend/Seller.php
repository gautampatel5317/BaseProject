<?php
/*
 * Seller Management
 */
Route::group(['namespace' => 'Seller'], function () {
	Route::resource('seller', 'SellerController');
	//For Datatables
    Route::post('seller/get', 'SellerTableController')->name('seller.get');
    Route::post('seller/changeStatus', 'SellerController@changeStatus');//For update status
});
