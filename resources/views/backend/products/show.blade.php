@extends('backend.layouts.admin')
@section('content')
<div class="card">
    <div class="card-header">
        {{ trans('global.show') }} {{ trans('global.products.title_singular') }}
    </div>
    <div class="card-body">
        <table class="table table-bordered table-striped">
            <tbody>
                <tr>
                    <th>{{ trans('global.title') }}</th>
                    <td>{{ $products->title }}</td>
                </tr>
                <tr>
                    <th>{{ trans('global.description') }}</th>
                    <td>{{ $products->description }}</td>
                </tr>
                <tr>
                    <th>{{ trans('global.category_name') }}</th>
                    <td>{{ $products->category_name }}</td>
                </tr>
                <tr>
                    <th>{{ trans('global.seller_name') }}</th>
                    <td>{{ $products->seller_name }}</td>
                </tr>
                <tr>
                    <th>{{ trans('global.products.fields.rate') }}</th>
                    <td>{{ $products->rate }}</td>
                </tr>
                <tr>
                    <th>{{ trans('global.products.fields.sale_rate') }}</th>
                    <td>{{ $products->sale_rate }}</td>
                </tr>
                <tr>
                    <th>{{ trans('global.products.image') }}</th>
                    <td>
                        @if(isset($productImage) )
                            <div class = "row">
                                @foreach($productImage as $image)
                                    <div class="col-lg-2">
                                        <a class="fancybox" rel="gallery1" href="{{ $image }}">
                                            <img src="{{ $image }}" height="150" width="150"/>
                                        </a>
                                    </div>
                                @endforeach
                            </div>
                        @endif
                    </td>
                </tr>

                @if(isset($videoLink) && $videoLink != "")
                    <tr>
                        <th>{{ trans('global.products.video') }}</th>
                        <td>
                        <a target = "_blank" href="{{ $videoLink }}">{{ trans('global.products.click_here') }}</a>
                        </td>
                    </tr>
                @endif
                
            </tbody>
        </table>
    </div>
     <div class="card-footer text-center">
            <a href="{{ route('admin.products.index') }}" class="btn btn-danger ml-2">{{ trans('global.back') }}</a>
        </div>
</div>
@endsection

<!-- JAvascript Included-->
@section('after-scripts')
<script type="text/javascript">
    $(document).ready(function() {
        $(".fancybox").fancybox({
            openEffect	: 'none',
            closeEffect	: 'none'
        });
    });
</script>
@endsection