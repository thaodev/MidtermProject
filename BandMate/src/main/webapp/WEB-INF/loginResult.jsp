<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.skilldistillery.jpabandmate.entities.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Site</title>

<jsp:include page="bootstrapHead.jsp" />
<%
User user = (User) session.getAttribute("loggedInUser");
%>
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
	<c:choose>
		<c:when test="${empty user }">
			<c:out value="User wasn't being added"/>
		</c:when>
		<c:otherwise>
		<c:out value="User is added successfully"/>
		</c:otherwise>
	</c:choose>
	
<jsp:include page="bootstrapFoot.jsp" />
<jsp:include page="footer.jsp" />
</body>
</html>