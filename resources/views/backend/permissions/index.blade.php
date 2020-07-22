@extends('backend.layouts.admin')
@section('page-header')
{{ trans('global.permissionsManagement') }}
@endsection
@section('content')
<div class="container-fluid">
      @include('flash::message')
     <div class="card card-primary card-outline">
          <div class="card-header">
              <div class="card-tools">
                @can('permission_create')
                   <a href="{{route('admin.permissions.create')}}" class="btn btn-primary btn-sm"><i class="mr-1 fas fa-plus"></i>{{ trans('global.add') }} {{ trans('global.permission.title_singular') }}</a>
                @endcan
              </div>
          </div>
          <div class="card-body">
               <div class="table-responsive">
                  <table id="permission_table" class=" table table-bordered table-striped table-hover datatable">
                      <thead>
                          <tr>
                              <th width="10"></th>
                              <th>{{ trans('global.permission.fields.title') }}</th>
                               <th>{{ trans('global.created_at') }}</th>
                               <th>{{ trans('global.updated_at') }}</th>
                              <th>{{ trans('global.actions') }}</th>
                          </tr>
                      </thead>
                      <thead>
                        <tr>
                          <th><input type="text" class="form-control text-search" name="title" data-column="1" placeholder="{{ trans('global.permission.fields.title') }}"></th>
                            <th><input type="date" name="created_at" data-column="2" value="" class="form-control text-search">
                                </th>
                               <th><input type="date" name="updated_at" data-column="3" value="" class="form-control text-search">
                              </th>
                              <th></th>
                        </tr>
                      </thead>
                        <tbody>
                        </tbody>
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
  var dataTable = $('#permission_table').DataTable({
    "lengthMenu": [
                [10, 25, 50, -1],
                [10, 25, 50, "All"]
          ],
      processing: true,
      serverSide: true,
      ajax: {
              url: '{{ route("admin.permissions.get") }}',
              headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
              },
              type: 'post'
      },
      columns: [
              {data: 'checkbox', name:'{{ config('tables.permissions_table')}}.id',visible:false},
              {data: 'title', name:'{{ config('tables.permissions_table')}}.title'},
              {data: 'created_at', name: '{{ config('tables.permissions_table')}}.created_at'},
              {data: 'updated_at', name:   '{{ config('tables.permissions_table')}}.updated_at'},
              {data: 'action_buttons', name: 'actions', searchable: false, sortable: false},
          ],
       order: [],
       searchDelay: 500,
       dom: 'lBfrtip',
       buttons: {
            buttons: [
                { extend: 'copy', className: 'btn btn-primary copyButton',  exportOptions: {columns: [1]  }},
                { extend: 'csv', className: 'btn btn-primary csvButton',  exportOptions: {columns: [1]  }},
                { extend: 'excel', className: 'btn btn-primary excelButton',  exportOptions: {columns: [1]  }},
                { extend: 'pdf', className: 'btn btn-primary pdfButton',  exportOptions: {columns: [1]  }},
                { extend: 'print', className: 'btn btn-primary printButton',  exportOptions: {columns: [1]  }}
            ]
        }
      });
       /* DataTable column search */
  $('.custom-select').select2({width:50});
  $('.text-search').on('keyup change',function(){
     dataTable.columns($(this).attr('data-column')).search(this.value).draw();
  });
});
      $(document).on('click','.delete_record',function(e){
          var delId = jQuery(this).attr('data');
          console.log(delId);
          var deleteUrl = window.origin+`/admin/permissions/${delId}/delete`;
          console.log(deleteUrl);
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
</script>
@endsection