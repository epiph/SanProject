<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/Stude" user="root" password=" " />

<sql:update dataSource="${snapshot}" var="result">
 delete from ChemistQueue where regNumber = ?
<sql:param value="${param.regNumber}"></sql:param>
</sql:update>

<title>Delete from Chemist Queue</title>
</head>
<body>
	<c:if test="${result==1}">
		<font size="5" color='green'> Congratulations ! Data deleted
			successfully.</font>
		<a href="chemisthome.jsp">Go Home</a>
		<c:redirect url="chemisthome.jsp" />
	</c:if>
	<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
</body>
</html>