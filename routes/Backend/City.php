<?php
/*
 * City Management
 */
Route::group(['namespace' => 'City'], function () {
	Route::resource('city', 'CityController');
	//For Datatables
    Route::post('city/get', 'CityTableController')->name('city.get');
    Route::post('city/changeStatus', 'CityController@changeStatus');//For update status
    Route::post('city/getstates', 'CityController@getStates');//For get states
});
