<?php

namespace App\Repositories\Backend\SubscriptionName;

use App\Repositories\BaseRepository;
use App\Models\SubscriptionName\SubscriptionName;
use Illuminate\Support\Facades\DB;

class SubscriptionNameRepository extends BaseRepository
{

    protected $model;

    public function __construct(SubscriptionName $model)
    {
        $this->model = $model;
    }
    /**
     * Associated Repository Model.
     */
    const MODEL = SubscriptionName::class;

    /**
     * @return mixed
     */
    public function getForDataTable()
    {
        return $this->model->orderByDesc('id')->get();
    }

    public function getSubscriptionName()
    {
        return $this->model->where('status', '1')->orderByDesc('id')->get();
    }
    /**
     *
     * {@inheritDoc}
     *
     * @see \App\Repositories\SubscriptionName\SubscriptionNameRepositoryInterface::create()
     */
    public function create(array $input)
    {
        $input['created_by'] = auth()->user()->id;
        return SubscriptionName::create($input);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(array $input, $subscriptionname)
    {
        $input['updated_by'] = auth()->user()->id;
        return $subscriptionname->update($input);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($subscriptionname)
    {
        return $subscriptionname->delete();
    }
    /**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function massDestroy($request) {
		return $this->modal->whereIn('id', $request)->delete();
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
