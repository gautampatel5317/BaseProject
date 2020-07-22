<?php

namespace App\Http\Controllers\Backend\Permission;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\Permission\CreatePermissionRequest;
use App\Http\Requests\Backend\Permission\ManagePermissionRequest;
use App\Http\Requests\Backend\Permission\MassDestroyPermissionRequest;
use App\Http\Requests\Backend\Permission\StorePermissionRequest;
use App\Http\Requests\Backend\Permission\UpdatePermissionRequest;
use App\Models\Permission\Permission;
use App\Repositories\Backend\Permission\PermissionRepository;

class PermissionsController extends Controller {
	/**
	 * @var PermissionRepository
	 */
	protected $permission;
	/**
	 * @param \App\Repositories\Backend\Role\PermissionRepository $permission
	 */
	public function __construct(PermissionRepository $permission) {
		$this->permission = $permission;
	}
	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index(ManagePermissionRequest $request) {
		abort_unless(\Gate::allows('permission_access'), 403);
		$permissions = $this->permission->getForDataTable();
		return view('backend.permissions.index', compact('permissions'));
	}
	/**
	 * Show the form for creating a new resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create(CreatePermissionRequest $request) {
		abort_unless(\Gate::allows('permission_create'), 403);
		return view('backend.permissions.create');
	}
	/**
	 * Store a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(StorePermissionRequest $request) {
		abort_unless(\Gate::allows('permission_create'), 403);
		$input      = $request->except('_token');
		$permission = $this->permission->create($input);
		flash(trans('alerts.permission_add_message'))->success()->important();
		return redirect()->route('admin.permissions.index');
	}
	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit(Permission $permission) {
		abort_unless(\Gate::allows('permission_edit'), 403);
		return view('backend.permissions.edit', compact('permission'));
	}
	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(UpdatePermissionRequest $request, Permission $permission) {
		abort_unless(\Gate::allows('permission_edit'), 403);
		$input      = $request->except('_token');
        $permission = $this->permission->update($input, $permission);
        flash(trans('alerts.permission_edit_message'))->success()->important();
		return redirect()->route('admin.permissions.index');
	}
	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show(Permission $permission) {
		abort_unless(\Gate::allows('permission_show'), 403);
		return view('backend.permissions.show', compact('permission'));
	}
	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy(Permission $permission) {
		abort_unless(\Gate::allows('permission_delete'), 403);
		$permission = $this->permission->destroy($permission);
        flash(trans('alerts.permission_delete_message'))->success()->important();
		return back();
	}
	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function massDestroy(MassDestroyPermissionRequest $request) {
		$this->permission->massDestroy(request('ids'));
		return response(null, 204);
	}
}
