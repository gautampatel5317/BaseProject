@extends('backend.layouts.admin')
@section('content')
<div class="card">
    <div class="card-header">
        {{ trans('global.show') }} {{ trans('global.permission.title') }}
    </div>
    <div class="card-body">
        <table class="table table-bordered table-striped">
            <tbody>
                <tr>
                    <th>
                        {{ trans('global.permission.fields.title') }}
                    </th>
                    <td>
                        {{ $permission->title }}
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
     <div class="card-footer text-center">
            <a href="{{ route('admin.permissions.index') }}" class="btn btn-danger ml-2">{{ trans('global.back') }}</a>
        </div>
</div>
@endsection