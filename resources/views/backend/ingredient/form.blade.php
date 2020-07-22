<div class="form-group {{ $errors->has('title') ? 'has-error' : '' }}">
    <label for="title">{{ trans('global.ingredient.fields.title') }}*</label>
    <input type="text" id="title" name="title" class="form-control" value="{{ old('title', isset($ingredient) ? $ingredient->title : '') }}">
    @if($errors->has('title'))
    <p class="help-block">
        {{ $errors->first('title') }}
    </p>
    @endif
    <p class="helper-block">
        {{ trans('global.ingredient.fields.title_helper') }}
</div>

<div class="form-group">
    <label for="status">{{ trans('global.status') }}    </label>
    @php
        $selected_status = ( old('status') != "" ? old('status') : (isset($ingredient) ? $ingredient->status : '1' )  );
    @endphp
    <div class="custom-control custom-radio custom-control-inline">
        <input type="radio" id="status1" name="status" class="custom-control-input" value = "1" {{ ($selected_status == "1" ? "checked" : "") }}> 
        <label class="custom-control-label" for="status1">{{ trans('global.ingredient.fields.active')}}</label>
    </div>
    <div class="custom-control custom-radio custom-control-inline">
        <input type="radio" id="status2" name="status"class="custom-control-input" value = "0" {{ ($selected_status == "0" ? "checked" : "") }}> 
        <label class="custom-control-label" for="status2">{{ trans('global.ingredient.fields.inactive')}}</label>
    </div>
</div>
<div class="card-footer text-center">
    <a href="{{ route('admin.ingredient.index') }}" class="btn btn-danger ml-2">Cancel</a>
    <input class="btn btn-primary" type="submit" value="{{ isset($ingredient)  ?  trans('global.update') :trans('global.save') }}">
</div>

<!-- JAvascript Included-->
@section('after-scripts')
<script type="text/javascript">
    $(document).ready(function(){
        Backend.Validate.Ingredient();
    });
</script>
@endsection