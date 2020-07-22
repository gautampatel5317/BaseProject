<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>{{ trans('global.site_title') }}</title>
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet" />
        <link href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" rel="stylesheet" />
        {{ Html::style('css/backend/backend-custom.css') }}
        @yield('styles')
    </head>
    <body class="sidebar-mini sidebar-open" style="height: auto;">
    @php
        $settings = getSettings();
    @endphp
        <div class="wrapper">
            <nav class="main-header navbar navbar-expand bg-white navbar-light border-bottom">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars"></i></a>
                    </li>
                </ul>
                <!-- Right navbar links -->
                @if(count(config('panel.available_languages', [])) > 1)
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link" data-toggle="dropdown" href="#">
                            {{ strtoupper(app()->getLocale()) }}
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            @foreach(config('panel.available_languages') as $langLocale => $langName)
                            <a class="dropdown-item" href="{{ url()->current() }}?change_language={{ $langLocale }}">{{ strtoupper($langLocale) }} ({{ $langName }})</a>
                            @endforeach
                        </div>
                    </li>
                </ul>
                @endif
            </nav>
            @include('backend.layouts.partials.menu')
            <div class="content-wrapper" style="min-height: 917px;">
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1 class="m-0 text-dark"> @yield('page-header')</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Main content -->
                <section class="content" style="padding-top: 20px">
                    @yield('content')
                </section>
                <!-- /.content -->
            </div>
            <footer class="main-footer">
                <strong>{{ $settings['footer_text'] }}</strong> {{ $settings['copyright_text'] }}
            </footer>
            <form id="logoutform" action="{{ route('logout') }}" method="POST" style="display: none;">
                {{ csrf_field() }}
            </form>
        </div>
        {{ Html::script('js/backend/backend-custom.js') }}
        <script type="text/javascript">
        $(function() {
        let copyButtonTrans = '{{ trans('global.datatables.copy') }}'
        let csvButtonTrans = '{{ trans('global.datatables.csv') }}'
        let excelButtonTrans = '{{ trans('global.datatables.excel') }}'
        let pdfButtonTrans = '{{ trans('global.datatables.pdf') }}'
        let printButtonTrans = '{{ trans('global.datatables.print') }}'
        let colvisButtonTrans = '{{ trans('global.datatables.colvis') }}'
        let languages = {
        'en': '{{ \URL::to('json/English.json') }}'
        };
        });
        var moduleConfig = '';
        </script>
        @yield('scripts')
        {{ Html::script('js/backend/additional-methods.min.js') }}
        {{ Html::script('js/backend/adminlte.js') }}
        @yield('after-scripts')
    </body>
</html>