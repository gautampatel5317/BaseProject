@extends('backend.layouts.admin')
@section('page-header')
{{ trans('global.qrcode') }}
@endsection
@section('content')
<div class="container-fluid">
	<div class="card card-primary card-outline">
		<div class="card-body">
			<div class="visible-print text-center">
				{!! $qrCode !!}
			</div>
		</div>
	</div>
</div>
@endsection
<!-- JAvascript Included-->
@section('after-scripts')
@endsection