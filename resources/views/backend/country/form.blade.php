<div class="form-group {{ $errors->has('name') ? 'has-error' : '' }}">
    <label for="name" class = "required">{{ trans('global.country.fields.name') }}</label>
    <input type="text" id="name" name="name" class="form-control" value="{{ old('name', isset($country) ? $country->name : '') }}">
    @if($errors->has('name'))
    <p class="help-block">
        {{ $errors->first('name') }}
    </p>
    @endif
</div>
<div class="form-group {{ $errors->has('code') ? 'has-error' : '' }}">
    <label for="code" class = "required">{{ trans('global.country.fields.code') }}</label>
    <input type="text" id="code" name="code" class="form-control" value="{{ old('code', isset($country) ? $country->code : '') }}">
    @if($errors->has('code'))
    <p class="help-block">
        {{ $errors->first('code') }}
    </p>
    @endif
</div>

<div class="form-group {{ $errors->has('phonecode') ? 'has-error' : '' }}">
    <label for="phonecode" class = "required">{{ trans('global.country.fields.phonecode') }}</label>
    <input type="text" id="phonecode" name="phonecode" class="form-control" value="{{ old('phonecode', isset($country) ? $country->phonecode : '') }}">
    @if($errors->has('phonecode'))
    <p class="help-block">
        {{ $errors->first('phonecode') }}
    </p>
    @endif
</div>
<div class="form-group">
    <label for="status">{{ trans('global.status') }}    </label>
    @php
        $selected_status = ( old('status') != "" ? old('status') : (isset($country) ? $country->status : '1' )  );
    @endphp
    <div class="custom-control custom-radio custom-control-inline">
        <input type="radio" id="status1" name="status" class="custom-control-input" value = "1" {{ ($selected_status == "1" ? "checked" : "") }}> 
        <label class="custom-control-label" for="status1">{{ trans('global.active')}}</label>
    </div>
    <div class="custom-control custom-radio custom-control-inline">
        <input type="radio" id="status2" name="status"class="custom-control-input" value = "0" {{ ($selected_status == "0" ? "checked" : "") }}> 
        <label class="custom-control-label" for="status2">{{ trans('global.inactive')}}</label>
    </div>
</div>

<div class="card-footer text-center">
    <a href="{{ route('admin.country.index') }}" class="btn btn-danger ml-2">Cancel</a>
    <input class="btn btn-primary" type="submit" value="{{ isset($country)  ?  trans('global.update') :trans('global.save') }}">
</div>

<!-- JAvascript Included-->
@section('after-scripts')
<script type="text/javascript">
    $(document).ready(function(){
        Backend.Validate.Country();
    });
</script>
@endsection