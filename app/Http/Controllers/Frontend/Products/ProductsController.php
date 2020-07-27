<?php

namespace App\Http\Controllers\Frontend\Products;

use App\Http\Controllers\Controller;
use App\Models\Category\Category;
use App\Models\Products\Products;
use App\Repositories\Frontend\Products\ProductsRepository;
use Illuminate\Http\Request;

class ProductsController extends Controller {
	/**
	 * @var $repository
	 */
	protected $repository;
	public function __construct(ProductsRepository $repository) {
		$this->repository = $repository;
	}
	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index() {
		return view('frontend.products.index');
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create() {
		$categoryData = Category::where('status', '1')
			->orderByDesc('id')
			->get();
		return view('frontend.products.create', compact('categoryData'));
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request) {
		$input = $request->except('_token');
		$store = $this->repository->create($input);
		if ($store) {
			flash(trans('alerts.products_add_message'))->success()->important();

		}
		return redirect()->route('products');
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id) {
		//
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit(Products $products, Request $request) {
		$categoryData = Category::where('status', '1')
			->orderByDesc('id')
			->get();
		return view('frontend.products.edit', compact('categoryData', 'products'));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id) {
		//
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id) {
		//
	}
}
