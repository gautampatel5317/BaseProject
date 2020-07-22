<?php
namespace App\Repositories\Frontend\Customer;

use App\Models\Customer\Customer;
use App\Models\User\User;
use App\Repositories\BaseRepository;
use Carbon\Carbon as Carbon;

class CustomerRepository extends BaseRepository {
	/**
	 * Modal
	 */
	protected $model;
	public function __construct(Customer $model) {
		$this->model = $model;
	}
	/**
	 * Associated Repository Model.
	 */
	const MODEL = Customer::class ;
	/**
	 * @return mixed
	 */
	public function getForDataTable() {
		return $this->model->all();
	}
	/**
	 *
	 * {@inheritDoc}
	 *
	 * @see \App\Repositories\Customer\CustomerRepositoryInterface::create()
	 */
	public function create(array $input) {
		$customer = Customer::create($input);
		if ($customer) {
			$user             = new User();
			$user->is_front   = $customer['id'];
			$user->name       = $input['first_name'];
			$user->email      = $input['email'];
			$user->password   = \Hash::make($input['password']);
			$user->status     = 1;
			$user->created_at = Carbon::now();
			if ($user->save()) {
				//set role
				$user->roles()->sync([2]);
				//Send Mail
				$data = [
					'data'               => [
						'first_name'        => $user['name'],
						'email'             => $user['email'],
						'confirmation_code' => '/customer/confirm',
						'customer_id'       => $customer['id'],
						'user_id'           => $user->id,
					],
					'email_template_type' => 1
				];
				$confirmationMail = createNotification('User Registration', $user->id, $data);
				return true;
			}
		}
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(array $input, $customer) {
		return $customer->update($input);
	}
	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($customer) {
		return $customer->delete();
	}
	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function massdestroy($request) {
		return $this->model->whereIn('id', $request)->delete();
	}
}
?>