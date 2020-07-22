@extends('backend.layouts.admin')
@section('page-header')
{{ trans('global.edit') }} {{ trans('global.permissions') }}
@endsection
@section('content')
<div class="container-fluid">
    @include('flash::message')
    <div class="card card-primary card-outline">
        <div class="card-body">
              {!! Form::model($permission, ['url' => route('admin.permissions.update',$permission->id),'enctype'=> 'multipart/form-data','method'=>'PUT','class'=>'form-validate-jquery']) !!}
                        @include('backend.permissions.form')
              {!! Form::close() !!}
        </div>
    </div>
</div>
@endsection