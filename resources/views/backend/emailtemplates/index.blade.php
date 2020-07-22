@extends('backend.layouts.admin')
@section('page-header')
    {{ trans('global.email_template_management') }}
@endsection
@section('content')
@include('flash::message')
<div class="container-fluid">
	<div class="card card-primary card-outline">
		<div class="card-header">
			<div class="card-tools">
         <a href="{{route('admin.users.create')}}" class="btn btn-primary btn-sm"><i class="mr-1 fas fa-plus"></i>{{ trans('global.add') }} {{ trans('global.email_template.title_singular') }}</a>
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
								<table id="emailtemplate_table" class="table table-condensed table-hover table-bordered datatable">
									 <thead>
									 	<th width="10"></th>
									 	<th>{{ trans('global.email_template.tables.title') }}</th>
									 	<th>{{ trans('global.email_template.tables.subject') }}</th>
									 	<th>{{ trans('global.email_template.tables.status') }}</th>
									 	<th>{{ trans('global.email_template.tables.createdat') }}</th>
									 	<th>{{ trans('global.email_template.tables.updatedat') }}</th>
									    <th>{{ trans('global.actions') }}</th>
									 </thead>
									 <tbody>
									 </tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
@endsection
@section('scripts')
<script type="text/javascript">
$(function () {
	$('tr > td').removeClass('select-checkbox');
	var dataTable = $('#emailtemplate_table').DataTable({
		"lengthMenu": [
                [10, 25, 50, -1],
                [10, 25, 50, "All"]
          ],
          processing: true,
          serverSide: true,
          ajax: {
              url: '{{ route("admin.emailtemplates.get") }}',
              headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
              },
              type: 'post'
          },
          columns: [
              {data: 'checkbox', name:'{{ config('tables.email_templates.table')}}.id',visible:false},
              {data: 'title', name:'{{ config('tables.email_templates.table')}}.title'},
              {data: 'subject', name: '{{ config('tables.email_templates.table')}}.subject'},
               {data: 'status', name: '{{ config('tables.email_templates.table')}}.status'},
              {data: 'created_at', name: '{{ config('tables.email_templates.table')}}.created_at'},
              {data: 'updated_at', name:   '{{ config('tables.email_templates.table')}}.updated_at'},
              {data: 'actions', name: 'actions', searchable: false, sortable: false},
          ],
          order: [],
          searchDelay: 500,
          dom: 'lBfrtip',
          buttons: {
              buttons: [
                  { extend: 'copy', className: 'btn btn-primary copyButton',  exportOptions: {columns: [ 0, 1, 2,3,4]  }},
                  { extend: 'csv', className: 'btn btn-primary csvButton',  exportOptions: {columns: [  0, 1, 2,3,4]  }},
                  { extend: 'excel', className: 'btn btn-primary excelButton',  exportOptions: {columns: [  0, 1, 2,3,4]  }},
                  { extend: 'pdf', className: 'btn btn-primary pdfButton',  exportOptions: {columns: [  0, 1, 2,3,4]  }},
                  { extend: 'print', className: 'btn btn-primary printButton',  exportOptions: {columns: [  0, 1, 2,3,4]  }}
              ]
          }
	});
	 $(document).on('click','.delete_record',function(e){
          var delId = jQuery(this).attr('data');
          var deleteUrl = window.origin+`/admin/emailtemplates/${delId}/delete`;
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
              window.location.href = deleteUrl;
              Swal.fire(
                '{{ trans("global.deleted") }}',
                '{{ trans("global.data_has_been_deleted") }}',
                'success'
              )
            }
        });
          e.preventDefault();
      });
           $(document).on('click','.change_status',function(e){
            var ID = jQuery(this).attr('data');
            var status = $(this).prop('checked') == true ? 1 : 0;
            $.ajax({
                url: "{{ route('admin.emailtemplates.changestatus') }}",
                type: "POST",
                cache: false,
                data:{
                    _token:'{{ csrf_token() }}',
                    'status': status,
                    'id': ID
                },
                success: function(dataResult){
                    if(dataResult=="success"){
                        $('#emailtemplate_table').DataTable().ajax.reload();
                        Swal.fire(
                        '{{ trans("global.done") }}',
                        '{{ trans("global.status_updated_success") }}',
                        'success'
                        );
                    }else{
                        swal("{{ trans('global.error') }}", "{{ trans('global.something_Went_wrong') }}", "error");
                    }
                }
            });
        });
});
</script>
@endsection