<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;

/**
 * Class FrontendController.
 */

class FrontendController extends Controller {
	/**
	 * @return \Illuminate\View\View
	 */
	public function index() {
		return view('frontend.layouts.app');
	}
	/**
	 * Registration
	 */
	public function registeration() {
		return view('register');

	}
}