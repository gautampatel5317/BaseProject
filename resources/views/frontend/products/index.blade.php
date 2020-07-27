@extends('frontend.layouts.app')
@section('header')
@endsection
@section('content')
@include('flash::message')
<div id="content" class="p-3 p-md-3 pt-3">
	<div class="container-fluid">
		<div class="card card-primary card-outline">
			<div class="card-header">
				<div class="card-tools">
					<span style="color: blue;font-style: normal;">Products List</span> @include('frontend.products.partials.products-header-button')
				</div>
			</div>
			<div class="card-body">
				<div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4">
					<div class="row">
						<div class="col-sm-12 col-md-6"></div>
						<div class="col-sm-12 col-md-6"></div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<div class="box-body">
								<div class="table-responsive-lg data-table-wrapper">
									<table id="products" class="table table-condensed table-hover table-bordered">
										<thead>
											<tr>
												<th scope="col" class="text-center">
													Category
												</th>
												<th scope="col" class="text-center">
													Name
												</th>
												<th>
													Image
												</th>
												<th scope="col" class="text-center">
													Description
												</th>
												<th scope="col" class="text-center">
													Rate
												</th>
												<th scope="col" class="text-center">
													Sale Rate
												</th>
												<th scope="col" class="text-center">
													Status
												</th>
												<th scope="col" class="text-center">
													Actions
												</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
@endsection
@section('after-script')
<script type="text/javascript">
	$(function() {
		var dataTable = $('#products').DataTable({
			processing: true,
			serverSide: true,
			ajax: {
                url: '{{ route("products.get") }}',
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type: 'post',
                data: {status:status}
            },
            columns: [
                {data: 'name', name: '{{ config('tables.category_table')}}.name'},
                {data: 'title', name: '{{ config('tables.products_table')}}.title' },
                {data: 'image', name: '{{ config('tables.products_image_table')}}.image' },
                {data: 'description', name: '{{ config('tables.products_table')}}.description' },
                {data: 'rate', name: '{{ config('tables.products_table')}}.rate' },
                {data: 'sale_rate', name: '{{ config('tables.products_table')}}.sale_rate' },
                {data: 'status', name: '{{ config('tables.products_table')}}.status' },
                {data: 'actions', name: 'actions', searchable: false, sortable: false
                },
            ],
            order: [],
            searchDelay: 500,
            dom: 'lBfrtip',
            buttons: {
                buttons: [
                			{extend: 'copy',className: 'copyButton',exportOptions: {columns: [0, 1, 2, 3]}},
                    		{extend: 'csv',className: 'csvButton',exportOptions: {columns: [0, 1, 2, 3]}},
                    		{extend: 'excel',className: 'excelButton',exportOptions: {columns: [0, 1, 2, 3]}},
                    		{extend: 'pdf',className: 'pdfButton',exportOptions: {columns: [0, 1, 2, 3]}}

                ]
            }
		});
	});
	$(document).ready(function(){

	});
</script>
@endsection