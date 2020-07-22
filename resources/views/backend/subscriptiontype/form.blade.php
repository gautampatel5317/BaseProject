<div class="form-group {{ $errors->has('type') ? 'has-error' : '' }}">
    <label for="type" class = "required">{{ trans('global.subscriptiontype.fields.type') }}</label>
    <input type="text" id="type" name="type" class="form-control" value="{{ old('type', isset($subscriptiontype) ? $subscriptiontype->type : '') }}">
    @if($errors->has('type'))
    <p class="help-block">
        {{ $errors->first('type') }}
    </p>
    @endif
</div>

<div class="form-group">
    <label for="status">{{ trans('global.status') }}    </label>
    @php
        $selected_status = ( old('status') != "" ? old('status') : (isset($subscriptiontype) ? $subscriptiontype->status : '1' )  );
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
    <a href="{{ route('admin.subscriptiontype.index') }}" class="btn btn-danger ml-2">{{ trans('global.cancel') }}</a>
    <input class="btn btn-primary" type="submit" value="{{ isset($subscriptiontype)  ?  trans('global.update') :trans('global.save') }}">
</div>

<!-- JAvascript Included-->
@section('after-scripts')
<script type="text/javascript">
    $(document).ready(function(){
        Backend.Validate.SubscriptionType();
    });
</script>
@endsection