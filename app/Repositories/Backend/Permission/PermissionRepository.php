<?php
namespace App\Repositories\Backend\Permission;

use App\Models\Permission\Permission;
use App\Repositories\BaseRepository;

/**
 * Class PermissionRepository.
 */

class PermissionRepository extends BaseRepository {
	/**
	 * @var modal
	 */
	protected $modal;
	/**
	 * @param \App\Repositories\Backend\Role\PermissionRepository $modal
	 */
	public function __construct(Permission $modal) {
		$this->modal = $modal;
	}
	/**
	 * Associated Repository Model.
	 */
	const MODEL = Permission::class ;
	/**
	 * @return mixed
	 */
	public function getForDataTable() {
		return $this->modal->all();
	}
	/**
	 *
	 * create a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function create($input) {
		$permission = $this->modal->create($input);
		return $permission;
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(array $input, $permission) {
		$permission->update($input);
		return $permission;
	}
	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($permission) {
		return $permission->load('roles');
	}
	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($permission) {
		return $permission->delete();
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
}