@extends('frontend.layouts.app')
@section('header')
@endsection
@section('content')
<div class="container-fluid">
    @include('flash::message')
    <div class="card card-primary card-outline">
        <div class="card-body">
            {!! Form::model(null, ['id' => 'create-from','url' => route('products.store'),'enctype'=> 'multipart/form-data','class'=>'form-validate-jquery']) !!}
            @csrf
            @include('frontend.products.form')
            {{ Form::close() }}
        </div>
    </div>
</div>
@endsection
@section('after-script')
<script type="text/javascript">
    $(document).ready(function() {
        Backend.Validate.Products();
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