<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Utilities\SendEmail;
use App\Repositories\Frontend\User\UserRepository;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Validator;

class ForgotPasswordController extends Controller
{
    /*
	|--------------------------------------------------------------------------
	| Password Reset Controller
	|--------------------------------------------------------------------------
	|
	| This controller is responsible for handling password reset emails and
	| includes a trait which assists in sending these notifications from
	| your application to your users. Feel free to explore this trait.
	|
	 */

    use SendsPasswordResetEmails;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(UserRepository $repository)
    {
        $this->middleware('guest');
        $this->repository = $repository;
    }

    /**
     * Send a reset link to the given user.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function sendResetLinkEmail(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'email' => 'required|email',
        ]);

        if ($validation->fails()) {
            return redirect()
                ->back()
                ->withErrors($validation)
                ->withInput();
        }

        $user = $this->repository->findByEmail($request->get('email'));
        $generatedToken = sha1(rand());

        DB::table('password_resets')->insert(
            ['email' => $request->get('email'), 'token' => $generatedToken, 'created_at' => date('Y-m-d H:i:s')]
        );
        if (!$user) {
            return redirect()->back()->withErrors([trans('api.messages.forgot_password.validation.email_not_found')]);
        }
        $data['email'] = $request->get('email');
        $data['password_reset_link'] = "http://dashrath.prajapati.opsusers.com/BaseProject/public/password/verify/" . $generatedToken;    // need to create dynamic url
        $mail = new SendEmail();
        $mail->sendWithTemplate($data, 5);

        flash(trans('api.messages.forgot_password.success'))->success()->important();
        return redirect()->back();
    }
}
