@extends('frontend.layouts.app')
@section('header')
@endsection
@section('conent')
<div class="container">
@include('flash::message')
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="card">
                {{-- <div class="card-header">{{ __('Signup Customer') }}</div> --}}
                @if($message = Session::get('success'))
                        <br />
                        <div class="alert alert-success">
                            <p>{{$message}}</p>
                        </div>
                    @endif
                <div class="card-body">
                    {{-- <a href="{{ route('customer.create') }}" class="btn btn-primary my-2">{{ __('Signup Customer') }}</a> --}}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section('script')
@endsection

