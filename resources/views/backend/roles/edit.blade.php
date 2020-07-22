@extends('backend.layouts.admin')
@section('page-header')
{{ trans('global.edit') }} {{ trans('global.role.title_singular') }}
@endsection
@section('content')
<div class="container-fluid">
    @include('flash::message')
     <div class="card card-primary card-outline">
        <div class="card-body">
             {!! Form::model($role, ['url' => route('admin.roles.update',$role->id),'enctype'=> 'multipart/form-data','method'=>'PUT','class'=>'form-validate-jquery']) !!}
                     @include('backend.roles.form')
             {!! Form::close() !!}
        </div>
     </div>
</div>
@endsection