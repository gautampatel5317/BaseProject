@extends('backend.layouts.admin')
@section('page-header')
{{ trans('global.edit') }} {{ trans('global.subscriptiontype.title_singular') }}
@endsection
@section('content')
<div class="container-fluid">
    @include('flash::message')
    <div class="card card-primary card-outline">
        <div class="card-body">
            {!! Form::model($subscriptiontype, ['url' => route('admin.subscriptiontype.update',$subscriptiontype->id),'enctype'=> 'multipart/form-data','method'=>'PUT','class'=>'form-validate-jquery']) !!}
            @csrf
            @method('PUT')
            <input type="hidden" name = "id" value = "{{$subscriptiontype->id}}">
            @include('backend.subscriptiontype.form')
            {{ Form::close() }}
        </div>
    </div>
</div>
@endsection