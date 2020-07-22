<?php
/*
 * SubscriptionType Management
 */
Route::group(['namespace' => 'SubscriptionType'], function () {
	Route::resource('subscriptiontype', 'SubscriptionTypeController');
	//For Datatables
    Route::post('subscriptiontype/get', 'SubscriptionTypeTableController')->name('subscriptiontype.get');
    Route::post('subscriptiontype/changeStatus', 'SubscriptionTypeController@changeStatus');//For update status
});
