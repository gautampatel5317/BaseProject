<?php

namespace App\Repositories\Backend\Category;

use App\Models\City\City;
use App\Repositories\BaseRepository;
use App\Models\Category\Category;

class CategoryRepository extends BaseRepository
{

    protected $model;

    public function __construct(Category $model)
    {
        $this->model = $model;
    }
    /**
     * Associated Repository Model.
     */
    const MODEL = Category::class;

    /**
     * @return mixed
     */
    public function getForDataTable()
    {
        return $this->model->orderByDesc('id')->get();
    }
    /**
     *
     * {@inheritDoc}
     *
     * @see \App\Repositories\Category\CategoryRepositoryInterface::create()
     */
    public function create(array $input)
    {
        $input['created_by'] = auth()->user()->id;
        return Category::create($input);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(array $input, $category)
    {
        $input['updated_by'] = auth()->user()->id;
        return $category->update($input);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($category)
    {
        $record = $this->model->find($category->id);
        return $record->delete();
    }
    /**
     * For change Category status
     */
    public function changeStatus($id, $status)
    {
        return $this->model->where('id', $id)
            ->update(['status' => $status, 'updated_by' => auth()->user()->id]);
    }

    /**
     * Get category list
     */
    public function getCategorys()
    {
        $data = $this->model
            ->where('status', '1')
            ->orderByDesc('id')
            ->get();
        return $data;
    }
}
