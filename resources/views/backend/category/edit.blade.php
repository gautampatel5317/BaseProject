@extends('backend.layouts.admin')
@section('page-header')
{{ trans('global.edit') }} {{ trans('global.category.title_singular') }}
@endsection
@section('content')
<div class="container-fluid">
    @include('flash::message')
    <div class="card card-primary card-outline">
        <div class="card-body">
            {!! Form::model($category, ['url' => route('admin.category.update',$category->id),'enctype'=> 'multipart/form-data','method'=>'PUT','class'=>'form-validate-jquery']) !!}
            @csrf
            @method('PUT')
            <input type="hidden" name = "id" value = "{{$category->id}}">
            @include('backend.category.form')
            {{ Form::close() }}
        </div>
    </div>
</div>
@endsection