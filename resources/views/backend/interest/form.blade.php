<div class="form-group {{ $errors->has('name') ? 'has-error' : '' }}">
    <label for="name" class="required">{{ trans('global.interest.fields.name') }}</label>
    <input type="text" id="name" name="name" class="form-control" value="{{ old('name', isset($interest) ? $interest->name : '') }}">
    @if($errors->has('name'))
    <p class="help-block">
        {{ $errors->first('name') }}
    </p>
    @endif
</div>

<div class="form-group">
    <label for="status">{{ trans('global.status') }}</label>
    @php
    $selected_status = ( old('status') != "" ? old('status') : (isset($interest) ? $interest->status : '1' ) );
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
    <a href="{{ route('admin.interest.index') }}" class="btn btn-danger ml-2">Cancel</a>
    <input class="btn btn-primary" type="submit" value="{{ isset($interest)  ?  trans('global.update') :trans('global.save') }}">
</div>

<!-- JAvascript Included-->
@section('after-scripts')
<script type="text/javascript">
    $(document).ready(function() {
        Backend.Validate.Interest();
    });
</script>
@endsection