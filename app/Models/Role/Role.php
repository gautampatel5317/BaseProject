<?php

namespace App\Models\Role;

use App\Models\BaseModel;
use App\Models\ModelTrait;
use App\Models\Permission\Permission;
use App\Models\Role\Traits\Attribute\RoleAttribute;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;

class Role extends BaseModel {
	use SoftDeletes,
	Notifiable,
	ModelTrait,
	RoleAttribute;

	protected $dates = [
		'created_at',
		'updated_at',
		'deleted_at',
	];

	protected $fillable = [
		'title',
		'created_at',
		'updated_at',
		'deleted_at',
	];

	public function permissions() {
		return $this->belongsToMany(Permission::class );
	}
}
