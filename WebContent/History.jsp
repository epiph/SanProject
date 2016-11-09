


<%@ page session="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/Stude" user="root" password=" " />


<sql:query dataSource="${snapshot}" var="result">
SELECT * from StudeDetails;
</sql:query>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/dashboard.css" rel="stylesheet">
<title>Item Page</title>

</head>

<body>
	<%
		response.setIntHeader("Refresh", 5);
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
				<a class="navbar-brand" href="ReceptionistHome.jsp"><i><strong>Pulse</strong></i></a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="History.jsp">History</a></li>
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
	<h2 class="sub-header text-center">History</h2>

	<div class="table-responsive">
		<table class="table table-striped">
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
						<td><c:out value="${student.regNumber}" /></td>
						<td><c:out value="${student.firstName}" /></td>
						<td><c:out value="${student.lastName}" /></td>
						<td><c:out value="${student.gender}" /></td>
					</tr>
				</c:forEach>
		</table>
</body>
</html>