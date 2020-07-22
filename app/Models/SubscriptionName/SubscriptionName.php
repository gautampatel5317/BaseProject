<?php

namespace App\Models\SubscriptionName;

use App\Models\SubscriptionName\Traits\Attribute\SubscriptionNameAttribute;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SubscriptionName extends Model
{
    use SoftDeletes, SubscriptionNameAttribute;
    public $table = 'subscription_name';
    protected $fillable = [
        'id',
        'name',
        'status',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
        'deleted_at',
    ];
}
