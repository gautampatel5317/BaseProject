<?php

namespace App\Models\SellerDetail;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SellerDetail extends Model {
	use SoftDeletes;
	protected $table = 'seller_detail';
}
