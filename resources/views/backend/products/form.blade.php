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
    <textarea id="description" name="description" class="form-control">{{ old('description', isset($products) ? $products->description : '') }}</textarea>
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
            @if(isset($productImage) )
            <div class="row">
                @foreach($productImage as $imageID => $image)
                <div class="col-lg-2 ">
                    <a href="javascript:void(0);" class="delete_image" rel="{{$imageID}}"><i class="fa fa-times-circle float-right text-danger"></i></a>
                    <img class="product_images" height="100" width="100" src="{{ $image }}">
                </div>
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

<div class="form-group {{ $errors->has('seller_id') ? 'has-error' : '' }}">
    <label for="seller_id" class="required">{{ trans('global.seller_name') }}</label>
    @php
    $selected_seller = ( old('seller_id') != "" ? old('seller_id') : ( isset($products) ? $products->seller_id : "") );
    @endphp
    <select name="seller_id" class="form-control select2" name="seller_id">
        <option value="">{{ trans('global.select_seller') }}</option>
        @foreach($sellerData as $data)
        <option value="{{ $data->id }}" {{ $selected_seller == $data->id ? 'selected' : '' }}>{{ $data->name }}</option>
        @endforeach
    </select>
    @if($errors->has('seller_id'))
    <p class="help-block">
        {{ $errors->first('seller_id') }}
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
    <a href="{{ route('admin.products.index') }}" class="btn btn-danger ml-2">Cancel</a>
    <input class="btn btn-primary" type="submit" value="{{ isset($products)  ?  trans('global.update') :trans('global.save') }}">
</div>

<!-- JAvascript Included-->
@section('after-scripts')
<script type="text/javascript">
    $(document).ready(function() {
        Backend.Validate.Products();

        tinymce.init({
            selector: 'textarea#description',
            plugins: 'link image',
            image_advtab: true,
        });
        
        var product_id = '<?php echo isset($products) ? $products->id : "" ?>';
        if( product_id != ""){
            $(document).on('click', '.delete_image', function(e) {
                var image_name = $(this).attr('rel');
                Swal.fire({
                    title: '{{ trans("global.areYouSure")}}',
                    text: '{{ trans("global.youWontbeAbletoDelete") }}',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: "{{ trans('global.yesDeleteIt') }}"
                }).then((result) => {
                    if (result.value) {
                        $(this).parent('div').remove();
                        $.ajax({
                            url: "{{URL('admin/products/deleteImage')}}",
                            type: "POST",
                            dataType: "json",
                            cache: false,
                            data: {
                                _token: '{{ csrf_token() }}',
                                'image_name': image_name,
                                'product_id': product_id,
                            }
                        });
                    }
                });
            });
        }
        
    });

    document.addEventListener("DOMContentLoaded", init, false);

    function init() {
        document.querySelector('#files').addEventListener('change', handleFileSelect, false);
    }

    function handleFileSelect(e) {
        if (!e.target.files) return;
        var files = e.target.files;

        var uploadMaxImages = 5 - $('.product_images').length;

        if (files.length > uploadMaxImages) {
            alert("You have added more than " + uploadMaxImages + " files. According to upload conditions, you can upload " + uploadMaxImages + " files maximum");
            $("#files").val(null);
            e.preventDefault();
            return false;
        }

        var availableType = ["image/jpeg", "image/jpg", "image/png", "image/gif"];
        for (var i = 0, file; file = files[i]; i++) {
            // check image type
            if ($.inArray(file.type, availableType) == '-1') {
                alert("The file (" + file.name + ") does not match the upload conditions, You can only upload jpg/png/gif files");
                $("#files").val(null);
                e.preventDefault();
                return false;
            }

            //check image size 5MB
            if (file.size > 5000000) {
                alert("The file (" + file.name + ") does not match the upload conditions, The maximum file size for uploads should not exceed 5MB");
                $("#files").val(null);
                e.preventDefault();
                return false;
            }
        }
        document.getElementById('files').addEventListener('change', handleFileSelect, false);
    }
</script>
@endsection