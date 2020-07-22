<div class="form-group {{ $errors->has('title') ? 'has-error' : '' }}">
    <label for="title">{{ trans('global.permission.fields.title') }}*</label>
    <input type="text" id="title" name="title" class="form-control" value="{{ old('title', isset($permission) ? $permission->title : '') }}">
    @if($errors->has('title'))
    <p class="help-block">
        {{ $errors->first('title') }}
    </p>
    @endif
    <p class="helper-block">
        {{ trans('global.permission.fields.title_helper') }}
    </p>
</div>
<div class="card-footer text-center">
    <a href="{{ route('admin.permissions.index') }}" class="btn btn-danger ml-2">Cancel</a>
     <input class="btn btn-primary" type="submit" value="{{ isset($permission)  ?  trans('global.update') :trans('global.save') }}">
</div>
<!-- JAvascript Included-->
@section('after-scripts')
<script type="text/javascript">
    $(document).ready(function(){
        Backend.Validate.permissions();
    });
</script>
@endsection