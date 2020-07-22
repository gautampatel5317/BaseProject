@extends('backend.layouts.admin')
@section('page-header')
{{ trans('global.edit') }} {{ trans('global.email_template.title_singular') }}
@endsection
@section('content')
<div class="container-fluid">
	@include('flash::message')
	<div class="card card-primary card-outline">
		<div class="card-body">
			{!! Form::model($emailtemplate, ['url' => route('admin.emailtemplates.update',$emailtemplate->id),'enctype'=> 'multipart/form-data','method'=>'PUT','class'=>'form-validate-jquery']) !!}
			<div class="form-group">
				{{ Form::label('title',trans('global.email_template.tables.title'), ['for' => 'title','class' => 'col-lg-2 control-label required']) }}
				<div class="col-lg-10">
					{{ Form::text('title', null, ['class' => 'form-control box-size', 'placeholder' => trans('global.email_template.tables.title'), 'required' => 'required']) }}
				</div>
			</div>
			<div class="form-group">
				{{ Form::label('type_id', trans('global.email_template.type'), ['class' => 'col-lg-2 control-label required']) }}
				<div class="col-lg-10">
					{{ Form::select('type_id', $emailtemplatetypes, null,['class' => 'form-control select2 box-size', 'placeholder' => trans('global.email_template.type'), 'required' => 'required']) }}
					</div><!--col-lg-10-->
				</div>
				<div class="form-group">
					{{ Form::label('placeholder', trans('global.email_template.placeholder'), ['class' => 'col-lg-2 control-label']) }}
					<div class="col-lg-10">
						{{ Form::select('placeholder', $emailtemplateplaceholders, null,['class' => 'form-control select2', 'placeholder' => trans('global.email_template.placeholder'), 'id' => 'placeHolder', 'style' => 'width:100%']) }}
					</div>
				</div>
				<div class="form-group">
					{{ Form::label('subject', trans('global.email_template.tables.subject'), ['class' => 'col-lg-2 control-label required']) }}
					<div class="col-lg-10">
						{{ Form::text('subject', null, ['class' => 'form-control box-size', 'placeholder' => trans('global.email_template.tables.subject')]) }}
					</div>
				</div>
				<div class="form-group">
					{{ Form::label('body', trans('global.email_template.tables.body'), ['class' => 'col-lg-2 control-label required']) }}
					<div class="col-lg-10 mce-box">
						{{ Form::textarea('body', null,['class' => 'form-control ckeditor1', 'placeholder' => trans('global.email_template.tables.body'), 'id' => 'editor']) }}
						</div><!--col-lg-3-->
					</div>
					 <div class="form-group">
                    	{{ Form::label('is_active', trans('global.email_template.tables.status'), ['class' => 'col-lg-2 control-label d-flex']) }}
                    		<div class="col-lg-10">
                    			 <div class="custom-control custom-checkbox">
                    			 	{{ Form::checkbox('is_active', 1, ($emailtemplate->status == 1) ? true : false ),['id'=>'status','class' => 'custom-control-input'] }}
                    			 	 {{-- <label for="status" class="custom-control-label"></label> --}}
                    			 </div>

                    		</div>
                		</div>
                		 <div class="card-footer text-center">
        						<a href="{{ route('admin.emailtemplates.index') }}" class="btn btn-danger ml-2">Cancel</a>
         							<input class="btn btn-primary" type="submit" value="{{trans('global.update')}}">
    							</div>
					{!! Form::close() !!}
				</div>
			</div>
		</div>
		@endsection
<!-- JAvascript Included-->
@section('after-scripts')
<script type="text/javascript">
	 jQuery(document).ready(function(){
	 	ClassicEditor.create(document.querySelector('.ckeditor1'));
	 });
</script>
@endsection