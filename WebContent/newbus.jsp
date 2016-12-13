<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">

<title>Book Bus</title>
</head>
<body>
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
				<a class="navbar-brand" href="index.jsp"><i><strong>HopABus</strong></i></a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="AddPassenger">History</a></li>

					<li><a href="#">Help</a></li>
				</ul>
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search..."
						name="busType">
				</form>
			</div>
		</div>
	</nav>


	<div class="container">
		<hr>
		<br>
		<div class="col-md-8 col-md-offset-2">

			<p>Use this form to capture the Bus details</p>

			<%
				if (request.getAttribute("errors") != null) {
			%>
			<div class="alert alert-danger text-center" role="alert">
				Ensure you fill all the Bus fields.</div>
			<%
				}
			%>
<form action="AddBus" class="form-horizontal" method="POST">
		<table class="table table-striped">
			 	<div class="form-group">
					<label class="col-sm-2 control-label">Bus ID:</label>

					<div class="col-sm-6">
						<input name="BusId" type="text" class="form-control"
							placeholder="Bus Registration Number" required>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">Capacity:</label>

					<div class="col-sm-6">
						<input name="capacity" type="text" class="form-control"
							placeholder="Capacity" required>
					</div>
				</div>

					<div class="form-group">
					<label class="col-sm-2 control-label">Time</label>

					<div class="col-sm-6">
						<input name="time" type="text" class="form-control"
							placeholder="Bus available time" required>
					</div>
				</div>

				
				<div>

					<button id="btnSubmit" type="submit"
						class="btn btn-lg btn-success col-sm-offset-3">Register Bus</button>
					<a href="index.jsp" class="btn btn-lg btn-danger">Go back</a> 
				</div>

	
		</table>
	</form>

</body>
</html>