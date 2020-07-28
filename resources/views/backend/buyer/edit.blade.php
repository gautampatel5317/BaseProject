@extends('backend.layouts.admin')
@section('page-header')
{{ trans('global.edit') }} {{ trans('global.buyer.title_singular') }}
@endsection
@section('content')
<div class="container-fluid">
    @include('flash::message')
    <div class="card card-primary card-outline">
        <div class="card-body">
            {!! Form::model($buyer, ['url' => route('admin.buyer.update',$buyer->id),'enctype'=> 'multipart/form-data','method'=>'PUT','class'=>'form-validate-jquery']) !!}
            @csrf
            @method('PUT')
            <input type="hidden" name = "id" value = "{{$buyer->id}}">
            <input type="hidden" name = "user_id" value = "{{$buyer->user_id}}">
            @include('backend.buyer.form')
            {{ Form::close() }}
        </div>
    </div>
</div>
@endsection