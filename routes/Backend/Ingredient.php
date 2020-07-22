<?php
/*
 * Ingredient Management
 */
Route::group(['namespace' => 'Ingredient'], function () {
		Route::resource('ingredient', 'IngredientController');
		Route::post('ingredient/changeStatus', 'IngredientController@changeStatus');
		//For Datatables
		Route::post('ingredient/get', 'IngredientTableController')->name('ingredient.get');
	});