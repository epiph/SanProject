<%@ page session="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/Stude" user="root" password=" " />


<sql:query dataSource="${snapshot}" var="result">
SELECT ChemistQueue.regNumber, Students.firstName, Students.lastName, Students.gender from ChemistQueue 
join Students where ChemistQueue.regNumber=Students.regNumber order by ChemistQueue.time;
</sql:query>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/dashboard.css" rel="stylesheet">
<script type="text/javascript" src="js/date_time.js"></script>
<title>Pulse | Queue</title>
<%
	response.setIntHeader("Refresh", 10);
%>
<%
	if (session.getAttribute("user")==null){
		System.out.println("No Session Attr");
		response.sendRedirect("index.jsp");
	}
%>
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
				<a class="navbar-brand" href="ReceptionistHome.jsp"><i><strong>Pulse</strong></i></a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="chemisthome.jsp">Main</a></li>
					<li><a href="#">Settings</a></li>
					<li><a href="#">Profile</a></li>
					<li><a href="#">Help</a></li>
					<li><a href="ReceptionistHome.jsp">Home</a></li>
				</ul>
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search...">
				</form>
			</div>
		</div>
	</nav>
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li class="active"><a href="#">Overview <span
						class="sr-only">(current)</span></a></li>
				<li><a href="#">Reports</a></li>
				<li><a href="#">Analytics</a></li>
				<li><a href="#">Export</a></li>
			</ul>


		</div>
	</div>
	<div class="col-sm-8 col-sm-offset-3">
		<h2 class="sub-header pull-left">
			Chemist
			<h2 class="sub-header pull-right">
				<span id="date_time"></span>
				<script type="text/javascript">
					window.onload = date_time('date_time');
				</script>
			</h2>
		</h2>
	</div>
	<div class="table-responsive col-sm-8 col-sm-offset-2">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>Reg. Number</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Gender</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="student" items="${result.rows}">
					<tr>

						<td><a
							href="pharmacy.jsp?regNumber=<c:out value="${student.regNumber}"/>"><c:out
									value="${student.regNumber}" /></a></td>
						<td><c:out value="${student.firstName}" />
						<c:out
									value="${student.firstName}" /></td>
						<td><c:out value="${student.lastName}" /></td>
						<td><c:out value="${student.gender}" /></td>

					</tr>
				</c:forEach>
		</table>
</body>
</html>