@extends('backend.layouts.admin')
@section('page-header')
{{ trans('global.show') }} {{ trans('global.customer.title_singular') }}
@endsection
@section('content')
<div class="container-fluid">
    @include('flash::message')
    <div class="card card-primary card-outline">
        <div class="card-body">
            <table class="table table-bordered table-striped">
                <tbody>
                    <tr>
                        <th>
                            {{ trans('global.customer.fields.name') }}
                        </th>
                        <td>
                            {{ $customer->first_name }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('global.customer.fields.family_name') }}
                        </th>
                        <td>
                            {!! $customer->family_name !!}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('global.customer.fields.email') }}
                        </th>
                        <td>
                            {{ $customer->email }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('global.customer.fields.experience') }}
                        </th>
                        <td>
                            {{ $customer->experience }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('global.customer.fields.business') }}
                        </th>
                        <td>
                            {{ $customer->business }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('global.customer.fields.confirmed') }}
                        </th>
                        <td>
                        @if($customer->confirmed == "1")
                            <i class="fas fa-check-circle fa-2x text-success"></i>
                        @else
                            <i class="fas fa-times-circle fa-2x text-danger"></i>
                        @endif
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('global.status') }}
                        </th>
                        <td>
                        @if($customer->status == "1")
                            <i class='fas fa-check fa-2x text-success'></i>
                        @else
                            <i class="fas fa-times fa-2x text-danger"></i>
                        @endif
                        </td>
                    </tr>
                    
                </tbody>
            </table>
        </div>
        <div class="card-footer text-center">
            <a href="{{ route('admin.customers.index') }}" class="btn btn-danger ml-2">{{ trans('global.back') }}</a>
        </div>
    </div>
</div>
@endsection