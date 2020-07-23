<?php
/*
 * Category Management
 */
Route::group(['namespace' => 'Category'], function () {
    Route::resource('category', 'CategoryController');
    //For Datatables
    Route::post('category/get', 'CategoryTableController')->name('category.get');
    Route::post('category/changeStatus', 'CategoryController@changeStatus');//For update status
});
