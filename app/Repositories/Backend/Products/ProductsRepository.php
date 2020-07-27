<?php

namespace App\Repositories\Backend\Products;

use App\Repositories\BaseRepository;
use App\Models\Products\Products;

class ProductsRepository extends BaseRepository
{

    protected $model;

    public function __construct(Products $model)
    {
        $this->model = $model;
    }
    /**
     * Associated Repository Model.
     */
    const MODEL = Products::class;

    /**
     * @return mixed
     */
    public function getForDataTable()
    {
        return $this->model
        ->select(config('tables.products_table').'.*', config('tables.category_table').'.name AS category_name', config('tables.users_table').'.first_name AS seller_name', \DB::raw('(SELECT products_image.image FROM products_image WHERE products_image.product_id = products.id ORDER BY products_image.id DESC LIMIT 1) AS image'))
        ->join(config('tables.category_table'), config('tables.category_table').'.id', '=', config('tables.products_table').'.category_id')
        ->join(config('tables.users_table'), config('tables.users_table').'.id', '=', config('tables.products_table').'.seller_id')
        ->orderByDesc('id')->get();
    }
    /**
     *
     * {@inheritDoc}
     *
     * @see \App\Repositories\Products\ProductsRepositoryInterface::create()
     */
    public function create(array $input)
    {
        $input['created_by'] = auth()->user()->id;
        return Products::create($input);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(array $input, $id)
    {
        $record = $this->model->find($id);
        $input['updated_by'] = auth()->user()->id;
        return $record->update($input);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        return $this->model->where('id', $id)->delete();
    }
    /**
     * For change Products status
     */
    public function changeStatus($id, $status)
    {
        return $this->model->where('id', $id)
            ->update(['status' => $status, 'updated_by' => auth()->user()->id]);
    }

    public function showProduct($id){
        return $this->model
        ->select('products.*', 'category.name AS category_name', 'users.first_name AS seller_name')
        ->join('category', 'category.id', '=', 'products.category_id')
        ->join('users', 'users.id', '=', 'products.seller_id')
        ->find($id);
    }
}
