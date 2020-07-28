<?php

namespace App\Repositories\Backend\Seller;

use App\Repositories\BaseRepository;
use App\Models\SellerDetail\SellerDetail;

class SellerRepository extends BaseRepository
{

    protected $model;

    public function __construct(SellerDetail $model)
    {
        $this->model = $model;
    }
    /**
     * Associated Repository Model.
     */
    const MODEL = SellerDetail::class;

    /**
     * @return mixed
     */
    public function getForDataTable()
    {
        return $this->model
        ->select(config('tables.seller_detail_table').'.*', config('tables.users_table').'.first_name', config('tables.users_table').'.last_name', config('tables.users_table').'.email', config('tables.users_table').'.status' )
        ->join(config('tables.users_table'), config('tables.users_table').'.id', '=', config('tables.seller_detail_table').'.user_id')
        ->orderByDesc('id')->get();
    }

    public function getSellerDetails($id){
        return $this->model
        ->select(config('tables.seller_detail_table').'.*', config('tables.users_table').'.first_name', config('tables.users_table').'.last_name', config('tables.users_table').'.email', config('tables.users_table').'.status' )
        ->join(config('tables.users_table'), config('tables.users_table').'.id', '=', config('tables.seller_detail_table').'.user_id')
        ->find($id);
    }
    /**
     *
     * {@inheritDoc}
     *
     * @see \App\Repositories\Seller\SellerRepositoryInterface::create()
     */
    public function create(array $input)
    {
        return SellerDetail::create($input);
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
     * For change Seller status
     */
    public function changeStatus($id, $status)
    {
        return $this->model->where('id', $id)
            ->update(['status' => $status, 'updated_by' => auth()->user()->id]);
    }

}
