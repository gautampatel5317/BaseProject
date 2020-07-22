<?php
namespace App\Repositories\Backend\Customer;

use App\Models\Customer\Customer;
use App\Models\User\User;
use App\Repositories\BaseRepository;
use Carbon\Carbon;

class CustomerRepository extends BaseRepository {

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
        return $this->model->select(config("tables.customers_table").'.*', config("tables.levelof_experience_table").'.name AS experience_name')
        ->leftjoin(config("tables.levelof_experience_table"), config("tables.levelof_experience_table").'.id', '=', config("tables.customers_table").'.experience')
        ->orderByDesc(config("tables.customers_table").'.id')->get();
	}
	/**
	 *
	 * {@inheritDoc}
	 *
	 * @see \App\Repositories\Customer\CustomerRepositoryInterface::create()
	 */
	public function create(array $input) {
		$input['created_by'] = auth()->user()->id;
        $customer = Customer::create($input);
        if ($customer) {
			$user             = new User();
			$user->is_front   = $customer['id'];
			$user->name       = $input['first_name'];
			$user->email      = $input['email'];
            $user->password   = \Hash::make('123456');
            $user->status     = $input['status'];
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
		$input['updated_by'] = auth()->user()->id;
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