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

<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
<script>
	function confirmGo(m, u) {
		if (confirm(m)) {
			window.location = u;
		}
	}
</script>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/Stude" user="root" password=" " />

<sql:query dataSource="${snapshot}" var="result">
select * from ChemistQueue where regNumber = ?
<sql:param value="${param.regNumber}"></sql:param>

</sql:query>
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
				<li><a href="doctorhome.jsp">Back</a></li>
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
					<br> These are the Medical records for the Patient
					<c:forEach var="student" items="${result.rows}">
						<c:out value="${student.regNumber}" /> at <c:out
							value="${student.time}" />
					</c:forEach>
					<br>
				</h2>


			</div>

			<div>
				<form method="POST">
					<div class="form-group">
						<label for="Diagnosis">Diagnosis</label>
						<textarea class="form-control" rows="5" id="diagnosis"
							name="diagnosis" value="${student.diagnosis}" readonly>
							<c:forEach var="student" items="${result.rows}">
								<c:out value="${student.diagnosis}" />
							</c:forEach>
							</textarea>

					</div>
					<br> <br>
					<div class="form-group">
						<label for="Prescription">Prescription</label>
						<textarea class="form-control" rows="5" id="prescription"
							name="prescription" value="${student.prescription}" readonly>
							<c:forEach var="student" items="${result.rows}">
								<c:out value="${student.prescription}" />
							</c:forEach></textarea>

					</div>


				</form>

			</div>
		</div>
	</div>
</body>
</html>