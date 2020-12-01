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
                <label for="name_{{$langLocale}}" class = "required">{{ trans('global.state.fields.name') }}</label>
                <input type="text" id="name_{{$langLocale}}" name="name[{{$langLocale}}]" class="form-control" value="{{ old('name[$langLocale]', isset($stateName) ? $stateName['name'][$langLocale] : '') }}" required data-msg-required="{{ trans('validation.backend.state.title')}}">
                @if($errors->has('name'))
                <p class="help-block">
                    {{ $errors->first('name['.$langLocale.']') }}
                </p>
                @endif
            </div>
        </div>
    @endforeach

</div>
<div class="form-group {{ $errors->has('country_id') ? 'has-error' : '' }}">
    <label for="country_id" class = "required">{{ trans('global.country_name') }}</label>
    @php
        $selected_country = ( old('country_id') != "" ? old('country_id') : ( isset($state) ? $state->country_id : "") );
    @endphp
    <select name = "country_id" class="form-control select2" name="country_id">
        <option value = "">{{ trans('global.state.fields.select_country') }}</option>
        @foreach($countryData as $data)
            <option value = "{{ $data->id }}" {{ $selected_country == $data->id ? 'selected' : '' }}>{{ $data->name }}</option>
        @endforeach

    </select>
    @if($errors->has('country_id'))
    <p class="help-block">
        {{ $errors->first('country_id') }}
    </p>
    @endif
</div>

<div class="form-group">
    <label for="status">{{ trans('global.status') }}</label>
    @php
        $selected_status = ( old('status') != "" ? old('status') : (isset($state) ? $state->status : '1' )  );
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
    <a href="{{ route('admin.state.index') }}" class="btn btn-danger ml-2">{{ trans('buttons.backend.state.cancel')}}</a>
    <input class="btn btn-primary" type="submit" value="{{ isset($state)  ?  trans('buttons.backend.state.update') :trans('buttons.backend.state.save') }}">
</div>

<!-- JAvascript Included-->
@section('after-scripts')
<script type="text/javascript">
    $(document).ready(function(){
        Backend.Validate.State();
    });
</script>
@endsection
