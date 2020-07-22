@extends('backend.layouts.admin')
@section('page-header')
{{ trans('global.show') }} {{ trans('global.ingredient.title_singular') }}
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
                            {{ trans('global.ingredient.fields.title') }}
                        </th>
                        <td>
                            {{ $ingredient->title }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('global.ingredient.fields.status') }}
                        </th>
                        <td>
                        @if($ingredient->status == "1")
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
            <a href="{{ route('admin.ingredient.index') }}" class="btn btn-danger ml-2">{{ trans('global.back') }}</a>
        </div>
    </div>
</div>
@endsection