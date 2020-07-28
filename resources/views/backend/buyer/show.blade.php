@extends('backend.layouts.admin')
@section('content')
<div class="card">
    <div class="card-header">
        {{ trans('global.show') }} {{ trans('global.buyer.title_singular') }}
    </div>
    <div class="card-body">
        <table class="table table-bordered table-striped">
            <tbody>
                <tr>
                    <th>{{ trans('global.email') }}</th>
                    <td>{{ $buyer->email }}</td>
                </tr>
                <tr>
                    <th>{{ trans('global.first_name') }}</th>
                    <td>{{ $buyer->first_name }}</td>
                </tr>
                <tr>
                    <th>{{ trans('global.last_name') }}</th>
                    <td>{{ $buyer->last_name }}</td>
                </tr>
                
            </tbody>
        </table>
    </div>
     <div class="card-footer text-center">
            <a href="{{ route('admin.buyer.index') }}" class="btn btn-danger ml-2">{{ trans('global.back') }}</a>
        </div>
</div>
@endsection