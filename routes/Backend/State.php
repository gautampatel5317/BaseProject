<?php
/*
 * State Management
 */
Route::group(['namespace' => 'State'], function () {
	Route::resource('state', 'StateController');
	//For Datatables
    Route::post('state/get', 'StateTableController')->name('state.get');
    Route::post('state/changeStatus', 'StateController@changeStatus');//For update status
});
