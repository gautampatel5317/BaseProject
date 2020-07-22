@extends('backend.layouts.admin')
@section('page-header')
{{ trans('global.view') }} {{ trans('global.role.title_singular') }}
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
                            {{ trans('global.role.fields.title') }}
                        </th>
                        <td>
                            {{ $role->title }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('global.permissions') }}
                        </th>
                        <td>
                            @foreach($role->permissions as $id => $permissions)
                            <span class="label label-info label-many">{{ $permissions->title }}</span>
                            @endforeach
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="card-footer text-center">
            <a href="{{ route('admin.roles.index') }}" class="btn btn-danger ml-2">{{ trans('global.back') }}</a>
        </div>
    </div>
</div>
@endsection