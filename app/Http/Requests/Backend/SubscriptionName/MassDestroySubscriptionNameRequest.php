<?php

namespace App\Http\Requests;

use App\SubscriptionName;
use Gate;
use Illuminate\Foundation\Http\FormRequest;

class MassDestroySubscriptionNameRequest extends FormRequest
{
    public function authorize()
    {
        return abort_if(Gate::denies('subscriptionname_delete'), 403, '403 Forbidden') ?? true;
    }

    public function rules()
    {
        return [
            'ids'   => 'required|array',
            'ids.*' => 'exists:subscriptionname,id',
        ];
    }
}
