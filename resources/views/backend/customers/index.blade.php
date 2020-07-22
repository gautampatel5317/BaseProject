@extends('backend.layouts.admin')
@section('page-header')
{{ trans('global.add') }} {{ trans('global.customer.title_singular') }}
@endsection
@section('content')
@include('flash::message')

<div class="container-fluid">
    <div class="card card-primary card-outline">

        <div class="card-header">
            <div class="card-tools">
                @can('customer_create')
                <a class="btn btn-primary btn-sm" href="{{ route("admin.customers.create") }}">
                    <i class="mr-1 fas fa-plus"></i>{{ trans('global.add') }} {{ trans('global.customer.title_singular') }}
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
                                <table id="customers_table" class=" table table-bordered table-striped table-hover datatable">
                                    <thead>
                                        <tr>
                                            <th>
                                                {{ trans('global.customer.fields.name') }}
                                            </th>
                                            <th>
                                                {{ trans('global.customer.fields.family_name') }}
                                            </th>
                                            <th>
                                                {{ trans('global.customer.fields.email') }}
                                            </th>
                                            <th>
                                                {{ trans('global.customer.fields.experience') }}
                                            </th>
                                            <th>
                                                {{ trans('global.customer.fields.business') }}
                                            </th>
                                            <th>
                                                {{ trans('global.status') }}
                                            </th>
                                            <th>
                                                {{ trans('global.actions') }}
                                            </th>
                                        </tr>
                                    </thead>
                                    <thead>
                                        <tr>
                                            <th><input type="text" class="form-control text-search" name="name" data-column="0" placeholder="{{ trans('global.customer.fields.name') }}"></th>
                                            <th><input type="text" class="form-control text-search" name="family_name" data-column="1" placeholder="{{ trans('global.customer.fields.family_name') }}"></th>
                                            <th><input type="text" class="form-control text-search" name="email" data-column="2" placeholder="{{ trans('global.customer.fields.email') }}"></th>
                                            <th><input type="text" class="form-control text-search" name="experience_name" data-column="3" placeholder="{{ trans('global.customer.fields.experience') }}"></th>
                                            <th><input type="text" class="form-control text-search" name="business" data-column="4" placeholder="{{ trans('global.customer.fields.business') }}"></th>
                                            <th>
                                                <select class="form-control select2 select-filter" name="status" data-column="5">
                                                    <option value="All">{{ trans('global.all')}}</option>
                                                    <option value="1">{{ trans('global.active')}}</option>
                                                    <option value="0">{{ trans('global.inactive')}}</option>
                                                </select>
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
@endsection
@section('scripts')
@parent
<script>
    $(function() {

            // Ajax Data Load
            //$('tr > td').removeClass('select-checkbox');

            var dataTable = $('#customers_table').DataTable({

                processing: true,
                serverSide: true,
                ajax: {
                    url: '{{ route("admin.customers.get") }}',
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    type: 'post',
                    data: {status:status}
                },
                columns: [
                    {data: 'name', name:'name'},
                    {data: 'family_name', name: 'family_name' },
                    {data: 'email',  name:'email'},
                    {data: 'experience_name', name:'experience_name'},
                    {data: 'business', name:'business'},
                    {data: 'status',  name:'status' },
                    {data: 'actions', name: 'actions', searchable: false, sortable: false},
                ],
                order: [],
                searchDelay: 500,
                dom: 'lBfrtip',
                buttons: {
                    buttons: [{
                            extend: 'copy',
                            className: 'copyButton',
                            exportOptions: {
                                columns: [0, 1, 2, 3, 4, 5]
                            }
                        },
                        {
                            extend: 'csv',
                            className: 'csvButton',
                            exportOptions: {
                                columns: [0, 1, 2, 3, 4, 5]
                            }
                        },
                        {
                            extend: 'excel',
                            className: 'excelButton',
                            exportOptions: {
                                columns: [0, 1, 2, 3, 4, 5]
                            }
                        },
                        {
                            extend: 'pdf',
                            className: 'pdfButton',
                            exportOptions: {
                                columns: [0, 1, 2, 3, 4, 5]
                            }
                        },
                        {
                            extend: 'print',
                            className: 'printButton',
                            exportOptions: {
                                columns: [0, 1, 2, 3, 4, 5]
                            }
                        }
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
                    var search_string = '';
                    if($(this).val() == "1"){
                        search_string = '<span class="badge badge-success">Active</span>';
                    }else{
                        search_string = '<span class="badge badge-danger">Inactive</span>';
                    }
                    dataTable.columns($(this).attr('data-column')).search(search_string).draw();
                } else {
                    location.reload();
                }
            });
            /* End DataTable column search */
        

        let deleteButtonTrans = '{{ trans('global.datatables.delete ') }}'
        let deleteButton = {
            text: deleteButtonTrans,
            url: "{{ route('admin.customers.massDestroy') }}",
            className: 'btn-danger',
            action: function(e, dt, node, config) {
                var ids = $.map(dt.rows({
                    selected: true
                }).nodes(), function(entry) {
                    return $(entry).data('entry-id')
                });

                if (ids.length === 0) {
                    alert('{{ trans('global.datatables.zero_selected ') }}')
                    return
                }

                if (confirm('{{ trans('global.areYouSure ') }}')) {
                    $.ajax({
                            headers: {
                                'x-csrf-token': '{{ csrf_token() }}'
                            },
                            method: 'POST',
                            //type: "DELETE",
                            url: config.url,
                            data: {
                                ids: ids,
                                _token: '{{ csrf_token() }}'
                            }
                        })
                        .done(function() {
                            location.reload()
                        })
                }
            }
        }
        let dtButtons = $.extend(true, [], $.fn.dataTable.defaults.buttons)
        @can('customer_delete')
        dtButtons.push(deleteButton)
        @endcan

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
                        url: "{{URL('admin/customers/')}}"+"/"+delId,
                        type: "POST",
                        cache: false,
                        data:{
                            _token:'{{ csrf_token() }}', _method:"DELETE"
                        },
                        beforeSend:function(){
                            $(that).html('{{ trans("global.deleting") }}');
                        },
                        success: function(dataResult){
                            if(dataResult=="success"){
                                setTimeout(function(){
                                $('#customers_table').DataTable().ajax.reload();
                                    Swal.fire(
                                    '{{ trans("global.deleted") }}',
                                    '{{ trans("global.data_has_been_deleted") }}',
                                    'success'
                                    )
                                }, 1000);
                            }else{
                                swal("{{ trans('global.error') }}", "{{ trans('global.something_Went_wrong') }}", "error");
                            }
                        }
                    });
                }
            });
            e.preventDefault();
        });

    })

</script>
@endsection