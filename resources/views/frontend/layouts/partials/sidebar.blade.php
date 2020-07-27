      <nav id="sidebar" class="">
        <h1><a href="index.html" class="logo">{{ trans('Multiple Vendor') }}</a></h1>
        <ul class="list-unstyled components mb-5">
          <li class="active">
            <a href="#"><span class="fa fa-home"></span> Home</a>
          </li>
          <li>
            <a href="{{ route('products') }}"><span class="fa fa-user"></span> Product</a>
          </li>
          <li class="nav-item">
                <a href="#" onclick="event.preventDefault(); document.getElementById('logoutform').submit();"><span class="fa  fa-sign-out"></span> Logout</a>
          </li>
        </ul>
        <div class="footer">
          <p>
            Copyright &copy;
            <script>document.write(new Date().getFullYear());
            </script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib.com</a>
          </p>
        </div>
      </nav>