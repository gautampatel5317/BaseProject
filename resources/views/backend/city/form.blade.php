<div class="form-group {{ $errors->has('name') ? 'has-error' : '' }}">
    <label for="name" class="required">{{ trans('global.city.fields.name') }}</label>
    <input type="text" id="name" name="name" class="form-control" value="{{ old('name', isset($city) ? $city->name : '') }}">
    @if($errors->has('name'))
    <p class="help-block">
        {{ $errors->first('name') }}
    </p>
    @endif
</div>

<div class="form-group {{ $errors->has('country_id') ? 'has-error' : '' }}">
    <label for="country_id" class="required">{{ trans('global.country_name') }}</label>
    @php
    $selected_country = ( old('country_id') != "" ? old('country_id') : ( isset($city) ? $city->country_id : "") );
    @endphp
    <select name="country_id" class="form-control select2" name="country_id" id="country_id">
        <option value="">{{ trans('global.state.fields.select_country') }}</option>
        @foreach($countryData as $data)
        <option value="{{ $data->id }}" {{ $selected_country == $data->id ? 'selected' : '' }}>{{ $data->name }}</option>
        @endforeach

    </select>
    @if($errors->has('country_id'))
    <p class="help-block">
        {{ $errors->first('country_id') }}
    </p>
    @endif
</div>

<div class="form-group {{ $errors->has('state_id') ? 'has-error' : '' }}">
    <label for="state_id" class="required">{{ trans('global.state_name') }}</label>
    @php
    $selected_state = ( old('state_id') != "" ? old('state_id') : ( isset($city) ? $city->state_id : "") );
    @endphp
    <select name="state_id" class="form-control select2" name="state_id" id="state_id">
        <option value="">{{ trans('global.city.fields.select_state') }}</option>
    </select>
    @if($errors->has('state_id'))
    <p class="help-block">
        {{ $errors->first('state_id') }}
    </p>
    @endif
</div>

<div class="form-group">
    <label for="status">{{ trans('global.status') }}</label>
    @php
    $selected_status = ( old('status') != "" ? old('status') : (isset($city) ? $city->status : '1' ) );
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
    <a href="{{ route('admin.city.index') }}" class="btn btn-danger ml-2">Cancel</a>
    <input class="btn btn-primary" type="submit" value="{{ isset($city)  ?  trans('global.update') :trans('global.save') }}">
</div>

<!-- JAvascript Included-->
@section('after-scripts')
<script type="text/javascript">
    $(document).ready(function() {
        Backend.Validate.City();

        $(document).on('change', '#country_id', function(e) {
            var country_id = $(this).val();
            getStates(country_id);
        });

        if ($('#country_id').val() != "") {
            getStates($('#country_id').val(), '<?php echo $selected_state;?>');
        }

        function getStates(country_id, state_id) {
            if (country_id != "") {
                $.ajax({
                    url: "{{URL('admin/city/getstates')}}",
                    type: "POST",
                    dataType: "json",
                    cache: false,
                    data: {
                        _token: '{{ csrf_token() }}',
                        'country_id': country_id,
                        'state_id': state_id,
                    },
                    success: function(dataResult) {
                        if (dataResult.success) {
                            $("#state_id").html(dataResult.html);
                        }
                    }
                });
            }
        }

    });
</script>
@endsection