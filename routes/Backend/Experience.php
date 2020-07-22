<?php
/*
 * Experience Management
 */
Route::group(['namespace' => 'Experience'], function () {
    Route::resource('experience', 'ExperienceController');
    //For Datatables
    Route::post('experience/get', 'ExperienceTableController')->name('experience.get');
    Route::post('experience/changeStatus', 'ExperienceController@changeStatus'); //For update status
});
