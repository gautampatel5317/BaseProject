<?php

namespace App\Http\Controllers\Api\V1;
use App\Http\Controllers\Api\V1\APIController;
use App\Models\User\User;
use Carbon\Carbon as Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;

class AuthController extends APIController {
	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function authenticate(Request $request) {
		$credentials = $request->only('email', 'password');
		try {
			if (!$token = JWTAuth::attempt($credentials)) {
				return response()->json(['error' => 'invalid_credentials'], 400);
			}
		} catch (JWTException $e) {
			return response()->json(['error' => 'could_not_create_token'], 500);
		}
		$response = ['Message' => 'The user Successfully Login!', 'token' => $token];
		return response()->json(compact('response'));
	}
	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function register(Request $request) {
		$validator = Validator::make($request->all(), [
				'name'     => 'required|string|max:255',
				'email'    => 'required|string|email|max:255|unique:users',
				'password' => 'required|string|min:6|confirmed',
			]);
		if ($validator    ->fails()) {
			return response()->json($validator->errors()->toJson(), 400);
		}
		$user = User::create([
				'name'       => $request->get('name'),
				'email'      => $request->get('email'),
				'password'   => Hash::make($request->get('password')),
				'status'     => '1',
				'created_at' => Carbon::now()
			]);

		return $this->respond([
				'message' => trans('api.messages.login.success'),
				'token'   => $token,
			]);
	}
	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function getAuthenticatedUser() {
		try {
			if (!$user = JWTAuth::parseToken()->authenticate()) {
				return response()                ->json(['user_not_found'], 404);
			}
		} catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
			return response()->json(['token_expired'], $e->getStatusCode());
		} catch (Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
			return response()->json(['token_invalid'], $e->getStatusCode());
		} catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
			return response()->json(['token_absent'], $e->getStatusCode());
		}
		return response()->json(compact('user'));
	}
	/**
	 * Log the user out (Invalidate the token).
	 *
	 * @return \Illuminate\Http\JsonResponse
	 */
	public function logout(Request $request) {
		$token = $request->header('Authorization');
		try {
			JWTAuth::parseToken()->invalidate($token);
			return response()->json([
					'error'   => false,
					'message' => trans('api.messages.logout')
				]);
		} catch (TokenExpiredException $exception) {
			return response()->json([
					'error'   => true,
					'message' => trans('api.messages.token.token_expire')

				], 401);
		} catch (TokenInvalidException $exception) {
			return response()->json([
					'error'   => true,
					'message' => trans('api.messages.token.token_invalid')
				], 401);

		} catch (JWTException $exception) {
			return response()->json([
					'error'   => true,
					'message' => trans('api.messages.token.token_missing')
				], 500);
		}
	}

}
