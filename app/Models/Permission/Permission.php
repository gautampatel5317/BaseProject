<?php

namespace App\Models\Permission;

use App\Models\ModelTrait;
use App\Models\Permission\Traits\Attribute\PermissionAttribute;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;

class Permission extends Model {
	use SoftDeletes, Notifiable, ModelTrait, PermissionAttribute;

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
}
