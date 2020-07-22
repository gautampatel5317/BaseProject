@extends('backend.layouts.admin')
@section('page-header')
    {{ trans('global.user_management') }}
@endsection
@section('content')
@include('flash::message')
<div class="container-fluid">
   <div class="card card-primary card-outline">
     <div class="card-header">
        <div class="card-tools">
          @can('user_create')
          <a href="{{route('admin.users.create')}}" class="btn btn-primary btn-sm"><i class="mr-1 fas fa-plus"></i>{{ trans('global.add') }} {{ trans('global.user.title_singular') }}</a>
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
                        <table id="users_table" class="table  table-hover table-bordered datatable cell-border">
                        <thead>
                            <tr>
                              <th width="10"></th>
                                <th>{{ trans('global.user.fields.name') }}</th>
                                <th>{{ trans('global.user.fields.email') }}</th>
                                <th>{{ trans('global.user.fields.email_verified_at') }}</th>
                                <th>{{ trans('global.user.fields.roles') }}</th>
                                <th>{{ trans('global.status') }}
                                <th>{{ trans('global.created_at') }}</th>
                                <th>{{ trans('global.updated_at') }}</th>
                                <th>{{ trans('global.actions') }}</th>
                            </tr>
                        </thead>
                        <thead>
                           <tr>
                            <th><input type="text" class="form-control text-search" name="name" data-column="1" placeholder="{{ trans('global.user.fields.name') }}"></th>
                            <th><input type="text" class="form-control text-search" name="email" data-column="2" placeholder="{{ trans('global.user.fields.email') }}"></th>
                            <th></th>
                            <th>
                              <select class="form-control select2 select-filter" name="roles" data-column="4">
                                <option value="All">{{ trans('global.all') }}</option>
                                @foreach ($roles as $roleKey => $roleVal)
                                  <option value="{{ $roleVal }}">{{ $roleVal }}</option>
                                @endforeach
                              </select>
                            </th>
                            <th>
                              <select class="form-control select2 select-filter" name="status" data-column="5">
                                <option value="All">{{ trans('global.all')}}</option>
                                <option value="1">{{ trans('global.active')}}</option>
                                <option value="0">{{ trans('global.inactive')}}</option>
                              </select>
                            </th>
                            <th>
                              <input type="date" name="created_at" data-column="6" value="" class="form-control text-search">
                            </th>
                            <th>
                              <input type="date" name="updated_at" data-column="7" value="" class="form-control text-search">
                            </th>
                          </tr>
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
@parent
<script>
$(function () {
    // Ajax Data Load
     $('tr > td').removeClass('select-checkbox');
      var dataTable = $('#users_table').DataTable({
          "lengthMenu": [
                [10, 25, 50, -1],
                [10, 25, 50, "All"]
          ],
          processing: true,
          serverSide: true,
          ajax: {
              url: '{{ route("admin.users.get") }}',
              headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
              },
              type: 'post'
          },
          columns: [
              {data: 'checkbox', name:'{{ config('tables.users_table')}}.id',visible:false},
              {data: 'name', name:'{{ config('tables.users_table')}}.name'},
              {data: 'email', name: '{{ config('tables.users_table')}}.email'},
              {data: 'email_verified_at', name: '{{ config('tables.users_table')}}.email_verified_at'},
              {data: 'roles', name: '{{ config('tables.roles_table')}}.title'},
              {data: 'status', name: '{{ config('tables.users_table')}}.status'},
              {data: 'created_at', name: '{{ config('tables.users_table')}}.created_at'},
              {data: 'updated_at', name:   '{{ config('tables.users_table')}}.updated_at'},
              {data: 'actions', name: 'actions', searchable: false, sortable: false},
          ],
          order: [],
          searchDelay: 500,
          dom: 'lBfrtip',
          buttons: {
              buttons: [
                  { extend: 'copy', className: 'btn btn-primary copyButton',  exportOptions: {columns: [ 0, 1, 2,3,4,5,6,7 ]  }},
                  { extend: 'csv', className: 'btn btn-primary csvButton',  exportOptions: {columns: [  0, 1, 2,3,4,5,6,7 ]  }},
                  { extend: 'excel', className: 'btn btn-primary excelButton',  exportOptions: {columns: [  0, 1, 2,3,4,5,6,7 ]  }},
                  { extend: 'pdf', className: 'btn btn-primary pdfButton',  exportOptions: {columns: [  0, 1, 2,3,4,5,6,7 ]  }},
                  { extend: 'print', className: 'btn btn-primary printButton',  exportOptions: {columns: [  0, 1, 2,3,4,5,6,7 ]  }}
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
/* End DataTable column search */
  let deleteButtonTrans = '{{ trans('global.datatables.delete') }}'
  let deleteButton = {
    text: deleteButtonTrans,
    url: "{{ route('admin.users.massDestroy') }}",
    className: 'btn-danger',
    action: function (e, dt, node, config) {
      var ids = $.map(dt.rows({ selected: true }).nodes(), function (entry) {
          return $(entry).data('entry-id')
      });
      if (ids.length === 0) {
        alert('{{ trans('global.datatables.zero_selected') }}')
        return
      }
      if (confirm('{{ trans('global.areYouSure') }}')) {
        $.ajax({
          headers: {'x-csrf-token': _token},
          method: 'POST',
          url: config.url,
          data: { ids: ids, _method: 'DELETE' }})
          .done(function () { location.reload() })
      }
    }
  }
  let dtButtons = $.extend(true, [], $.fn.dataTable.defaults.buttons)
@can('user_delete')
  dtButtons.push(deleteButton)
@endcan
    $(document).on('click','.delete_record',function(e){
          var delId = jQuery(this).attr('data');
          var deleteUrl = window.origin+`/admin/users/${delId}/delete`;
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
                url: "{{route('admin.users.status')}}",
                type: "POST",
                cache: false,
                data:{
                    _token:'{{ csrf_token() }}',
                    'status': status,
                    'id': ID
                },
                success: function(dataResult){
                    if(dataResult=="success"){
                        $('#country_table').DataTable().ajax.reload();
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