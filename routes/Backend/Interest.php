<?php
/*
 * Interest Management
 */
Route::group(['namespace' => 'Interest'], function () {
    Route::resource('interest', 'InterestController');
    //For Datatables
    Route::post('interest/get', 'InterestTableController')->name('interest.get');
    Route::post('interest/changeStatus', 'InterestController@changeStatus'); //For update status
});
