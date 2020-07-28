<div class="form-group {{ $errors->has('email') ? 'has-error' : '' }}">
    <label for="email" class="required">{{ trans('global.email') }}</label>
    <input type="text" id="email" name="email" class="form-control" value="{{ old('email', isset($buyer) ? $buyer->email : '') }}">
    @if($errors->has('email'))
    <p class="error-block">
        {{ $errors->first('email') }}
    </p>
    @endif
</div>
<div class="form-group {{ $errors->has('password') ? 'has-error' : '' }}">
    <label for="password" class="required">{{ trans('global.user.fields.password') }}</label>
    <input type="password" autocomplete="off" id="password" name="password" class="form-control">
    @if($errors->has('password'))
    <p class="error-block">
        {{ $errors->first('password') }}
    </p>
    @endif
    <p class="helper-block">
        {{ trans('global.user.fields.password_helper') }}
    </p>
</div>

<div class="form-group {{ $errors->has('first_name') ? 'has-error' : '' }}">
    <label for="first_name" class="required">{{ trans('global.first_name') }}</label>
    <input type="text" id="first_name" name="first_name" class="form-control" value="{{ old('first_name', isset($buyer) ? $buyer->first_name : '') }}">
    @if($errors->has('first_name'))
    <p class="error-block">
        {{ $errors->first('first_name') }}
    </p>
    @endif
</div>

<div class="form-group {{ $errors->has('last_name') ? 'has-error' : '' }}">
    <label for="last_name" class="required">{{ trans('global.last_name') }}</label>
    <input type="text" id="last_name" name="last_name" class="form-control" value="{{ old('last_name', isset($buyer) ? $buyer->last_name : '') }}">
    @if($errors->has('last_name'))
    <p class="error-block">
        {{ $errors->first('last_name') }}
    </p>
    @endif
</div>

<div class="form-group">
    <label for="status">{{ trans('global.status') }}</label>
    @php
    $selected_status = ( old('status') != "" ? old('status') : (isset($buyer) ? $buyer->status : '1' ) );
    @endphp
    <div class="custom-control custom-radio custom-control-inline">
        <input type="radio" id="status1" name="status" class="custom-control-input" value="1" {{ ($selected_status == "1" ? "checked" : "") }}>
        <label class="custom-control-label" for="status1">{{ trans('global.active')}}</label>
    </div>
    <div class="custom-control custom-radio custom-control-inline">
        <input type="radio" id="status2" name="status" class="custom-control-input" value="0" {{ ($selected_status == "0" ? "checked" : "") }}>
        <label class="custom-control-label" for="status2">{{ trans('global.inactive')}}</label>
    </div>
</div>

<div class="card-footer text-center">
    <a href="{{ route('admin.buyer.index') }}" class="btn btn-danger ml-2">{{ trans('global.cancel') }}</a>
    <input class="btn btn-primary" type="submit" value="{{ isset($buyer)  ?  trans('global.update') :trans('global.save') }}">
</div>

<!-- JAvascript Included-->
@section('after-scripts')
<script type="text/javascript">
    $(document).ready(function() {
        Backend.Validate.Buyer();
    });
</script>
@endsection