<?php
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
 */
Route::group(['namespace' => 'Api\V1', 'prefix' => 'v1', 'as' => 'v1.'], function () {
		Route::group(['prefix'  => 'auth', 'middleware'  => ['guest']], function () {
				Route::post('register', 'AuthController@register');
				Route::post('login', 'AuthController@authenticate');
				// Password Reset
				Route::post('password/email', 'ForgotPasswordController@sendResetLinkEmail');
			});
		Route::group(['middleware' => ['jwt.verify']], function () {
				Route::get('user', 'AuthController@getAuthenticatedUser');
				Route::any('logout', 'AuthController@logout');
				// Users
				Route::resource('users', 'UsersApiController', ['except' => ['create', 'edit']]);
				//Roles
				Route::apiResource('roles', 'RolesApiController');
				//Permission
				Route::apiResource('permissions', 'PermissionsApiController');
			});
	});

// Route::group(['prefix' => 'v1', 'as' => 'admin.', 'namespace' => 'Api\V1\Admin'], function () {
// 		Route::apiResource('permissions', 'PermissionsApiController');
// 		Route::apiResource('roles', 'RolesApiController');
// 		Route::apiResource('users', 'UsersApiController');
// 		Route::apiResource('products', 'ProductsApiController');
// 		Route::apiResource('customers', 'CustomersApiController');
// 		Route::apiResource('cms', 'CmsApiController');
// 	});
