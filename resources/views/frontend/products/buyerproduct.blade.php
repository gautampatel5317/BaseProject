@extends('frontend.layouts.app')
@section('header')
@endsection
@section('content')
<div class="row">
	@if (!empty($getProducts))
	@foreach($getProducts as $productKey => $productVal)
	{{-- {{ dd($productVal) }} --}}
	@if (!empty($productVal['product_image']))
		@php
			// $productVal['product_image']);
			$image = \URL::to(config('path.upload.product').$productVal['id'].'/'.$productVal['product_image'][0]['image']);
		@endphp
	@else
		@php
			$image = 'https://demo.online.rs/wp-content/uploads/2018/06/demo-prod-grey_1.png';
		@endphp
	@endif
	<div class="col-xs-12 col-sm-6 col-md-4">
		<div class="card" style="width: 18rem;">
		<img src="{{ $image }}" class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" role="img"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"/></img>
		<div class="card-body">
			<center>
			<h5 class="card-title">{{ $productVal['title'] }}</h5>
			<p class="card-text" style="color: green; font-weight: bold;">$ {!! $productVal['rate'] !!}</p>
			<a href="#" class="btn btn-primary">Buy Now</a>
			</center>
		</div>
	</div>
</div>
@endforeach
@endif
</div>
@endsection