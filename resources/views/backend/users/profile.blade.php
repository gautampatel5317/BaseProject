@extends('backend.layouts.admin')
@section('page-header')
{{ trans('global.change_password') }}
@endsection
@section('content')
<div class="container-fluid">
    @include('flash::message')
    <div class="card card-primary card-outline">
        <div class="card-body">
        {!! Form::model(null, ['id' => 'create-from','url' => route('admin.users.changeProfile'),'enctype'=> 'multipart/form-data','class'=>'form-validate-jquery']) !!}
            @csrf
            <div class="form-group {{ $errors->has('name') ? 'has-error' : '' }}">
                <label for="name">{{ trans('global.user.fields.name') }}*</label>
                <input type="text" id="name" name="name" class="form-control" value="{{ old('name', isset($user) ? $user->name : '') }}">
                @if($errors->has('name'))
                <p class="help-block">
                    {{ $errors->first('name') }}
                </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.user.fields.name_helper') }}
                </p>
            </div>

            <div class="form-group{{ $errors->has('current_password') ? ' has-error' : '' }}">
                <label for="new-password">{{ trans('global.current_password') }}*</label>
                <input id="current_password" type="password" class="form-control" name="current_password" >
                @if ($errors->has('current_password'))
                    <p class="help-block">
                    {{ $errors->first('current_password') }}
                    </p>
                @endif
            </div>

            <div class="form-group{{ $errors->has('new_password') ? ' has-error' : '' }}">
                <label for="new_password">{{ trans('global.new_password') }}*</label>
                <input id="new_password" type="password" class="form-control" name="new_password" >
                @if ($errors->has('new_password'))
                    <p class="help-block">
                        {{ $errors->first('new_password') }}
                    </p>
                @endif
            </div>

            <div class="form-group">
                <label for="new_password-confirm">{{ trans('global.confirm_password') }}</label>
                <input id="new_password-confirm" type="password" class="form-control" name="new_password_confirmation" >
            </div>

            <div class="card-footer text-center">
                <a href="{{ route('admin.users.profile') }}" class="btn btn-danger ml-2">Cancel</a>
                <input class="btn btn-primary" type="submit" value="{{ trans('global.save') }}">
            </div>
        {{ Form::close() }}
        </div>
    </div>
</div>
<!-- JAvascript Included-->
@section('after-scripts')
<script type="text/javascript">
    $(document).ready(function(){
        Backend.Validate.Profile();
    });
</script>
@endsection

@endsection