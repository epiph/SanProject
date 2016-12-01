<%@ page session ="true" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pulse | Home - Reception</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/dashboard.css" rel="stylesheet">
<script type="text/javascript" src="js/date_time.js"></script>
</head>
<body>

<%
	if (session.getAttribute("receptionist")==null){
		response.sendRedirect("index.jsp");
	}
%>

	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="ReceptionistHome.jsp">Pulse</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">Dashboard</a></li>
				<li><a href="#">Settings</a></li>
				<li><a href="#">Profile</a></li>
				<li><a href="#">Help</a></li>
			</ul>
			<form class="navbar-form navbar-right">
				<input type="text" class="form-control" placeholder="Search..."
					title="Search anything here">
			</form>
		</div>
	</div>
	</nav>


	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li class="placeholder">&nbsp; &nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/details.jpg"
					width="150" height="150" class="img-responsive"
					alt="Generic placeholder thumbnail"> <%-- <span class="text-muted center">Receptionist</span>--%>
				</li>
			</ul>
			<ul class="navbar navbar-sidebar navbar-inverse">
				<a href="doctorhome.jsp" title="Go to Today's History">History
					(Today)</a>
			</ul>


		</div>
	</div>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h3 class="page-header pull-left">
			Dashboard
			<h3 class="page-header pull-right">
				<span id="date_time"></span>
				<script type="text/javascript">
					window.onload = date_time('date_time');
				</script>
			</h3>
		</h3>
	</div>
	<div class="col-sm-8 col-sm-offset-3"></div>
	<a
		class="btn btn-primary btn-lg btn-fab btn-raised mdi-content-add btn-add-new-post"
		href="addpatient.jsp" title="Add New Patient to Queue">+</a>
	</div>
</body>
</html>