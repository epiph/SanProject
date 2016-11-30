<%@ page session="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/Stude" user="root" password=" " />


<sql:query dataSource="${snapshot}" var="result">
SELECT prescription from ChemistQueue where regNumber = ?
<sql:param value="${param.regNumber}"></sql:param>
</sql:query>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pulse | Pharmacy</title>

<link href="css/bootstrap.min.css" rel="stylesheet">

<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
<script>
	function confirmGo(m, u) {
		if (confirm(m)) {
			window.location = u;
		}
	}
</script>

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
				<li><a href="pharmacy.jsp">Back To ChemistQueue</a></li>
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
					<br> Please give the patient the following drugs<br>
				</h2>


			</div>

			<div>
				<form method="POST">


					<div class="form-group">
						<label for="Prescription">Prescription</label>
						
						<textarea class="form-control" rows="5" id="prescription"
							name="prescription" readonly>
							<c:forEach var="student" items="${result.rows}">
								<c:out value="${student.prescription}" />
							</c:forEach>
						</textarea>

					</div>
					<div>

					

						<a class="btn btn-danger btn-sm"
							href="javascript:confirmGo('Sure to dequeue this patient?','delChemist.jsp?regNumber=<c:out value="${param.regNumber}"/>')">DeQueue</a>
					

					</div>


				</form>

			</div>
		</div>
	</div>
</body>
</html>