<?php

namespace App\Http\Controllers\Api\V1;
use App\Http\Controllers\Api\V1\APIController;
use App\Http\Requests\StoreUserRequest;
use App\Http\Requests\UpdateUserRequest;
use App\Http\Resources\UserResource;
use App\Models\User\User;
use App\Repositories\Backend\User\UserRepository;
use Illuminate\Http\Request;

class UsersApiController extends APIController {
	protected $repository;
	/**
	 * __construct.
	 *
	 * @param $repository
	 */
	public function __construct(UserRepository $repository) {
		$this->repository = $repository;
	}
	/**
	 * Return the users.
	 *
	 * @param Request $request
	 *
	 * @return \Illuminate\Http\JsonResponse
	 */
	public function index(Request $request) {
		$limit   = $request->get('paginate')?$request->get('paginate'):25;
		$orderBy = $request->get('orderBy')?$request->get('orderBy'):'ASC';
		$sortBy  = $request->get('sortBy')?$request->get('sortBy'):'created_at';
		return UserResource::collection(
			$this->repository->getForDataTable(1, false)->orderBy($sortBy, $orderBy)->paginate($limit)
		);
	}
	/**
	 * Create User.
	 *
	 * @param Request $request
	 *
	 * @return \Illuminate\Http\JsonResponse
	 */
	public function store(StoreUserRequest $request) {
		$validation = $this->validateUser($request);
		if ($validation->fails()) {
			return $this->throwValidation($validation->messages()->first());
		}
		$this->repository->create($request);
		return new UserResource(User::orderBy('created_at', 'desc')->first());
	}
	/**
	 * Update User.
	 *
	 * @param Request $request
	 * @param User    $user
	 *
	 * @return Validator object
	 */
	public function update(UpdateUserRequest $request, User $user) {
		$validation = $this->validateUser($request, 'edit', $user->id);
		if ($validation->fails()) {
			return $this->throwValidation($validation->messages()->first());
		}
		$this->repository->update($user, $request);
		$user = User::findOrfail($user->id);
		return new UserResource($user);
		// return $user->update($request->all());
	}
	/**
	 * Return the specified resource.
	 *
	 * @param User $user
	 *
	 * @return \Illuminate\Http\JsonResponse
	 */
	public function show(User $user) {
		return $user;
	}
	/**
	 * Delete User.
	 *
	 * @param User    $user
	 * @param Request $request
	 *
	 * @return mixed
	 */
	public function destroy(User $user) {
		$this->repository->delete($user);
		return $this->respond([
				'data'    => $user->id,
				'message' => trans('The User has been deleted successfully!'),
			]);
		//return $user->delete();
	}
	/**
	 * validateUser User.
	 *
	 * @param $request
	 * @param $action
	 * @param $id
	 *
	 * @return \Illuminate\Http\JsonResponse
	 */
	public function validateUser(Request $request, $action = '', $id = 0) {
		$password   = ($action == 'edit')?'':'required|min:6|confirmed';
		$validation = Validator::make($request->all(), [
				'name'     => 'required|max:255',
				'email'    => 'required|max:255|email|unique:users,email,'.$id,
				'password' => $password,
				'roles'    => 'required'
			]);
		return $validation;
	}
}
