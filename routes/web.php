<?php
Route::redirect('/', '/login');
Route::redirect('/home', '/admin');
Auth::routes(['register' => false]);
/*
 * Customer Management
 */
Route::group(['namespace' => 'Frontend'], function () {
		Route::any('customer/confirm/{customer}', 'Customer\CustomerController@confirmCustomer')->name('customer.confirm');
		Route::resource('customer', 'Customer\CustomerController');
	});
/*
 * Frontend Routes
 * Namespaces indicate folder structure
 */
Route::group(['namespace' => 'Frontend', 'middleware' => ['user']], function () {
		Route::any('/home', 'FrontendController@index')->name('home');
		includeRouteFiles(__DIR__ .'/Frontend/');
	});
/* ----------------------------------------------------------------------- */

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
 */
/*
 * Backend Routes
 * Namespaces indicate folder structure
 */
Route::group(['namespace' => 'Backend', 'prefix' => 'admin', 'as' => 'admin.', 'middleware' => ['auth']], function () {
		/*
		 * These routes need view-backend permission
		 * (good if you want to allow more than one group in the backend,
		 * then limit the backend features by different roles or permissions)
		 *
		 * Note: Administrator has all permissions so you do not have to specify the administrator role everywhere.
		 */
		includeRouteFiles(__DIR__ .'/Backend/');
	});
