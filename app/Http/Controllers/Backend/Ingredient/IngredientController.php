<?php

namespace App\Http\Controllers\Backend\Ingredient;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\Ingredient\CreateIngredientRequest;
use App\Http\Requests\Backend\Ingredient\StoreIngredientRequest;
use App\Http\Requests\Backend\Ingredient\UpdateIngredientRequest;
use App\Models\Ingredient\Ingredient;
use App\Repositories\Backend\Ingredient\IngredientRepository;
use Illuminate\Http\Request;

class IngredientController extends Controller {
	protected $model;
	public function __construct(IngredientRepository $model) {
		$this->model = $model;
	}
	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index() {
		abort_unless(\Gate::allows('ingredient_access'), 403);
		return view('backend.ingredient.index');
	}
	/**
	 * Show the form for creating a new resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create(CreateIngredientRequest $request) {
		abort_unless(\Gate::allows('ingredient_create'), 403);
		return view('backend.ingredient.create');
	}
	/**
	 * Store a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(StoreIngredientRequest $request) {
		abort_unless(\Gate::allows('ingredient_create'), 403);
		$input = $request->except('_token');
		$this->model->create($input);
		flash(trans('alerts.ingredient_add_message'))->success()->important();
		return redirect()->route('admin.ingredient.index');
	}
	public function show(Ingredient $ingredient) {
		abort_unless(\Gate::allows('ingredient_show'), 403);
		return view('backend.ingredient.show', compact('ingredient'));
	}
	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit(Ingredient $ingredient) {
		abort_unless(\Gate::allows('ingredient_edit'), 403);
		return view('backend.ingredient.edit', compact('ingredient'));
	}
	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(UpdateIngredientRequest $request, Ingredient $ingredient) {
		abort_unless(\Gate::allows('ingredient_edit'), 403);
		$input = $request->except('_token');
        $this->model->update($input, $ingredient);
        flash(trans('alerts.ingredient_edit_message'))->success()->important();
		return redirect()->route('admin.ingredient.index');
	}
	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy(Ingredient $ingredient) {
		abort_unless(\Gate::allows('ingredient_delete'), 403);
		$this->model->destroy($ingredient);
		return "success";
	}
	public function changeStatus(Request $request) {
		$input  = $request->except('_token');
		$result = $this->model->changeStatus($input['id'], $input['status']);
		if ($result == 1) {
			return "success";
		} else {
			return "failed";
		}
	}
}
