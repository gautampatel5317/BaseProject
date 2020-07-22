<?php
namespace App\Repositories\Backend\Role;

use App\Models\Role\Role;
use App\Repositories\BaseRepository;

/**
 * Class RoleRepository.
 */

class RoleRepository extends BaseRepository {
	/**
	 * @var modal
	 */
	protected $modal;
	/**
	 * @param \App\Repositories\Backend\Role\RoleRepository $modal
	 */
	public function __construct(Role $modal) {
		$this->modal = $modal;
	}
	/**
	 * Associated Repository Model.
	 */
	const MODEL = Role::class ;
	/**
	 * @return mixed
	 */
	public function getForDataTable() {
		return $this->modal->with(config('tables.permissions_table'));
	}
	/**
	 *
	 * create a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function create($input) {
		$role = $this->modal->create($input);
		$role->permissions()->sync($input['permissions']);
		return $role;
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(array $input, $role) {
		$role->update($input);
		$role->permissions()->sync($input['permissions']);
		return $role;
	}
	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($role) {
		return $role->load('permissions');
	}
	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($role) {
		return $role->delete();
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