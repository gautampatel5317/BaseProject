<div class="form-group {{ $errors->has('title') ? 'has-error' : '' }}">
    <label for="title" class="required">{{ trans('global.title') }}</label>
    <input type="text" id="title" name="title" class="form-control" value="{{ old('title', isset($products) ? $products->title : '') }}">
    @if($errors->has('title'))
    <p class="error-block">
        {{ $errors->first('title') }}
    </p>
    @endif
</div>
<div class="form-group {{ $errors->has('description') ? 'has-error' : '' }}">
    <label for="description" class="required">{{ trans('global.description') }}</label>
    <textarea id="description" name="description" class="form-control ckeditor">{{ old('description', isset($products) ? $products->description : '') }}</textarea>
    @if($errors->has('description'))
    <p class="help-block">
        {{ $errors->first('description') }}
    </p>
    @endif
</div>
<div class="form-group {{ $errors->has('title') ? 'has-error' : '' }}">
    <label for="image">{{ trans('global.products.image') }}</label>
    <div class="col-lg-10">
        <input type="file" class="form-control" name="image[]" id="files" multiple />
        <label for="image">
            <i class="fa fa-upload"></i>
            <span>{{ trans('global.setting.choose_file') }}</span>
        </label>
        <div class="img-remove-image">
            @if(isset($productImg) )
            <div class="row">
                @foreach($productImg as $image)
                <img class="col-lg-2 product_images" height="100" width="100" src="{{ URL::to($image) }}">
                @endforeach
            </div>
            @endif
        </div>
    </div>
    @if($errors->has('image'))
    <p class="error-block">
        {{ $errors->first('image') }}
    </p>
    @endif
</div>
<div class="form-group {{ $errors->has('category_id') ? 'has-error' : '' }}">
    <label for="category_id" class="required">{{ trans('global.category_name') }}</label>
    @php
    $selected_category = ( old('category_id') != "" ? old('category_id') : ( isset($products) ? $products->category_id : "") );
    @endphp
    <select name="category_id" class="form-control select2" name="category_id">
        <option value="">{{ trans('global.select_category') }}</option>
        @foreach($categoryData as $data)
        <option value="{{ $data->id }}" {{ $selected_category == $data->id ? 'selected' : '' }}>{{ $data->name }}</option>
        @endforeach
    </select>
    @if($errors->has('category_id'))
    <p class="help-block">
        {{ $errors->first('category_id') }}
    </p>
    @endif
</div>
<div class="form-group {{ $errors->has('rate') ? 'has-error' : '' }}">
    <label for="rate" class="required">{{ trans('global.products.fields.rate') }}</label>
    <input type="text" name="rate" id="rate" rate="rate" class="form-control" value="{{ old('rate', isset($products) ? $products->rate : '') }}">
    @if($errors->has('rate'))
    <p class="help-block">
        {{ $errors->first('rate') }}
    </p>
    @endif
</div>
<div class="form-group {{ $errors->has('sale_rate') ? 'has-error' : '' }}">
    <label for="sale_rate" class="required">{{ trans('global.products.fields.sale_rate') }}</label>
    <input type="text" name="sale_rate" id="sale_rate" sale_rate="sale_rate" class="form-control" value="{{ old('sale_rate', isset($products) ? $products->sale_rate : '') }}">
    @if($errors->has('sale_rate'))
    <p class="help-block">
        {{ $errors->first('sale_rate') }}
    </p>
    @endif
</div>
<div class="form-group">
    <label for="status">{{ trans('global.status') }}</label>
    @php
    $selected_status = ( old('status') != "" ? old('status') : (isset($products) ? $products->status : '1' ) );
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
    <a href="{{ route('products') }}" class="btn btn-danger ml-2">Cancel</a>
    <input class="btn btn-primary" type="submit" value="{{ isset($products)  ?  trans('global.update') :trans('global.save') }}">
</div>
<!-- JAvascript Included-->