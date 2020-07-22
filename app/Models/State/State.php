<?php

namespace App\Models\State;
use App\Models\Country\Country;
use App\Models\State\Traits\Attribute\StateAttribute;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class State extends Model {
	use SoftDeletes, StateAttribute;
	protected $fillable = [
		'id',
		'name',
		'country_id',
		'status',
		'created_at',
		'updated_at',
		'deleted_at',
		'created_by',
		'updated_by',
	];
	public function country() {
		return $this->hasOne(Country::class , 'id', 'country_id');
	}
}
