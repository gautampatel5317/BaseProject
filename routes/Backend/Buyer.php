<?php
/*
 * Buyer Management
 */
Route::group(['namespace' => 'Buyer'], function () {
    Route::resource('buyer', 'BuyerController');
    //For Datatables
    Route::post('buyer/get', 'BuyerTableController')->name('buyer.get');
    Route::post('buyer/changeStatus', 'BuyerController@changeStatus');//For update status
});
