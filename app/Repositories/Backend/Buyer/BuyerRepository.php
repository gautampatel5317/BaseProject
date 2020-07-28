<?php

namespace App\Repositories\Backend\Buyer;

use App\Models\Buyer\Buyer;
use App\Repositories\BaseRepository;
use App\Models\BuyerDetail\BuyerDetail;
use App\Models\User\User;

class BuyerRepository extends BaseRepository
{

    protected $model;

    public function __construct(Buyer $model)
    {
        $this->model = $model;
    }
    /**
     * Associated Repository Model.
     */
    const MODEL = User::class;

    /**
     * @return mixed
     */
    public function getForDataTable()
    {
        return $this->model
        ->select(config('tables.users_table').'.*' )
        ->join('role_user', 'role_user.user_id', '=', config('tables.users_table').'.id')
        ->where('role_user.role_id', '3')
        ->orderByDesc('id')->get();
    }

    public function getBuyerDetails($id){
        return $this->model
        ->select(config('tables.users_table').'.*' )
        ->join('role_user', 'role_user.user_id', '=', config('tables.users_table').'.id')
        ->where('role_user.role_id', '3')
        ->find($id);
    }
    /**
     *
     * {@inheritDoc}
     *
     * @see \App\Repositories\Buyer\BuyerRepositoryInterface::create()
     */
    public function create(array $input)
    {
        return $this->model->create($input);
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
     * For change Buyer status
     */
    public function changeStatus($id, $status)
    {
        return $this->model->where('id', $id)->update(['status' => $status]);
    }

}
