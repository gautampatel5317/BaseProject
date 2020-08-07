@extends('frontend.layouts.app')
@section('header')
@endsection
@section('content')
<div class="container-fluid">
	@include('flash::message')
	<div class="card card-primary card-outline">
		<div class="card-header">
			<span style="color: blue;font-style: normal;">Product View</span>
		</div>
		<div class="card-body">
			<table class="table table-bordered table-striped">
				<tbody>
					<tr>
						<th>{{ trans('global.title') }}</th>
						<td>{{ $products->title }}</td>
					</tr>
					<tr>
						<th>{{ trans('global.description') }}</th>
						<td>{!! $products->description !!}</td>
					</tr>
					<tr>
						<th>{{ trans('global.category_name') }}</th>
						<td>{!! $products->category_name !!}</td>
					</tr>
					<tr>
						<th>{{ trans('global.products.fields.rate') }}</th>
						<td>{{ $products->rate }}</td>
					</tr>
					<tr>
						<th>{{ trans('global.products.fields.sale_rate') }}</th>
						<td>{{ $products->sale_rate }}</td>
					</tr>
					<tr>
						<th>{{ trans('global.products.image') }}</th>
						<td>
							@if(isset($productImg) )
							<div class = "row">
								@foreach($productImg as $image)
								<div class="col-lg-2">
									<a class="fancybox" rel="gallery1" href="{{ \URL::to($image) }}">
										<img src="{{ \URL::to($image)  }}" height="150" width="150"/>
									</a>
								</div>
								@endforeach
							</div>
							@endif
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="card-footer text-center">
			<a href="{{ route('products') }}" class="btn btn-danger ml-2">{{ trans('global.back') }}</a>
		</div>
	</div>
</div>
@endsection