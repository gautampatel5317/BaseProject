@if(isset($customer))
    <div class="form-group">
        <label for="name">{{ trans('global.customer.fields.name') }}</label>
        <div class="input-group-">
            <span class="input-group-text" id="basic-addon3">{{ $customer->name }}</span>
        </div>
    </div>
@else
    <div class="form-group {{ $errors->has('first_name') ? 'has-error' : '' }}">
        <label for="first_name" class = "required">{{ trans('global.customer.fields.name') }}</label>
        <input type="text" id="first_name" name="first_name" class="form-control" value="{{ old('first_name', isset($customer) ? $customer->first_name : '') }}">
        @if($errors->has('first_name'))
        <p class="help-block">
            {{ $errors->first('first_name') }}
        </p>
        @endif
        <p class="helper-block">{{ trans('global.customer.fields.name_helper') }}</p>
    </div>
@endif

<div class="form-group {{ $errors->has('family_name') ? 'has-error' : '' }}">
    <label for="family_name" class = "required">{{ trans('global.customer.fields.family_name') }}</label>
    <input type="text" id="family_name" name="family_name" class="form-control" value="{{ old('family_name', isset($customer) ? $customer->family_name : '') }}">
    @if($errors->has('family_name'))
    <p class="help-block">
        {{ $errors->first('family_name') }}
    </p>
    @endif
    <p class="helper-block">
        {{ trans('global.customer.fields.family_name_helper') }}
    </p>
</div>

@if(isset($customer))
    <div class="form-group">
        <label for="email">{{ trans('global.customer.fields.email') }}</label>
        <div class="input-group-">
            <span class="input-group-text" id="basic-addon3">{{ $customer->email }}</span>
        </div>
    </div>
@else
    <div class="form-group {{ $errors->has('email') ? 'has-error' : '' }}">
        <label for="email" class = "required">{{ trans('global.customer.fields.email') }}</label>
        <input type="text" id="email" name="email" class="form-control" value="{{ old('email') }}">
        @if($errors->has('email'))
        <p class="help-block">
            {{ $errors->first('email') }}
        </p>
        @endif
        <p class="helper-block">
            {{ trans('global.customer.fields.email_helper') }}
        </p>
    </div>
@endif

<div class="form-group {{ $errors->has('experience') ? 'has-error' : '' }}">
    <label for="experience" class = "required">{{ trans('global.customer.fields.experience') }}</label>
    @php
        $selected_experience = ( old('experience') != "" ? old('experience') : ( isset($customer) ? $customer->experience : "") );
    @endphp
    <select name = "experience" class="form-control select2" name="experience">
        <option value = "">{{ trans('global.customer.fields.select_experience') }}</option>
        @if($experienceData)
            @foreach ($experienceData as $experience)
                <option value = "{{ $experience['id'] }}" {{ $selected_experience == $experience['id'] ? 'selected' : '' }}>{{ $experience['name'] }}</option>
            @endforeach
        @endif
    </select>
    @if($errors->has('experience'))
    <p class="help-block">
        {{ $errors->first('experience') }}
    </p>
    @endif
    <p class="helper-block">
        {{ trans('global.customer.fields.experience_helper') }}
    </p>
</div>

<div class="form-group {{ $errors->has('business') ? 'has-error' : '' }}">
    <label for="business" class = "required">{{ trans('global.customer.fields.business') }}</label>
    @php
        $selected_business = ( old('business') != "" ? old('business') : ( isset($customer) ? $customer->business : "") );
    @endphp
    <select name = "business" class="form-control select2" name="business">
        <option value = "">{{ trans('global.customer.fields.select_business') }}</option>
        <option value = "1 to 3 months" {{ $selected_business == '1 to 3 months' ? 'selected' : '' }}>{{ __('1 to 3 months') }}</option>
        <option value = "3 to 6 months" {{ $selected_business == '3 to 6 months' ? 'selected' : '' }}>{{ __('3 to 6 months') }}</option>
        <option value = "6 to 12 months" {{ $selected_business == '6 to 12 months' ? 'selected' : '' }}>{{ __('6 to 12 months') }}</option>
        <option value = "1 year +" {{ $selected_business == '1 year +' ? 'selected' : '' }}>{{ __('1 year +') }}</option>
        <option value = "2 year +" {{ $selected_business == '2 year +' ? 'selected' : '' }}>{{ __('2 year +') }}</option>
        <option value = "3 year +" {{ $selected_business == '3 year +' ? 'selected' : '' }}>{{ __('3 year +') }}</option>
        <option value = "Over 3 years" {{ $selected_business == 'Over 3 years' ? 'selected' : '' }}>{{ __('Over 3 years') }}</option>
    </select>
    @if($errors->has('business'))
    <p class="help-block">
        {{ $errors->first('business') }}
    </p>
    @endif
    <p class="helper-block">
        {{ trans('global.customer.fields.business_helper') }}
    </p>
</div>

<div class="form-group">
    <label for="status">{{ trans('global.status') }}</label>
    @php
        $selected_status = ( old('status') != "" ? old('status') : (isset($customer) ? $customer->status : '1' )  );
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

<div class = "form-group">
    @php
        $selected_confirmed = ( old('confirmed') != "" ? old('confirmed') : (isset($customer) ? $customer->confirmed : '' ) );
    @endphp
    <label for="confirmed">{{ trans('global.customer.fields.confirmed') }}</label>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" name = "confirmed" id="confirmed" value="1" {{ ($selected_confirmed == "1" ? "checked disabled" : "") }}>
    </div>
</div>
<div class="card-footer text-center">
    <a href="{{ route('admin.customers.index') }}" class="btn btn-danger ml-2">Cancel</a>
    <input class="btn btn-primary" type="submit" value="{{ isset($customer)  ?  trans('global.update') :trans('global.save') }}">
</div>

<!-- JAvascript Included-->
@section('after-scripts')
<script type="text/javascript">
    $(document).ready(function(){
        Backend.Validate.Customers();
    });
</script>
@endsection