<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.skilldistillery.jpabandmate.entities.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Band Mate</title>
<!-- CSS only -->
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

	<div class="container-fluid">
	
 <!-- PAGINATION RIGHT -->
        <nav>
            <ul class="pagination justify-content-end">
                <li class="page-item">
                    <a class="page-link" href="#">Previous</a>
                </li>
                <li class="page-item active">
                    <a class="page-link" href="#">1</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">3</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                </li>
            </ul>
        </nav>
	</div>
	<jsp:include page="bootstrapFoot.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>