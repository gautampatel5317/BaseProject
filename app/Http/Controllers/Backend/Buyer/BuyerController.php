<?php

namespace App\Http\Controllers\Backend\Buyer;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\Buyer\CreateBuyerRequest;
use App\Http\Requests\Backend\Buyer\StoreBuyerRequest;
use App\Http\Requests\Backend\Buyer\UpdateBuyerRequest;
use App\Models\BuyerDetail\BuyerDetail;
use App\Models\User\User;
use App\Repositories\Backend\Buyer\BuyerRepository;
use App\Repositories\Backend\User\UserRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BuyerController extends Controller
{

    protected $model;
    public function __construct(BuyerRepository $model)
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
        abort_unless(\Gate::allows('buyer_access'), 403);
        return view('backend.buyer.index');
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(CreateBuyerRequest $request)
    {
        return view('backend.buyer.create');
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreBuyerRequest $request)
    {
        abort_unless(\Gate::allows('buyer_create'), 403);
        $input = $request->except('_token');

        $user             = new User();
        $user->first_name = $input['first_name'];
        $user->last_name  = $input['last_name'];
        $user->email      = $input['email'];
        $user->password   = \Hash::make($input['password']);
        $user->status = ($request->get('status') != "1" ? '0' : '1');
        if ($user->save()) {
            $user->roles()->sync([3]);
            flash(trans('alerts.buyer_add_message'))->success()->important();
            return redirect()->route('admin.buyer.index');
        }
    }
    public function show($id)
    {
        $buyer = $this->model->getBuyerDetails($id);
        abort_unless(\Gate::allows('buyer_show'), 403);
        return view('backend.buyer.show', compact('buyer'));
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        abort_unless(\Gate::allows('buyer_edit'), 403);
        $buyer = $this->model->getBuyerDetails($id);
        return view('backend.buyer.edit', compact('buyer'));
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateBuyerRequest $request, $id)
    {
        abort_unless(\Gate::allows('buyer_edit'), 403);
        $input   = $request->except('_token');
        $this->model->update($input, $id);
        if ($request->get('status') != "1") {
            $input['status'] = '0';
        }
        $updateArray = [];
        $updateArray['first_name'] = $input['first_name'];
        $updateArray['last_name'] = $input['last_name'];
        $updateArray['email'] = $input['email'];
        $updateArray['status'] = $input['status'];
        if($input['password'] != ""){
            $updateArray['password']   = \Hash::make($input['password']);
        }
        
        DB::table(config('tables.users_table'))
            ->where('id', $input['user_id'])
            ->update($updateArray);
        flash(trans('alerts.buyer_edit_message'))->success()->important();
        return redirect()->route('admin.buyer.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        abort_unless(\Gate::allows('buyer_delete'), 403);
        $this->model->destroy($id);
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
