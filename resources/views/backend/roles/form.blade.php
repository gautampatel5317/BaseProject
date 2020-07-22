<div class="form-group {{ $errors->has('title') ? 'has-error' : '' }}">
    <label for="title">{{ trans('global.role.fields.title') }}*</label>
    <input type="text" id="title" name="title" class="form-control" value="{{ old('title', isset($role) ? $role->title : '') }}">
    @if($errors->has('title'))
    <p class="help-block">
        {{ $errors->first('title') }}
    </p>
    @endif
    <p class="helper-block">
        {{ trans('global.role.fields.title_helper') }}
    </p>
</div>
<div class="form-group {{ $errors->has('permissions') ? 'has-error' : '' }}">
    <label for="permissions">{{ trans('global.role.fields.permissions') }}*
        <span class="btn btn-info btn-xs select-all">Select all</span>
        <span class="btn btn-info btn-xs deselect-all">Deselect all</span></label>
        <select name="permissions[]" id="permissions" class="form-control select2" multiple="multiple">
            @foreach($permissions as $id => $permissions)
            <option value="{{ $id }}" {{ (in_array($id, old('permissions', [])) || isset($role) && $role->permissions->contains($id)) ? 'selected' : '' }}>
                {{ $permissions }}
            </option>
            @endforeach
        </select>
        @if($errors->has('permissions'))
        <p class="help-block">
            {{ $errors->first('permissions') }}
        </p>
        @endif
        <p class="helper-block">
            {{ trans('global.role.fields.permissions_helper') }}
        </p>
    </div>
    <div class="card-footer text-center">
        <a href="{{ route('admin.roles.index') }}" class="btn btn-danger ml-2">Cancel</a>
         <input class="btn btn-primary" type="submit" value="{{ isset($role)  ?  trans('global.update') :trans('global.save') }}">
    </div>
<!-- JAvascript Included-->
@section('after-scripts')
<script type="text/javascript">
    $(document).ready(function(){
        Backend.Validate.Roles();
    });
</script>
@endsection