<?php

namespace App\Http\Controllers\Backend\Category;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\Category\CreateCategoryRequest;
use App\Http\Requests\Backend\Category\StoreCategoryRequest;
use App\Http\Requests\Backend\Category\UpdateCategoryRequest;
use App\Models\Category\Category;
use App\Repositories\Backend\Country\CountryRepository;
use App\Repositories\Backend\Category\CategoryRepository;
use Illuminate\Http\Request;

class CategoryController extends Controller
{

    protected $model;
    public function __construct(CategoryRepository $model)
    {
        $this->model = $model;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        abort_unless(\Gate::allows('category_access'), 403);
        return view('backend.category.index');
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(CreateCategoryRequest $request, CountryRepository $country)
    {
        $countryData = $country->getCountry();
        abort_unless(\Gate::allows('category_create'), 403);
        return view('backend.category.create', compact('countryData'));
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreCategoryRequest $request)
    {
        abort_unless(\Gate::allows('category_create'), 403);
        $input = $request->except('_token');
        $this->model->create($input);
        flash(trans('alerts.category_add_message'))->success()->important();
        return redirect()->route('admin.category.index');
    }
    public function show(Category $category)
    {
        abort_unless(\Gate::allows('category_show'), 403);
        return view('backend.category.show', compact('category'));
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Category $category, CountryRepository $country)
    {
        $countryData = $country->getCountry();
        abort_unless(\Gate::allows('category_edit'), 403);
        return view('backend.category.edit', compact('category', 'countryData'));
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateCategoryRequest $request, Category $category)
    {
        abort_unless(\Gate::allows('category_edit'), 403);
        $input   = $request->except('_token');
        $this->model->update($input, $category);
        flash(trans('alerts.category_edit_message'))->success()->important();
        return redirect()->route('admin.category.index');
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Category $category)
    {
        abort_unless(\Gate::allows('category_delete'), 403);
        $this->model->destroy($category);
        return "success";
    }
    
    public function changeStatus(Request $request)
    {
        $input = $request->except('_token');
        $flag = $this->model->changeStatus($input['id'], $input['status']);
        if ($flag == 1) {
            return "success";
        } else {
            return "failed";
        }
    }
}
