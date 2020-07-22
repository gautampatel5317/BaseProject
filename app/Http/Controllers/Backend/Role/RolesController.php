<?php

namespace App\Http\Controllers\Backend\Role;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\Role\CreateRoleRequest;
use App\Http\Requests\Backend\Role\ManageRoleRequest;
use App\Http\Requests\Backend\Role\MassDestroyRoleRequest;
use App\Http\Requests\Backend\Role\StoreRoleRequest;
use App\Http\Requests\Backend\Role\UpdateRoleRequest;
use App\Models\Permission\Permission;
use App\Models\Role\Role;
use App\Repositories\Backend\Role\RoleRepository;

class RolesController extends Controller {
	/**
	 * @var RoleRepository
	 */
	protected $role;
	/**
	 * @param \App\Repositories\Backend\Role\RoleRepository $role
	 */
	public function __construct(RoleRepository $role) {
		$this->role = $role;
	}
	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index(ManageRoleRequest $request) {
		abort_unless(\Gate::allows('role_access'), 403);
		return view('backend.roles.index');
	}
	/**
	 * Show the form for creating a new resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create(CreateRoleRequest $request) {
		abort_unless(\Gate::allows('role_create'), 403);
		$permissions = Permission::all()->pluck('title', 'id');
		return view('backend.roles.create', compact('permissions'));
	}
	/**
	 * Store a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(StoreRoleRequest $request) {
		abort_unless(\Gate::allows('role_create'), 403);
		$input = $request->except('_token');
		$role  = $this->role->create($input);
		flash(trans('alerts.role_add_message'))->success()->important();
		return redirect()->route('admin.roles.index');
	}
	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit(Role $role) {
		abort_unless(\Gate::allows('role_edit'), 403);
		$permissions = Permission::all()->pluck('title', 'id');
		$role->load('permissions');
		return view('backend.roles.edit', compact('permissions', 'role'));
	}
	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(UpdateRoleRequest $request, Role $role) {
		abort_unless(\Gate::allows('role_edit'), 403);
		$input = $request->except('_token');
        $role  = $this->role->update($input, $role);
        flash(trans('alerts.role_edit_message'))->success()->important();
		return redirect()->route('admin.roles.index');
	}
	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show(Role $role) {
		abort_unless(\Gate::allows('role_show'), 403);
		$role = $this->role->show($role);
		return view('backend.roles.show', compact('role'));
	}
	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function roleDelete(Role $role) {
		abort_unless(\Gate::allows('role_delete'), 403);
		$role = $this->role->destroy($role);
		flash(trans('alerts.role_delete_message'))->success()->important();
		return back();
	}
	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy(Role $role) {
		abort_unless(\Gate::allows('role_delete'), 403);
		$role = $this->role->destroy($role);
		flash(trans('alerts.role_delete_message'))->success()->important();
		return back();
	}
	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function massDestroy(MassDestroyRoleRequest $request) {
		$this->role->massDestroy(request('ids'));
		return response(null, 204);
	}
}
