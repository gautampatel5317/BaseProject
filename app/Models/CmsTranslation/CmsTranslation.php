<?php

namespace App\Models\CmsTranslation;

use Illuminate\Database\Eloquent\Model;

class CmsTranslation extends Model
{
    protected $table = 'cms_translations';
    public $timestamps = false;
    protected $fillable = [
        'id',
        'cms_id',
        'title',
        'description',
        'language',
    ];
}
