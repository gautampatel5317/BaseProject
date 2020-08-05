<!doctype html>
<html lang="en">
  <head>
    <title>{{ app_name() }}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/fontawesome.min.css">
    <link rel="stylesheet" href="{{ \URL::to('/css/frontend/css/style.css') }}">
    {{ Html::style('css/backend/backend-custom.css') }}
  </head>
  <body>
    <div class="wrapper d-flex align-items-stretch">
      @include('frontend.layouts.partials.sidebar')
      <!-- Page Content  -->
      <div id="content" class="p-4 p-md-5">
        @yield('header')
        @include('frontend.layouts.partials.header')
        @yield('content')
      </div>
    </div>
    <form id="logoutform" action="{{ route('logout') }}" method="POST" style="display: none;">
                {{ csrf_field() }}
     </form>
     <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/js/fontawesome.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    @yield('after-script')
    <script src="{{ \URL::to('js/frontend/js/jquery.min.js') }}"></script>
    <script src="{{ \URL::to('js/frontend/js/popper.js') }}"></script>
    <script src="{{ \URL::to('js/frontend/js/bootstrap.min.js')}}"></script>
    <script src="{{ \URL::to('js/frontend/js/main.js')}}"></script>
     {{ Html::script('js/backend/backend-custom.js') }}
  </body>
</html>