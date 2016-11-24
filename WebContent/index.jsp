<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="Shalom Nyendes">


<title>Pulse | Egerton UniversityMedicalDepartment</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="../../assets/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/cover.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">


<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
<style>
body {
	background: url(images/pulse_line.jpg) no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
}
</style>


</head>

<body>
	<div class="site-wrapper">

		<div class="site-wrapper-inner">

			<div class="cover-container">

				<div class="masthead clearfix">
					<div class="inner">
						<h3 class="masthead-brand">Pulse</h3>
						<nav>
							<ul class="nav masthead-nav">
								<li class="active"><a href="#">About</a></li>
								<li><a href="#">Services</a></li>
								<li><a href="#">Privacy</a></li>
								<li><a href="#">T&C</a></li>
								<li><a href="Developers.jsp">{{ Credits }}</a></li>
							</ul>
						</nav>
					</div>
				</div>


				<div class="inner cover">

					<div class="col-md-8 col-md-offset-3">
						<div class="panel panel-default">
							<div class="panel-heading">
								<%
									if (request.getAttribute("errors") == null) {
								%>
								<div>

									<p>Errors</p>
								</div>
								<%
									}
								%>
								<h3 class="panel-title">Check In</h3>
							</div>
							<div class="panel-body">
								<form method="POST" role="form" action="Login">
									<fieldset>
										<div class="form-group">
											<input class="form-control" placeholder="Username"
												name="username" type="text">
										</div>
										<div class="form-group">
											<input class="form-control" placeholder="Password"
												name="password" type="password" value="">
										</div>
								<div class="form-group">
											<input class="form-control" placeholder="Role"
												name="role" type="text" value="">
										</div>
										<input class="btn btn-lg btn-success btn-block" type="submit"
											value="Login">

									</fieldset>
								</form>
							</div>
						</div>
					</div>

				</div>

				<div class="mastfoot">
					<div class="inner">
						<p class="lead small">
							<i>Pulse &copy; 2016 - Transforming Lives Through Proper
								Health Care. An Affiliate of <a href="http://www.egerton.ac.ke">Egerton
									University</a>
							</i>
						</p>
					</div>
				</div>

			</div>

		</div>

	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')
	</script>
	<script src="js/bootstrap.min.js"></script>

	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>