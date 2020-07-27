<?php

namespace App\Http\Controllers\Backend\Seller;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\Seller\CreateSellerRequest;
use App\Http\Requests\Backend\Seller\StoreSellerRequest;
use App\Http\Requests\Backend\Seller\UpdateSellerRequest;
use App\Models\SellerDetail\SellerDetail;
use App\Models\User\User;
use App\Repositories\Backend\Seller\SellerRepository;
use App\Repositories\Backend\User\UserRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SellerController extends Controller
{

    protected $model;
    public function __construct(SellerRepository $model)
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
        abort_unless(\Gate::allows('seller_access'), 403);
        return view('backend.seller.index');
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(CreateSellerRequest $request)
    {
        return view('backend.seller.create');
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreSellerRequest $request)
    {
        abort_unless(\Gate::allows('seller_create'), 403);
        $input = $request->except('_token');

        $user             = new User();
        $user->first_name = $input['first_name'];
        $user->last_name  = $input['last_name'];
        $user->email      = $input['email'];
        $user->password   = \Hash::make($input['password']);
        $user->status = ($request->get('status') != "1" ? '0' : '1');
        if ($user->save()) {
            $user->roles()->sync([2]);
            $input['user_id'] = $user->id;
            $this->model->create($input);
            flash(trans('alerts.seller_add_message'))->success()->important();
            return redirect()->route('admin.seller.index');
        }
    }
    public function show($id)
    {
        $seller = $this->model->getSellerDetails($id);
        // dd($seller);
        abort_unless(\Gate::allows('seller_show'), 403);
        return view('backend.seller.show', compact('seller'));
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        abort_unless(\Gate::allows('seller_edit'), 403);
        $seller = $this->model->getSellerDetails($id);
        return view('backend.seller.edit', compact('seller'));
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateSellerRequest $request, $id)
    {
        abort_unless(\Gate::allows('seller_edit'), 403);
        $input   = $request->except('_token');
        $this->model->update($input, $id);
        if ($request->get('status') != "1") {
            $input['status'] = '0';
        }
        DB::table(config('tables.users_table'))
            ->where('id', $input['user_id'])
            ->update(
                ['first_name' => $input['first_name'], 'last_name' => $input['last_name'], 'email' => $input['email'], 'status' => $input['status']]
            );
        flash(trans('alerts.seller_edit_message'))->success()->important();
        return redirect()->route('admin.seller.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        abort_unless(\Gate::allows('seller_delete'), 403);
        $this->model->destroy($id);
        return "success";
    }

    public function changeStatus(Request $request, UserRepository $user)
    {
        $input = $request->except('_token');
        $flag = $user->changeStatus($input['id'], $input['status']);
        if ($flag == 1) {
            return "success";
        } else {
            return "failed";
        }
    }
}
