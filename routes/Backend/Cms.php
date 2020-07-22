<?php
/**
 * CMS Manangement
 */
Route::group(['namespace' => 'Cms'], function () {
    Route::resource('cms', 'CmsController');
    // For Datatables
    Route::post('cms/get', 'CmsTableController')->name('cms.get');
});