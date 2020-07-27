@extends('frontend.layouts.app')
@section('header')
@endsection
@section('content')
<div class="container-fluid">
    @include('flash::message')
    <div class="card card-primary card-outline">
        <div class="card-body">
         {{--    {!! Form::model($products, ['url' => route('products.update',$products->id),'enctype'=> 'multipart/form-data','method'=>'PUT','class'=>'form-validate-jquery']) !!} --}}
             {{ Form::model($products, ['route' => ['products.update', $products->id], 'class' => 'form-horizontal form-validate-jquery', 'role' => 'form', 'method' => 'PATCH', 'id' => 'edit-role', 'files' => true]) }}

            @csrf
            @method('PUT')
            <input type="hidden" name = "id" value = "{{$products->id}}">
            @include('frontend.products.form')
            {{ Form::close() }}
        </div>
    </div>
</div>
@endsection
@section('after-script')
<script type="text/javascript">
</script>
@endsection