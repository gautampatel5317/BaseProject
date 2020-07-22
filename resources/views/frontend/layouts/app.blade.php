<!DOCTYPE html>
<html lang="en">
<head>
  <title>{{ app_name() }}</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
  {{-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> --}}
  <link rel="stylesheet" type="text/css" href="{{ \URL::to('/css/backend/bootstrap.min.css') }}">
  <link rel="stylesheet" type="text/css" href="{{ \URL::to('/css/backend/custom.css') }}">
  <link rel="stylesheet" type="text/css" href="{{ \URL::to('/css/backend/select2.min.css') }}">
  <link rel="stylesheet" type="text/css" href="{{ \URL::to('/css/backend/adminltev3.css') }}">
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }

    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
  </style>
</head>
<body>
@yield('header')
<nav class="navbar navbar-expand-lg navbar-light bg-primary">
  <a class="navbar-brand" href="#"><img style="width: 135px;height: 56px;" src="{{ \URL::to('images/site_logos.png') }}" alt="Ticket5Star" class=""></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
    </ul>
    @if (!\Auth::user())
      <ul class="navbar-nav my-2 my-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="{{ route('customer.create') }}">Register <span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item active">
        <a class="nav-link" href="{{ route('login') }}">Login <span class="sr-only">(current)</span></a>
      </li>
    </ul>
   @else
   <ul class="navbar-nav my-2 my-lg-0">
    <li class="nav-item active">
       <span class="nav-link">{{ auth()->user()->name }}</span>
     </li>
      <li class="nav-item active">
       <a href="#" class="nav-link" onclick="event.preventDefault(); document.getElementById('logoutform').submit();">
                        <p>
                            <i class="fas fa-sign-out-alt">
                            </i>
                            <span>{{ trans('global.logout') }}</span>
                        </p>
                    </a>
      </li>

   </ul>
  @endif
    <form class="form-inline my-2 my-lg-0">

      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

<div class="jumbotron">
  <div class="container text-center">
    <h1>{{ app_name() }}</h1>
    <p>Ticketmaster</p>
  </div>
</div>
@yield('conent')
<div class="container-fluid bg-3 text-center">
</div>
<footer class="container-fluid text-center">
</footer>
<form id="logoutform" action="{{ route('logout') }}" method="POST" style="display: none;">
                {{ csrf_field() }}
            </form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
{{-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> --}}
<script type="text/javascript" src="{{ \URL::to('js/backend/bootstrap.min.js') }}"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<script type="text/javascript" src="{{ \URL::to('js/backend/select2.full.min.js') }}"></script>
<script type="text/javascript" src="{{ \URL::to('js/backend/adminlte.js') }}"></script>
@yield('script')
</body>
</html>
