<?php
/*
 * Country Management
 */
Route::group(['namespace' => 'Country'], function () {
	Route::resource('country', 'CountryController');
	//For Datatables
    Route::post('country/get', 'CountryTableController')->name('country.get');
    Route::post('country/changeStatus', 'CountryController@changeStatus');//For update status
});
