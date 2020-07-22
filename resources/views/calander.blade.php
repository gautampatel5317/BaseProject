@extends('backend.layouts.admin')
@section('page-header')
{{ trans('global.calender_anagement') }}
@endsection
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/1.6.0/fullcalendar.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/daygrid/main.min.js">
@section('content')
<div class="container-fluid">
	<div class="card card-primary card-outline">
		<div class="card-body">
				{!! $calendar->calendar() !!}
		</div>
	</div>
</div>
@endsection
<!-- JAvascript Included-->
@section('after-scripts')
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/1.6.0/fullcalendar.min.js'></script>
{!! $calendar->script() !!}
@endsection