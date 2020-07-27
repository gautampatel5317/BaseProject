@extends('backend.layouts.admin')
@section('page-header')
{{ trans('global.edit') }} {{ trans('global.seller.title_singular') }}
@endsection
@section('content')
<div class="container-fluid">
    @include('flash::message')
    <div class="card card-primary card-outline">
        <div class="card-body">
            {!! Form::model($seller, ['url' => route('admin.seller.update',$seller->id),'enctype'=> 'multipart/form-data','method'=>'PUT','class'=>'form-validate-jquery']) !!}
            @csrf
            @method('PUT')
            <input type="hidden" name = "id" value = "{{$seller->id}}">
            <input type="hidden" name = "user_id" value = "{{$seller->user_id}}">
            @include('backend.seller.form')
            {{ Form::close() }}
        </div>
    </div>
</div>
@endsection