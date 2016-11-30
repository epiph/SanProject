<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Pulse | Add New Patient</title>


<link href="css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/Stude" user="root" password=" " />

<sql:query dataSource="${snapshot}" var="result">
SELECT * from Students where regNumber = ?
<sql:param value="${param.regNumber}"></sql:param>
</sql:query>


</head>

<body>
<%
	if (session.getAttribute("user")==null){
		
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
				<a class="navbar-brand" href="index.jsp"><i><strong>Pulse</strong></i></a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="doctorhome.jsp">History</a></li>
					<li><a href="#">Settings</a></li>
					<li><a href="#">Profile</a></li>
					<li><a href="#">Help</a></li>
				</ul>
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control"
						placeholder="Search Reg No." name="regNumber">
				</form>
			</div>
		</div>
	</nav>


	<div class="container">
		<hr>
		<br>
		<div class="col-md-8 col-md-offset-2">
			<p class="lead text-center">Use the following search bar to get
				the details of the patient</p>
			<p class="lead small text-center">Ensure you enter the
				Registration Number correctly, then press the Submit Button to post
				the request</p>


			<form class="form-inline col-md-8 col-md-offset-4" role="form"
				method="post">
				<div class="form-group">
					<label class="sr-only" for="regNumber">Registration Number</label>
					<input type="text" placeholder="Search Reg No."
						class="form-control" id="regNumber" name="regNumber">
				</div>
				<button title="Search Database for the Student Details"
					type="submit" class="btn btn-success">Query</button>
			</form>

			<hr>
			<hr>
			<form action="AddPatient" class="form-horizontal" method="POST">
				<table class="table table-striped">
					<c:forEach var="row" items="${result.rows}">

						<div class="form-group">
							<label class="col-sm-2 control-label">Registration Number</label>

							<div class="col-sm-6">
								<input name="regNumber" type="text" class="form-control"
									placeholder="Reg. Number" value="${row.regNumber}" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">First Name</label>

							<div class="col-sm-6">
								<input name="firstName" type="text" class="form-control"
									placeholder="First Name" value="${row.firstName}" readonly>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">Last Name</label>

							<div class="col-sm-6">
								<input name="lastName" type="text" class="form-control"
									placeholder="Last Name" value="${row.lastName}" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Gender</label>

							<div class="col-sm-6">
								<input name="gender" type="text" class="form-control"
									placeholder="Gender" value="${row.gender}" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Faculty</label>

							<div class="col-sm-6">
								<input name="faculty" type="text" class="form-control"
									placeholder="Faculty" value="${row.faculty}" readonly>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">Department</label>

							<div class="col-sm-6">
								<input name="department" type="text" class="form-control"
									placeholder="Department" value="${row.department}" readonly>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">Doctor's Name</label>

							<div class="col-sm-6">
								<input name="doctor" type="text" class="form-control"
									placeholder="Doctor's Name">
							</div>
						</div>


						<div>

							<button id="btnSubmit" type="submit"
								class="btn btn-primary col-md-8">Add to Queue</button>
							<button id="btnCancel" type="reset"
								class="btn btn-danger pull-right col-md-3">Cancel</button>

						</div>

					</c:forEach>
				</table>
			</form>
		</div>

	</div>
</html>