<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pulse | Diagnosis & Prescription</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap3-wysihtml5.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/Stude" user="root" password=" " />

<sql:update dataSource="${snapshot}" var="result">
 insert into DoctorToPharmacist values(?,?,?)
<sql:param value="${param.regNumber}"></sql:param>
	<sql:param value="${param.diagnosis}"></sql:param>
	<sql:param value="${param.prescription}"></sql:param>
</sql:update>
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
			<a class="navbar-brand" href="index.jsp"><i
				class="fa fa-fw fa-lg fa-heartbeat" style="color: white"></i></a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="History.jsp">History</a></li>
				<li><a href="#">Settings</a></li>
				<li><a href="#">Profile</a></li>
				<li><a href="#">Help</a></li>
			</ul>
			<form class="navbar-form navbar-right">
				<input type="text" class="form-control" placeholder="Search Reg No."
					name="regNumber">
			</form>
		</div>
	</div>
	</nav>

	<div class="container">

		<div class="col-sm-6 col-sm-offset-3">
			<div class="">
				<h2 class="sub-header pull-left">
					<br> Use the forms below to capture the patient's Diagnosis
					and Prescription <br>
				</h2>
				<small>Diagnosis</small>

			</div>

			<div>
				<form method="POST">
					<textarea class="textarea"
						style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd;"
						name="diagnosis">
				</textarea>
					<hr>
					<br>
					<p>Prescription</p>
					<textarea class="textarea"
						style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd;"
						placeholder="Descto" name="prescription">
				</textarea>
					<br> <br>
					<div>
						<button id="btnSubmit" type="submit"
							class="btn btn-primary col-md-8">Add to Queue</button>
						<button id="btnCancel" type="reset"
							class="btn btn-danger pull-right col-md-3">Cancel</button>

					</div>

				</form>

			</div>
		</div>
	</div>
</body>
</html>