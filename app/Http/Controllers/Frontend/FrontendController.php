<?php

namespace App\Http\Controllers\Frontend;
use App\Http\Controllers\Controller;
use App\Models\SellerDetail\SellerDetail;
use App\Models\User\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

/**
 * Class FrontendController.
 */

class FrontendController extends Controller {
	/**
	 * @return \Illuminate\View\View
	 */
	public function index(Request $request) {
		return view('frontend.layouts.app');
	}
	/**
	 * Registration
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function registeration(Request $request) {
		return view('register');
	}
	/**
	 * register
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function register(Request $request) {
		$input = $request->except('_token');
		if ($input['type'] == 0) {
			$validator = Validator::make($input, [
					'email'        => 'required|email|unique:users',
					'password'     => 'required|min:6',
					'first_name'   => 'required',
					'last_name'    => 'required',
					'shop_name'    => 'required',
					'shop_url'     => 'required',
					'phone_number' => 'required|numeric'
				]);
		} else {
			$validator = Validator::make($input, [
					'email'      => 'required|email|unique:users',
					'password'   => 'required|min:6',
					'first_name' => 'required',
					'last_name'  => 'required'
				]);
		}
		if ($validator->fails()) {
			return redirect()
			->back()
			->withErrors($validator)
			->withInput();
		}
		$user             = new User();
		$user->first_name = $input['first_name'];
		$user->last_name  = $input['last_name'];
		$user->email      = $input['email'];
		$user->password   = \Hash::make($input['password']);
		$user->status     = 1;
		if ($user->save()) {
			if ($input['type'] == 0) {
				$user->roles()->sync([2]);
				//seller details
				$seller               = new SellerDetail();
				$seller->user_id      = $user->id;
				$seller->shop_name    = $input['shop_name'];
				$seller->shop_url     = $input['shop_url'];
				$seller->phone_number = $input['phone_number'];
				$seller->save();
			} else {
				$user->roles()->sync([3]);
			}
		}
		flash('The User has been register successfully!')->success()->important();
		return redirect()->route('login');
	}
}