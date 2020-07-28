@extends('backend.layouts.admin')
@section('content')
<div class="card">
    <div class="card-header">
        {{ trans('global.show') }} {{ trans('global.seller.title_singular') }}
    </div>
    <div class="card-body">
        <table class="table table-bordered table-striped">
            <tbody>
                <tr>
                    <th>{{ trans('global.first_name') }}</th>
                    <td>{{ $seller->first_name }}</td>
                </tr>
                <tr>
                    <th>{{ trans('global.last_name') }}</th>
                    <td>{{ $seller->last_name }}</td>
                </tr>
                <tr>
                    <th>{{ trans('global.email') }}</th>
                    <td>{{ $seller->email }}</td>
                </tr>
                <tr>
                    <th>{{ trans('global.seller.fields.shop_name') }}</th>
                    <td>{{ $seller->shop_name }}</td>
                </tr>
                <tr>
                    <th>{{ trans('global.seller.fields.shop_url') }}</th>
                    <td>{{ $seller->shop_url }}</td>
                </tr>
                <tr>
                    <th>{{ trans('global.phone_number') }}</th>
                    <td>{{ $seller->phone_number }}</td>
                </tr>
                
            </tbody>
        </table>
    </div>
     <div class="card-footer text-center">
            <a href="{{ route('admin.seller.index') }}" class="btn btn-danger ml-2">{{ trans('global.back') }}</a>
        </div>
</div>
@endsection