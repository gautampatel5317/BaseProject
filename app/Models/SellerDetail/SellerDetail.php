<?php

namespace App\Models\SellerDetail;

use App\Models\SellerDetail\Traits\Attribute\SellerDetailAttribute;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SellerDetail extends Model
{
    use SoftDeletes, SellerDetailAttribute;
    protected $table = 'seller_detail';
    protected $fillable = [
        'id',
        'user_id',
        'shop_name',
        'shop_url',
        'phone_number',
        'created_at',
        'updated_at',
        'deleted_at',
    ];
}
