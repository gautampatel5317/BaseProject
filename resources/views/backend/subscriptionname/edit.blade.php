@extends('backend.layouts.admin')
@section('page-header')
{{ trans('global.edit') }} {{ trans('global.subscriptionname.title_singular') }}
@endsection
@section('content')
<div class="container-fluid">
    @include('flash::message')
    <div class="card card-primary card-outline">
        <div class="card-body">
            {!! Form::model($subscriptionname, ['url' => route('admin.subscriptionname.update',$subscriptionname->id),'enctype'=> 'multipart/form-data','method'=>'PUT','class'=>'form-validate-jquery']) !!}
            @csrf
            @method('PUT')
            <input type="hidden" name = "id" value = "{{$subscriptionname->id}}">
            @include('backend.subscriptionname.form')
            {{ Form::close() }}
        </div>
    </div>
</div>
@endsection