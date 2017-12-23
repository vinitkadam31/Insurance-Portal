
<!DOCTYPE html>
<html lang="en">

  <head>
	<%@ include file="./shared/navbar.jsp" %>
    <title>Landing Page - Start Bootstrap Theme</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="../css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/simple-line-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="../css/landing-page.min.css" rel="stylesheet">
	
	<script type="text/javascript">
	$( document ).ready(function() {
		if($('#hiddenIsAppCompleted').val()){
			alert("Application submited successfully!!!");
		}
	});
	</script>
  </head>

  <body>
  <input type="hidden" id="hiddenIsAppCompleted" name="inputName" value="${applicationsubmit}">
    <!-- Navigation -->
    <nav class="navbar navbar-light bg-light static-top">
      <div class="container">
        
        <a class="btn btn-primary" href="login.do">Sign In</a>
      </div>
    </nav>

    <!-- Masthead -->
    <header class="masthead text-white text-center">
      <div class=""></div>
      <div class="container">
        <div class="row">
          <div class="col-xl-9 mx-auto">
            <h1 class="mb-5">Enter your email id to create application</h1>
          </div>
          <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
            <form class="form-signin" action = "register.do">
              <div class="form-row">
                <div class="col-12 col-md-9 mb-2 mb-md-0">
                  <input type="email" class="form-control form-control-lg"name = "email"  placeholder="Enter your email...">
                </div>
                <div class="col-12 col-md-3">
                  <button type="submit" class="btn btn-block btn-lg btn-primary">Continue</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </header>

    <!-- Footer -->
    <!-- <footer class="footer bg-light">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 h-100 text-center text-lg-left my-auto">
            <ul class="list-inline mb-2">
              <li class="list-inline-item">
                <a href="#">About</a>
              </li>
              <li class="list-inline-item">&sdot;</li>
              <li class="list-inline-item">
                <a href="#">Contact</a>
              </li>
              <li class="list-inline-item">&sdot;</li>
              <li class="list-inline-item">
                <a href="#">Terms of Use</a>
              </li>
              <li class="list-inline-item">&sdot;</li>
              <li class="list-inline-item">
                <a href="#">Privacy Policy</a>
              </li>
            </ul>
            <p class="text-muted small mb-4 mb-lg-0">&copy; Start Bootstrap 2017. All Rights Reserved.</p>
          </div>
          <div class="col-lg-6 h-100 text-center text-lg-right my-auto">
            <ul class="list-inline mb-0">
              <li class="list-inline-item mr-3">
                <a href="#">
                  <i class="fa fa-facebook fa-2x fa-fw"></i>
                </a>
              </li>
              <li class="list-inline-item mr-3">
                <a href="#">
                  <i class="fa fa-twitter fa-2x fa-fw"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-instagram fa-2x fa-fw"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </footer>-->

    <!-- Bootstrap core JavaScript -->
    <script src="../js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>

  </body>

</html>
