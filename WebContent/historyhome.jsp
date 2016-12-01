<%@ page session="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/Stude" user="root" password=" " />


<sql:query dataSource="${snapshot}" var="result">
SELECT * from History order by TreatmentDate;
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
</head>

<body>
<%
	if (session.getAttribute("doctor")==null){
		
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
					<li><a href="doctorhome.jsp">Main</a></li>
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
	
	<div class="col-sm-8 col-sm-offset-3">
		<h2 class="sub-header pull-left">
			Todays Queue:
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
					<th>Time</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="student" items="${result.rows}">
					<tr>

						<td><c:out value="${student.regNumber}" /></td>

						<td><a href='history.jsp?regNumber=<c:out value="${student.regNumber}" />&TreatmentDate=<c:out value="${student.TreatmentDate}" />'><c:out value="${student.TreatmentDate}" /></a></td>

					</tr>
				</c:forEach>
		</table>
</body>
</html>