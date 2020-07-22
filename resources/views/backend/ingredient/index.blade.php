@extends('backend.layouts.admin')
@section('page-header')
{{ trans('global.ingredient_management') }}
@endsection
@section('content')
<div class="container-fluid">
      @include('flash::message')
     <div class="card card-primary card-outline">
          <div class="card-header">
              <div class="card-tools">
                @can('ingredient_create')
                   <a href="{{route('admin.ingredient.create')}}" class="btn btn-primary btn-sm"><i class="mr-1 fas fa-plus"></i>{{ trans('global.add') }} {{ trans('global.cms.title_singular') }}</a>
                @endcan
              </div>
          </div>
          <div class="card-body">
               <div class="table-responsive">
                  <table id="ingredient_table" class=" table table-bordered table-striped table-hover datatable">
                      <thead>
                          <tr>
                              <th width="10">
                              </th>
                              <th>
                                  {{ trans('global.ingredient.fields.title') }}
                              </th>
                              <th>
                                  {{ trans('global.ingredient.fields.status') }}
                              </th>
                              <th>
                                {{ trans('global.actions') }}
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
@endsection
@section('scripts')
@parent
<script> 
$(function () {
  var dataTable = $('#ingredient_table').DataTable({
    "lengthMenu": [
                [10, 25, 50, -1],
                [10, 25, 50, "All"]
          ],
      processing: true,
      serverSide: true,
      ajax: {
              url: '{{ route("admin.ingredient.get") }}',
              headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
              },
              type: 'post'
      },
      columns: [
              {data: 'checkbox', name:'id',visible: false},
              {data: 'title', name:'title'},
              {data: 'status', name:'status'},
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
          url: "{{URL('admin/ingredient/')}}"+"/"+delId,
          type: "POST",
          cache: false,
          data:{
              _token:'{{ csrf_token() }}', _method:"DELETE"
          },
          success: function(Result){
              if(Result=="success"){
                  $('#ingredient_table').DataTable().ajax.reload();
                      Swal.fire(
                        '{{ trans("global.deleted") }}',
                        '{{ trans("global.data_has_been_deleted") }}',
                      'success'
                      )
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
                url: "{{URL('admin/ingredient/changeStatus')}}",
                type: "POST",
                cache: false,
                data:{
                    _token:'{{ csrf_token() }}', 
                    'status': status, 
                    'id': ID
                },
                success: function(Result){
                    if(Result=="success"){
                        $('#ingredient_table').DataTable().ajax.reload();
                        Swal.fire(
                        '{{ trans("global.done") }}',
                        '{{ trans("global.status_updated_success") }}',
                          'success'
                        )
                      }else{
                        swal("{{ trans('global.error') }}", "{{ trans('global.something_Went_wrong') }}", "error");
                    }
                }
            });
        });

});
</script>
@endsection