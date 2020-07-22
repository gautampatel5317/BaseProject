<?php

namespace App\Repositories\Backend\SubscriptionType;

use App\Repositories\BaseRepository;
use App\Models\SubscriptionType\SubscriptionType;
use Illuminate\Support\Facades\DB;

class SubscriptionTypeRepository extends BaseRepository
{

    protected $model;

    public function __construct(SubscriptionType $model)
    {
        $this->model = $model;
    }
    /**
     * Associated Repository Model.
     */
    const MODEL = SubscriptionType::class;

    /**
     * @return mixed
     */
    public function getForDataTable()
    {
        return $this->model->orderByDesc('id')->get();
    }

    public function getSubscriptionType()
    {
        return $this->model->where('status', '1')->orderByDesc('id')->get();
    }
    /**
     *
     * {@inheritDoc}
     *
     * @see \App\Repositories\SubscriptionType\SubscriptionTypeRepositoryInterface::create()
     */
    public function create(array $input)
    {
        $input['created_by'] = auth()->user()->id;
        return SubscriptionType::create($input);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(array $input, $subscriptiontype)
    {
        $input['updated_by'] = auth()->user()->id;
        return $subscriptiontype->update($input);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($subscriptiontype)
    {
        return $subscriptiontype->delete();
    }
    /**
     * For change country status
     */
    public function changeStatus($id, $status)
    {
        return $this->model->where('id', $id)
        ->update(['status' => $status, 'updated_by' => auth()->user()->id]);
    }
}
