@extends('backend.layouts.admin')
@section('page-header')
{{ trans('global.role_management') }}
@endsection
@section('content')
<div class="container-fluid">
    @include('flash::message')
    <div class="card card-primary card-outline">
         <div class="card-header">
           <div class="card-tools">
              @can('role_create')
                <a class="btn btn-primary" href="{{ route("admin.roles.create") }}">
                   <i class="fa fa-plus"></i> {{ trans('global.add') }} {{ trans('global.role.title_singular') }}
                </a>
              @endcan
           </div>
         </div>
          <div class="card-body">
                  <div class="table-responsive">
                        <table id="roles_table" class=" table table-bordered table-striped table-hover datatable">
                            <thead>
                                <tr>
                                    <th width="10"></th>
                                    <th>{{ trans('global.role.fields.title') }}</th>
                                    <th>{{ trans('global.role.fields.permissions') }}</th>
                                    <th>{{ trans('global.created_at') }}</th>
                                    <th>{{ trans('global.updated_at') }}</th>
                                    <th>{{ trans('global.actions') }}</th>
                                </tr>
                            </thead>
                            <thead>
                              <tr>
                                <th><input type="text" class="form-control text-search" name="title" data-column="1" placeholder="{{ trans('global.role.fields.title') }}"></th>
                                <th></th>
                                <th><input type="date" name="created_at" data-column="5" value="" class="form-control text-search">
                                </th>
                               <th><input type="date" name="updated_at" data-column="6" value="" class="form-control text-search">
                            </th>
                              </tr>
                            </thead>
                        </table>
                  </div>
          </div>
    </div>
</div>
@endsection
@section('scripts')
@parent
<script>
$(function () {
     // Ajax Data Load
     $('tr > td').removeClass('select-checkbox');
      var dataTable = $('#roles_table').DataTable({
          "lengthMenu": [
                [10, 25, 50, -1],
                [10, 25, 50, "All"]
          ],
          processing: true,
          serverSide: true,
          ajax: {
              url: '{{ route("admin.roles.get") }}',
              headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
              },
              type: 'post'
          },
          columns: [
              {data: 'checkbox', name:'{{ config('tables.roles_table')}}.id',visible:false},
              {data: 'title', name:'{{ config('tables.roles_table')}}.title',width:'15%'},
              {data: 'permission', name: '{{ config('tables.permissions_table')}}.title',sortable:false,width:'45%'},
              {data: 'created_at', name: '{{ config('tables.roles_table')}}.created_at'},
              {data: 'updated_at', name:   '{{ config('tables.roles_table')}}.updated_at'},
              {data: 'action_buttons', name: 'action_buttons', searchable: false, sortable: false},
          ],
          order: [],
          searchDelay: 500,
          dom: 'lBfrtip',
          buttons: {
              buttons: [
                  { extend: 'copy', className: 'copyButton btn btn-primary',  exportOptions: {columns: [1,2]  }},
                  { extend: 'csv', className: 'csvButton btn-primary',  exportOptions: {columns: [1,2]  }},
                  { extend: 'excel', className: 'excelButton btn-primary',  exportOptions: {columns: [1,2]  }},
                  { extend: 'pdf', className: 'pdfButton btn-primary',  exportOptions: {columns: [1,2]  }},
                  { extend: 'print', className: 'printButton btn-primary',  exportOptions: {columns: [1,2]  }}
              ]
          }
      });
  /* DataTable column search */
  $('.custom-select').select2({width:50});
  $('.text-search').on('keyup change',function(){
     dataTable.columns($(this).attr('data-column')).search(this.value).draw();
  });
  });
/* End Ajax Load Data */
        $(document).on('click','.delete_record',function(e){
          var delId = jQuery(this).attr('data');
          var deleteUrl = window.origin+`/admin/roles/${delId}/delete`;
          console.log(deleteUrl);
          Swal.fire({
            title: '{{ trans("global.areYouSure")}}',
            text: '{{ trans("global.youWontbeAbletoDelete") }}',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '{{ trans("global.yesDeleteIt") }}'
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
</script>
@endsection