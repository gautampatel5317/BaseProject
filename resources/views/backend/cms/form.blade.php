<div class="form-group {{ $errors->has('title') ? 'has-error' : '' }}">
    <label for="title" class = "required">{{ trans('global.title') }}</label>
    <input type="text" id="title" name="title" class="form-control" value="{{ old('title', isset($cms) ? $cms->title : '') }}">
    @if($errors->has('title'))
    <p class="help-block">
        {{ $errors->first('title') }}
    </p>
    @endif
</div>
<div class="form-group {{ $errors->has('description') ? 'has-error' : '' }}">
    <label for="description" class = "required">{{ trans('global.description') }}</label>
    <textarea id="description" name="description" class="form-control ckeditor">{{ old('description', isset($cms) ? $cms->description : '') }}</textarea>
    @if($errors->has('description'))
    <p class="help-block">
        {{ $errors->first('description') }}
    </p>
    @endif
</div>

<div class="form-group {{ $errors->has('cannonical_link') ? 'has-error' : '' }}">
    <label for="cannonical_link">{{ trans('global.cms.fields.cannonical_link') }}</label>
    <input type="text" id="cannonical_link" name="cannonical_link" class="form-control" value="{{ old('cannonical_link', isset($cms) ? $cms->cannonical_link : '') }}">
    @if($errors->has('cannonical_link'))
    <p class="help-block">
        {{ $errors->first('cannonical_link') }}
    </p>
    @endif
</div>

<div class="form-group {{ $errors->has('seo_title') ? 'has-error' : '' }}">
    <label for="seo_title">{{ trans('global.cms.fields.seo_title') }}</label>
    <input type="text" id="seo_title" name="seo_title" class="form-control" value="{{ old('seo_title', isset($cms) ? $cms->seo_title : '') }}">
    @if($errors->has('seo_title'))
    <p class="help-block">
        {{ $errors->first('seo_title') }}
    </p>
    @endif
</div>

<div class="form-group {{ $errors->has('seo_keyword') ? 'has-error' : '' }}">
    <label for="seo_keyword">{{ trans('global.cms.fields.seo_keyword') }}</label>
    <input type="text" id="seo_keyword" name="seo_keyword" class="form-control" value="{{ old('seo_keyword', isset($cms) ? $cms->seo_keyword : '') }}">
    @if($errors->has('seo_keyword'))
    <p class="help-block">
        {{ $errors->first('seo_keyword') }}
    </p>
    @endif
</div>

<div class="form-group {{ $errors->has('seo_description') ? 'has-error' : '' }}">
    <label for="seo_description">{{ trans('global.cms.fields.seo_description') }}</label>
    <textarea id="seo_description" name="seo_description" class="form-control ckeditor1">{{ old('seo_description', isset($cms) ? $cms->seo_description : '') }}</textarea>
    @if($errors->has('seo_description'))
    <p class="help-block">
        {{ $errors->first('seo_description') }}
    </p>
    @endif
</div>

<div class = "form-group">
    @php
        $selected_status = ( old('status') != "" ? old('status') : (isset($cms) ? $cms->status : '1' )  );
    @endphp
    <label for="status">{{ trans('global.status') }}</label>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" name = "status" id="status" value="1" {{ ($selected_status == "1" ? "checked" : "") }}>
    </div>
</div>

<div class="card-footer text-center">
    <a href="{{ route('admin.customers.index') }}" class="btn btn-danger ml-2">Cancel</a>
    <input class="btn btn-primary" type="submit" value="{{ isset($cms)  ?  trans('global.update') :trans('global.save') }}">
</div>

<!-- JAvascript Included-->
@section('after-scripts')
<script type="text/javascript">
    $(document).ready(function(){
        Backend.Validate.Cms();
        ClassicEditor.create(document.querySelector('.ckeditor1'));
    });
</script>

@endsection