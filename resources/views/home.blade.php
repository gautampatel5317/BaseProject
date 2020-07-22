@extends('backend.layouts.admin')
@section('page-header')
    {{ trans('global.dashboard') }}
@endsection
@section('content')
@include('flash::message')
<div class="container-fluid">
	   <div class="card card-primary card-outline">
	   		<div class="card-header">
	   			<div class="card-tools">
	   			</div>
	   		</div>
	   		<div class="card-body">
	   			<h5>{{ trans('global.welcome_to_ticket5Stars') }}</h5>
	   		</div>
	   </div>
</div>
@endsection