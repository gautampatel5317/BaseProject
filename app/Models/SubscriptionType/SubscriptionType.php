<?php

namespace App\Models\SubscriptionType;

use App\Models\SubscriptionType\Traits\Attribute\SubscriptionTypeAttribute;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SubscriptionType extends Model
{
    use SoftDeletes, SubscriptionTypeAttribute;
    public $table = 'subscription_type';
    protected $fillable = [
        'id',
        'type',
        'status',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
        'deleted_at',
    ];
}
