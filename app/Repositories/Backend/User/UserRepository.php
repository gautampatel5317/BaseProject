<?php
namespace App\Repositories\Backend\User;

use App\Http\Utilities\FileUploads;
use App\Models\User\User;
use App\Repositories\BaseRepository;

/**
 * Class UserRepository.
 */

class UserRepository extends BaseRepository {
	/**
	 * @var UserRepository
	 */
	protected $fileUpload;
	protected $modal;
	/**
	 * @param \App\Repositories\Backend\User\UserRepository $modal
	 */
	public function __construct(User $modal, FileUploads $fileUpload) {
		$this->fileUpload = $fileUpload;
		$this->modal      = $modal;
	}
	/**
	 * Associated Repository Model.
	 */
	const MODEL = User::class ;
	/**
	 * @return mixed
	 */
	public function getForDataTable() {
		return $this->modal->with('roles');
	}
	/**
	 *
	 * create a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function create($input) {
		$user = $this->modal->create($input);
		$user->roles()->sync($input['roles']);
		return $user;
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(array $input, $user) {
		$user->update($input);
		$user->roles()->sync($input['roles']);
		return $user;
	}
	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($user) {
		return $user->load('roles');
	}
	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($user) {
		return $user->delete();
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
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function changepassword(array $input, $user) {
		$user->update($input);
		return $user;
	}
	/**
	 * Change status users.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function changeStatus($input) {
		$updateStatus = User::where('id', $input['id'])->update(['status' => $input['status']]);
		return true;
	}
}