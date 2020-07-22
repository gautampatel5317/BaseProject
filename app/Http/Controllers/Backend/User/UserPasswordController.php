<?php

namespace App\Http\Controllers\Backend\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\User\ManageUserRequest;
use App\Http\Requests\Backend\User\ProfileUserRequest;
use App\Models\User\User;
use App\Repositories\Backend\User\UserRepository;
use Hash;
use Auth;
/**
 * Class UserPasswordController.
 */
class UserPasswordController extends Controller
{
    /**
     * @var UserRepository
     */
    protected $user;

    /**
     * @param UserRepository $users
     */
    public function __construct(UserRepository $user    )
    {
        $this->user = $user;
    }

    /**
     * @param User              $user
     * @param ManageUserRequest $request
     *
     * @return mixed
     */
    public function edit(ManageUserRequest $request)
    {
        $user = Auth::user();
        return view('backend.users.profile')
            ->withUser($user);
    }

    /**
     * @param User                      $user
     * @param UpdateUserPasswordRequest $request
     *
     * @return mixed
     */
    public function update(ProfileUserRequest $request)
    {
        $user = Auth::user();
        $input = $request->except('_token');
        if (Hash::check($input['current_password'], $user->password)) {
            
            $user->password = bcrypt($request->get('new_password'));
            $user  = $this->user->changepassword($input, $user);
			
			flash(trans('alerts.password_success_message'))->success()->important();
		    return redirect()->route('admin.users.profile');
        }else{
            flash(trans('alerts.password_error_message'))->error()->important();
            return redirect()->route('admin.users.profile');
        }
        
    }
}
