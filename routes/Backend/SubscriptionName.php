<?php
/*
 * SubscriptionName Management
 */
Route::group(['namespace' => 'SubscriptionName'], function () {
    Route::resource('subscriptionname', 'SubscriptionNameController');
    Route::any('subscriptionname/{subscriptionname}/delete', 'SubscriptionNameController@deleteSubscriptionName')->name('subscriptionname.delete');
    Route::delete('subscriptionname/destroy', 'SubscriptionNameController@massDestroy')->name('subscriptionname.massDestroy');
    Route::any('subscriptionname/status', 'SubscriptionNameController@changeStatus')->name('subscriptionname.status');
	//For Datatables
    Route::post('subscriptionname/get', 'SubscriptionNameTableController')->name('subscriptionname.get');
});
