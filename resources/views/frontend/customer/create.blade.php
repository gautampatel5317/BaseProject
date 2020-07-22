@extends('frontend.layouts.app')
@section('header')
@endsection
@section('conent')
<div class="container">
    <div class="row justify-content-center card card-primary card-outline">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <form method="POST" action="{{url('customer')}}" name = "customer_form" id = "customer_form">
                        @csrf
                        <div class="form-group row">
                            {{ Form::label('first_name',trans('First Name'), ['for' => 'first_name','class' => 'col-lg-2 control-label text-md-right required']) }}
                            <div class="col-lg-10">
                                {{ Form::text('first_name', null, ['id' => 'first_name','class' => 'form-control box-size', 'placeholder' => trans('First Name'), 'required' => 'required']) }}
                                @error('first_name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                        <div class="form-group row">
                             {{ Form::label('family_name',trans('Family Name'), ['for' => 'family_name','class' => 'col-lg-2 control-label text-md-right required']) }}
                            <div class="col-lg-10">
                                 {{ Form::text('family_name', null, ['id' => 'family_name','class' => 'form-control box-size', 'placeholder' => trans('Family Name'), 'required' => 'required']) }}
                                @error('family_name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                        <div class="form-group row">
                            {{ Form::label('email',trans('E-Mail Address'), ['for' => 'email','class' => 'col-lg-2 control-label text-md-right required']) }}
                            <div class="col-lg-10">
                                 {{ Form::email('email', null, ['id' => 'email','class' => 'form-control box-size', 'placeholder' => trans('E-Mail Address'), 'required' => 'required']) }}
                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                        <div class="form-group row">
                            {{ Form::label('password',trans('Password'), ['for' => 'email','class' => 'col-lg-2 control-label text-md-right required']) }}
                            <div class="col-lg-10">
                                 <input type="password" class="form-control box-size @error('password') is-invalid @enderror" placeholder="{{ trans('global.login_password') }}" name="password">
                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                        <div class="form-group row">
                            {{ Form::label('experience',trans('Experience'), ['for' => 'experience','class' => 'col-lg-2 control-label text-md-right required']) }}
                            <div class="col-lg-10">
                                {!! Form::select('experience',$experience,null,['class' => 'select2 form-control box-size']) !!}
                                @error('experience')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                        <div class="form-group row">
                            {{ Form::label('business',trans('Business'), ['for' => 'experience','class' => 'col-lg-2 control-label text-md-right required']) }}
                            @php
                                $business = [
                                    '1 to 3 months' => '1 to 3 months',
                                    '3 to 6 months' => '3 to 6 months',
                                    '6 to 12 months' => '6 to 12 months',
                                    '1 year +' => '1 year +',
                                    '2 year +' => '2 year +',
                                    '3 year +' => '3 year +',
                                    'Over 3 years' => 'Over 3 years'
                                ];
                            @endphp
                            <div class="col-lg-10">
                             {!! Form::select('business',$business,null,['class' => 'select2 form-control box-size']) !!}
                                @error('business')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                        <div class="form-group row mb-0">
                            <div class="col-md-4 col-form-label"></div>
                            <div class="col-md-8">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Register') }}
                                </button>
                                <a class = "btn btn-danger" href = "{{ route('customer.index') }}">{{ __('Back') }}</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section('script')
<script>
$(document).ready(function () {
    $('.select2').select2();
    $('#customer_form').validate({ // initialize the plugin
        errorClass: 'is-invalid',
        highlight: function (element, errorClass, validClass) {
               var elem = $(element);
               if (elem.hasClass("select2-hidden-accessible")) {
                   $("#select2-" + elem.attr("id") + "-container").parent().addClass(errorClass);
               } else {
                   elem.addClass(errorClass);
               }
            },
        unhighlight: function (element, errorClass, validClass) {
                var elem = $(element);
                if (elem.hasClass("select2-hidden-accessible")) {
                    $("#select2-" + elem.attr("id") + "-container").parent().removeClass(errorClass);
                } else {
                    elem.removeClass(errorClass);
                }
            },
        errorPlacement: function (error, element) {
               error.addClass('invalid-feedback');
              element.closest('.form-group').append(error);
               var elem = $(element);
               if (elem.hasClass("select2-hidden-accessible")) {
                   element = $("#select2-" + elem.attr("id") + "-container").parent();
                   error.insertAfter(element);
               } else if(elem.hasClass("multiple_input")){
                   element = $("#" + elem.attr("id"));
                   error.insertAfter(element);
               }else if (element.hasClass("file")) {
                    //error.insertAfter(element.siblings(".note-editor"));
                    element.closest('.form-group').append(error);
               }else if (element.hasClass("summernote")) {
                    error.insertAfter(element.siblings(".note-editor"));
               }else {
                   error.insertAfter(element);
               }
            },
        rules: {
            first_name: {
                required: true
            },
            family_name: {
                required: true
            },
            email: {
                required: true,
                email: true
            },
             password: {
                required: true,
            },
            experience: {
                required: true
            },
            business: {
                required: true
            },
        },
        messages: {
            first_name: 'The first name field is required.',
            family_name: 'The family name field is required.',
            email: 'The email field is required!',
            password: 'The password field is required!',
            experience:'The experience field is required!',
            business: 'The business field is required!'
        }
    });
});
</script>
@endsection
