@extends('frontend.main')
@section('content')
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-8">
			<div class="card">
				<div class="card-header">{{ __('Register') }}</div>
				<div class="card-body">
					  {!! Form::model(null, ['autocomplete' => 'off','id' => 'registerform','url' => route('registration'),'enctype'=> 'multipart/form-data','class'=>'form-validate-jquery']) !!}

					<div class="form-group row">
						{{ Form::label('', trans(''), ['class' => 'col-md-4 col-form-label text-md-right']) }}
						<div class="col-md-6">
							<input type="radio" class="type" name="type" value="0" checked="checked">Seller
							<input type="radio" class="type" name="type" value="1">Customer
						</div>
					</div>
					<div class="seller">
						<div class="form-group row">
							{{ Form::label('email', trans('Email Address').'*', ['class' => 'col-md-4 col-form-label text-md-right']) }}
							<div class="col-md-6">
								{{ Form::input('email', 'email', null, ['class' => 'form-control', 'placeholder' => trans('Email Address')]) }}
							</div>
						</div>
						<div class="form-group row">
							{{ Form::label('password', trans('Password').'*', ['class' => 'col-md-4 col-form-label text-md-right']) }}
							<div class="col-md-6">
								{{ Form::input('password', 'password', null, ['class' => 'form-control', 'placeholder' => trans('Password')]) }}
							</div>
						</div>
						<div class="form-group row">
							{{ Form::label('first_name', trans('First Name').'*', ['class' => 'col-md-4 col-form-label text-md-right']) }}
							<div class="col-md-6">
								{{ Form::input('first_name', 'first_name', null, ['id' => 'first_name','class' => 'form-control', 'placeholder' => trans('First Name')]) }}
							</div>
						</div>
						<div class="form-group row">
							{{ Form::label('last_name', trans('Last Name').'*', ['class' => 'col-md-4 col-form-label text-md-right']) }}
							<div class="col-md-6">
								{{ Form::input('last_name', 'last_name', null, ['class' => 'form-control', 'placeholder' => trans('Last Name')]) }}
							</div>
						</div>
						<div class="form-group row">
							{{ Form::label('shop_name', trans('Shop Name').'*', ['class' => 'col-md-4 col-form-label text-md-right']) }}
							<div class="col-md-6">
								{{ Form::input('shop_name', 'shop_name', null, ['class' => 'form-control', 'placeholder' => trans('Shop Name')]) }}
							</div>
						</div>
						<div class="form-group row">
							{{ Form::label('shop_url', trans('Shop Url').'*', ['class' => 'col-md-4 col-form-label text-md-right']) }}
							<div class="col-md-6">
								{{ Form::input('shop_url', 'shop_url', null, ['class' => 'form-control', 'placeholder' => trans('Shop Url')]) }}
							</div>
						</div>
						<div class="form-group row">
							{{ Form::label('phone_number', trans('Phone Number').'*', ['class' => 'col-md-4 col-form-label text-md-right']) }}
							<div class="col-md-6">
								{{ Form::input('phone_number', 'phone_number', null, ['class' => 'form-control', 'placeholder' => trans('Phone Number')]) }}
							</div>
						</div>
					</div>
					<div class="customer">
						<div class="form-group row">
							{{ Form::label('email', trans('Email Address').'*', ['class' => 'col-md-4 col-form-label text-md-right']) }}
							<div class="col-md-6">
								{{ Form::input('email', 'email', null, ['class' => 'form-control', 'placeholder' => trans('Email Address')]) }}
							</div>
						</div>
						<div class="form-group row">
							{{ Form::label('password', trans('Password').'*', ['class' => 'col-md-4 col-form-label text-md-right']) }}
							<div class="col-md-6">
								{{ Form::input('password', 'password', null, ['class' => 'form-control', 'placeholder' => trans('Password')]) }}
							</div>
						</div>
						<div class="form-group row">
							{{ Form::label('first_name', trans('First Name').'*', ['class' => 'col-md-4 col-form-label text-md-right']) }}
							<div class="col-md-6">
								{{ Form::input('first_name', 'first_name', null, ['class' => 'form-control', 'placeholder' => trans('First Name')]) }}
							</div>
						</div>
						<div class="form-group row">
							{{ Form::label('last_name', trans('Last Name').'*', ['class' => 'col-md-4 col-form-label text-md-right']) }}
							<div class="col-md-6">
								{{ Form::input('last_name', 'last_name', null, ['class' => 'form-control', 'placeholder' => trans('Last Name')]) }}
							</div>
						</div>
					</div>
					<div class="form-group row mb-0">
						<div class="col-md-6 offset-md-4">
							{{ Form::submit(trans('Register'), ['class' => 'btn btn-primary']) }}
						</div>
					</div>
					{{ Form::close() }}
				</div>
			</div>
		</div>
	</div>
</div>
@endsection
@section('scripts')
<script type="text/javascript">
	$(document).ready(function(){
	$.validator.addMethod('requiredNotBlank', function(value, element) {
    		return $.validator.methods.required.call(this, $.trim(value), element);
		},'This field is required!');
		$('#registerform').validate({
			rules:{
				 email: {
                    required: true,
                    email: true,
                },
                 password: {
                    required: true,
                },
                 first_name:{
                    requiredNotBlank: true,
                },
                last_name: {
                    requiredNotBlank:true,
                },
                shop_name: {
                     requiredNotBlank:true,
                },
                shop_url: {
                     requiredNotBlank:true,
                },
                phone_number: {
                    requiredNotBlank: true,
                },
			}
		});
		var type =  $("input[type=radio][name='type']:checked").val()
		if(type ==0) {
			$('.seller').show();
			$('.customer').hide();
		} else {
			$('.customer').show();
			$('.seller').hide();
		}
		$(document).on("change",".type",function(){
		if($(this).val()==0) {
			$('.seller').show();
			$('.customer').hide();
		} else {
			$('.customer').show();
			$('.seller').hide();
		}
	});
	});
</script>
@endsection