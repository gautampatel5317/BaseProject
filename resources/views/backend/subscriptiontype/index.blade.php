<!-- @extends('backend.layouts.admin') -->
@section('page-header')
{{ trans('global.subscriptiontype_management') }}
@endsection
@section('content')
@include('flash::message')
<div class="container-fluid">
    <div class="card card-primary card-outline">
        <div class="card-header">
            <div class="card-tools">
                @can('subscriptiontype_create')
                    <a class="btn btn-primary btn-sm" href="{{ route("admin.subscriptiontype.create") }}">
                    <i class="mr-1 fas fa-plus"></i>{{ trans('global.add') }} {{ trans('global.subscriptiontype.title_singular') }}
                    </a>
            @endcan
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
                                <table id="subscriptiontype_table" class=" table table-bordered table-striped table-hover datatable">
                                    <thead>
                                        <tr>
                                            <th width="10"></th>
                                            <th>{{ trans('global.subscriptiontype.fields.type') }}</th>
                                            <th>{{ trans('global.status') }}</th>
                                            <th>{{ trans('global.actions') }}</th>
                                        </tr>
                                    </thead>
                                    <thead>
                                        <tr>
                                            <th><input type="text" class="form-control text-search" name="TYPE" data-column="1" placeholder="{{ trans('global.subscriptiontype.fields.type') }}"></th>
                                            <th>
                                                <select class="form-control select2 select-filter" name="status" data-column="2">
                                                    <option value="All">{{ trans('global.all')}}</option>
                                                    <option value="1">{{ trans('global.active')}}</option>
                                                    <option value="0">{{ trans('global.inactive')}}</option>
                                                </select>
                                            </th>
                                            <th></th>
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
@endsection
@section('scripts')
@parent
<script>
$(function() {
    // Ajax Data Load
    $('tr > td').removeClass('select-checkbox');
      var dataTable = $('#subscriptiontype_table').DataTable({
          "lengthMenu": [
                [10, 25, 50, -1],
                [10, 25, 50, "All"]
          ],
          processing: true,
          serverSide: true,
          ajax: {
              url: '{{ route("admin.subscriptiontype.get") }}',
              headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
              },
              type: 'post'
          },
          columns: [
                {data: 'checkbox', name:'id',visible:false},
                {data: 'type', name:'type'},
                {data: 'status', name:'status'},
                {data: 'actions', name: 'actions', searchable: false, sortable: false},
          ],
          order: [],
          searchDelay: 500,
          dom: 'lBfrtip',
          buttons: {
              buttons: [
                  { extend: 'copy', className: 'btn btn-primary copyButton',  exportOptions: {columns: [ 1, 2]  }},
                  { extend: 'csv', className: 'btn btn-primary csvButton',  exportOptions: {columns: [ 1, 2]  }},
                  { extend: 'excel', className: 'btn btn-primary excelButton',  exportOptions: {columns: [ 1, 2 ]  }},
                  { extend: 'pdf', className: 'btn btn-primary pdfButton',  exportOptions: {columns: [ 1, 2 ]  }},
                  { extend: 'print', className: 'btn btn-primary printButton',  exportOptions: {columns: [  1, 2 ]  }}
              ]
          }
      });
/* End Ajax Load Data */
/* DataTable column search */
$('.custom-select').select2({width:50});
$('.text-search').on('keyup change',function(){
     dataTable.columns($(this).attr('data-column')).search(this.value).draw();
});
$('.select-filter' ).on('change',function () {
  if ($(this).val() != 'All') {
   dataTable.search($(this).val()).draw();
  } else {
    location.reload();
  }
});
        $(document).on('click','.delete_record',function(e){
            var delId = jQuery(this).attr('data');
            var that = this;
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
                    $.ajax({
                        url: "{{URL('admin/subscriptiontype/')}}"+"/"+delId,
                        type: "POST",
                        cache: false,
                        data:{
                            _token:'{{ csrf_token() }}', _method:"DELETE"
                        },
                        success: function(dataResult){
                            if(dataResult=="success"){
                                $('#subscriptiontype_table').DataTable().ajax.reload();
                                    Swal.fire(
                                    '{{ trans("global.deleted") }}',
                                    '{{ trans("global.data_has_been_deleted") }}',
                                    'success'
                                    );
                                
                            }else{
                                swal("{{ trans('global.error') }}", "{{ trans('global.something_Went_wrong') }}", "error");
                            }
                        }
                    });
                }
            });
            e.preventDefault();
        });

        $(document).on('click','.change_status',function(e){
            var ID = jQuery(this).attr('data');
            var status = $(this).prop('checked') == true ? 1 : 0;
            $.ajax({
                url: "{{URL('admin/subscriptiontype/changeStatus')}}",
                type: "POST",
                cache: false,
                data:{
                    _token:'{{ csrf_token() }}', 
                    'status': status, 
                    'id': ID
                },
                success: function(dataResult){
                    if(dataResult=="success"){
                        $('#subscriptiontype_table').DataTable().ajax.reload();
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

    })
    
</script>
@endsection