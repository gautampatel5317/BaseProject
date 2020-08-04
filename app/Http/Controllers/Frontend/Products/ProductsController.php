<?php

namespace App\Http\Controllers\Frontend\Products;

use App\Http\Controllers\Controller;
use App\Models\Category\Category;
use App\Models\ProductImage\ProductImage;
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
		if (auth()->user()->roles->first()->id == 3) {
			$getProducts = $this->repository->getProducts();
			return view('frontend.products.buyerproduct', compact('getProducts'));
		}
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
	public function show(Products $products) {
		$productImage = ProductImage::where('product_id', $products->id)->get()->toArray();
		$productImg   = [];
		foreach ($productImage as $key => $value) {
			$path         = config('path.upload.product').$products->id.'/'.$value['image'];
			$productImg[] = $path;
		}
		return view('frontend.products.view', compact('products', 'productImg'));
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit(Products $products, Request $request) {
		$productImage = ProductImage::where('product_id', $products->id)->get()->toArray();
		$productImg   = [];
		foreach ($productImage as $key => $value) {
			$path         = config('path.upload.product').$products->id.'/'.$value['image'];
			$productImg[] = $path;
		}
		$categoryData = Category::where('status', '1')
			->orderByDesc('id')
			->get();
		return view('frontend.products.edit', compact('categoryData', 'products', 'productImg'));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Products $products, Request $request) {
		$input  = $request->except('_method', '_token');
		$update = $this->repository->update($input, $products);
		flash(trans('alerts.products_update_message'))->success()->important();
		return redirect()->route('products');
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function destroy(Request $request) {
		$input  = $request->except('_token', '_method');
		$delete = $this->repository->delete($input);
		return response()->json("success");
	}
	/**
	 * Product Status Change
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function statusChange(Request $request) {
		$input        = $request->except('_token');
		$statusChange = $this->repository->statusChange($input);
		return response()->json("success");
	}
}
