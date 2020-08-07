<?php
namespace App\Repositories\Frontend\User;

use App\Models\User\User;
use App\Repositories\BaseRepository;

class UserRepository extends BaseRepository {
	protected $model;
	public function __construct(User $model) {
		$this->model = $model;
    }

    const MODEL = User::class;
    
    public function findByEmail($email){
        $query = $this->model
        ->join('role_user', 'role_user.user_id', '=', 'users.id')
        ->where('email', $email)
        ->where('role_id', '!=' , '1')
        ->first();
        return $query;
    }

}
