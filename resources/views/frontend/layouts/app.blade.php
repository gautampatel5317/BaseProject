<!doctype html>
<html lang="en">
  <head>
    <title>{{ app_name() }}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="{{ \URL::to('/css/frontend/css/style.css') }}">
  </head>
  <body>
    <div class="wrapper d-flex align-items-stretch">
      <nav id="sidebar" class="">
        <h1><a href="index.html" class="logo">{{ trans('Multiple Vendor') }}</a></h1>
        @yield('sidebar')
        <ul class="list-unstyled components mb-5">
          <li class="active">
            <a href="#"><span class="fa fa-home"></span> Home</a>
          </li>
          <li>
            <a href="#"><span class="fa fa-user"></span> Product</a>
          </li>
          <li class="nav-item">
                <a href="#" onclick="event.preventDefault(); document.getElementById('logoutform').submit();"><span class="fa  fa-sign-out"></span> Logout</a>
          </li>
        </ul>
        @yield('sidebar-footer')
        <div class="footer">
          <p>
            Copyright &copy;
            <script>document.write(new Date().getFullYear());
            </script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib.com</a>
          </p>
        </div>
      </nav>
      <!-- Page Content  -->
      <div id="content" class="p-4 p-md-5">
        @yield('header')
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">
            <button type="button" id="sidebarCollapse" class="btn btn-primary">
            <i class="fa fa-bars"></i>
            <span class="sr-only">Toggle Menu</span>
            </button>
            <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fa fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="nav navbar-nav ml-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Product</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Logout</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
        @yield('content')
        <h2 class="mb-4">Sidebar #07</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
      </div>
    </div>
    <form id="logoutform" action="{{ route('logout') }}" method="POST" style="display: none;">
                {{ csrf_field() }}
            </form>
    @yield('after-script')
    <script src="{{ \URL::to('js/frontend/js/jquery.min.js') }}"></script>
    <script src="{{ \URL::to('js/frontend/js/popper.js') }}"></script>
    <script src="{{ \URL::to('js/frontend/js/bootstrap.min.js')}}"></script>
    <script src="{{ \URL::to('js/frontend/js/main.js')}}"></script>
  </body>
</html>