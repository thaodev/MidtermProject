<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import ="com.skilldistillery.jpabandmate.entities.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Band Mate</title>
<!-- CSS only -->
<jsp:include page="bootstrapHead.jsp" />
<%User user = (User)session.getAttribute("loggedInUser"); %>
<c:choose>
	<c:when test="${empty user}">
		<jsp:include page="navbar.jsp" />
	</c:when>
	<c:otherwise>
	<jsp:include page="navbarWUserLoggedIn.jsp" />
	</c:otherwise>
</c:choose>

</head>
<body>

<div class="container-fluid">
	<h1>Welcome to Band Mate</h1>
	${SMOKETEST}
	<form action="" class="form-group mx-sm-3 mb-2  ms-auto">
		<input type="search" class="rounded" name="search" placeholder=""
			aria-label="Search" aria-describedby="search-addon" />
		<button type="submit" class="btn btn-secondary mb-2">Search</button>
	</form>




</div>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>