<?php
namespace App\Http\Controllers\Backend\User;
use App\Http\Controllers\Controller;
use App\Models\User\User;
use App\Repositories\Backend\User\UserRepository;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

/**
 * Class UserTableController.
 */

class UserTableController extends Controller {
	/**
	 * @var $user
	 */
	protected $user;
	/**
	 * @param \App\Repositories\Backend\User\UserRepository $user
	 */
	public function __construct(UserRepository $user) {
		$this->user = $user;
	}
	/**
	 * @param ManageBlogsRequest $request
	 *
	 * @return mixed
	 */
	public function __invoke(Request $request) {
		return Datatables::of($this->user->getForDataTable())
			->escapeColumns(['name'])
			->addColumn('checkbox', function ($user) {
				return "";
			})
			->addColumn('created_at', function ($user) {
				if (!empty($user->created_at)) {
					$createadAt = date('Y-m-d', strtotime($user->created_at));
					return $createadAt;
				}
				return '-';
			})
			->addColumn('updated_at', function ($user) {
				if (!empty($user->updated_at)) {
					$updatedAt = date('Y-m-d', strtotime($user->updated_at));
					return $updatedAt;
				}
				return '-';
			})
			->addColumn('email_verified_at', function ($user) {
				if (empty($user->email_verified_at)) {
					return '-';
				}
				return $user->email_verified_at;
			})
			->addColumn('roles', function ($user) {
				if (!empty($user->roles)) {
					$roles = [];
					foreach ($user->roles as $key => $item) {
						$roles[] = "<span class='badge badge-success'>$item->title</span>";
					}
				} else {
					return '';
				}
				return $roles;
			})
			->addColumn('status', function ($user) {
				if ($user->status == 1) {
					return "<span class='badge badge-success'>Active</span>";
				} else {
					return "<span class='badge badge-danger'>InActive</span>";
				}
			})
			->addColumn('actions', function ($user) {
				return $user->action_buttons;
			})
			->make(true);
	}
}
