<%@ page session="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/Stude" user="root" password=" " />


<sql:query dataSource="${snapshot}" var="result">
SELECT * from ReceptionistQueue order by time;
</sql:query>

<!DOCTYPE html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/dashboard.css" rel="stylesheet">
<script type="text/javascript" src="js/date_time.js"></script>

<script>
	function confirmGo(m, u) {
		if (confirm(m)) {
			window.location = u;
		}
	}
</script>
<title>Pulse | Queue</title>
<%
	response.setIntHeader("Refresh", 10);
%>


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
				<a class="navbar-brand" href="ReceptionistHome.jsp"><i><strong>Pulse</strong></i></a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="doctorhome.jsp">History</a></li>
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

	<div class="container">
		<h2 class="sub-header pull-left">
			Today's Patients onQueue
			<h2 class="sub-header pull-right">
				<span id="date_time"></span>
				<script type="text/javascript">
					window.onload = date_time('date_time');
				</script>
			</h2>
		</h2>
	</div>
	<div
		class="table-responsive col-md-8 col-lg-8 col-lg-offset-2 col-md-offset-1">
		<table class="table table-responsive table-striped table-hover">
			<thead>
				<tr>
					<th>Reg.Number</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Gender</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="student" items="${result.rows}">
					<tr>
						<td><a
							href="diagnosis.jsp?regNumber=<c:out value="${student.regNumber}"/>"><c:out
									value="${student.regNumber}" /></a></td>
						<td><c:out value="${student.firstName}" /></td>
						<td><c:out value="${student.lastName}" /></td>
						<td><c:out value="${student.gender}" /></td>
						<td><a class="btn btn-danger btn-sm"
							href="javascript:confirmGo('Sure to dequeue this patient?','delete.jsp?regNumber=<c:out value="${student.regNumber}"/>')">DeQueue</a></td>
					</tr>
				</c:forEach>
		</table>
</body>
</html>