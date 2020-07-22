<?php

namespace App\Models\Cms;

use App\Models\Cms\Traits\Attribute\CmsAttribute;
use App\Models\ModelTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;

class Cms extends Model
{
    protected $table = 'cms_pages';
    use SoftDeletes, Notifiable, ModelTrait, CmsAttribute;
    protected $fillable = [
        'id',
        'title',
        'description',
        'cannonical_link',
        'seo_title',
        'seo_keyword',
        'seo_description',
        'status',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
        'deleted_at',
    ];
}
