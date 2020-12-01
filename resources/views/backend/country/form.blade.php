<ul class="nav nav-tabs" id="myLanguage" role="tablist">
    @foreach(config('panel.available_languages') as $langLocale => $langName)
        <li class="nav-item">
            <a class="nav-link {{ (app()->getLocale() == $langLocale ? 'active' : '') }}" id="{{$langLocale}}-tab" data-toggle="tab" href="#{{$langLocale}}" role="tab" aria-controls="$langLocale" aria-selected="{{ (app()->getLocale() == $langLocale ? 'true' : 'false') }}">{{ $langName }}</a>
        </li>
    @endforeach
 </ul>
 <div class="tab-content" id="myLanguageContent">

    @foreach(config('panel.available_languages') as $langLocale => $langName)
        <div class="tab-pane fade {{ (app()->getLocale() == $langLocale ? 'show active' : '') }}" id="{{$langLocale}}" role="tabpanel" aria-labelledby="{{$langLocale}}-tab">
            <div class="form-group {{ $errors->has('name') ? 'has-error' : '' }}">
                <label for="name_{{$langLocale}}" class = "required">{{ trans('global.country.fields.name') }}</label>
                <input type="text" id="name_{{$langLocale}}" name="name[{{$langLocale}}]" class="form-control" value="{{ old('name[$langLocale]', isset($countryName) ? $countryName['name'][$langLocale] : '') }}" required data-msg-required="{{ trans('validation.backend.country.title')}}">
                @if($errors->has('name'))
                <p class="help-block">
                    {{ $errors->first('name['.$langLocale.']') }}
                </p>
                @endif
            </div>
        </div>
    @endforeach

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
    <a href="{{ route('admin.country.index') }}" class="btn btn-danger ml-2">{{ trans('buttons.backend.country.cancel')}}</a>
    <input class="btn btn-primary" type="submit" value="{{ isset($country)  ?  trans('buttons.backend.country.update') :trans('buttons.backend.country.save') }}">
</div>

<!-- JAvascript Included-->
@section('after-scripts')
<script type="text/javascript">
    $(document).ready(function(){
        tinymce.init({
            selector: 'textarea.description',
        });
        Backend.Validate.Country();
    });
</script>
@endsection
