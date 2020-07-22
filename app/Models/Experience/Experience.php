<?php

namespace App\Models\Experience;

use App\Models\Experience\Traits\Attribute\ExperienceAttribute;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Experience extends Model {
    use SoftDeletes, ExperienceAttribute;
    protected $table = "levelof_experience";
	protected $fillable = [
		'id',
		'name',
		'status',
		'created_at',
		'updated_at',
		'deleted_at',
		'created_by',
		'updated_by',
	];
}
