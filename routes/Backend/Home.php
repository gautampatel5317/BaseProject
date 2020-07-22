<?php
/*
 * Home Management
 */
Route::group(['namespace' => 'Home'], function () {
		Route::get('/', 'HomeController@index')->name('home');
		Route::any('/video', 'HomeController@video')->name('video');
		Route::any('/calander', 'HomeController@Calander')->name('calander');
		Route::any('/barcode', 'HomeController@barCode')->name('barcode');
	});