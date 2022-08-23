<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.skilldistillery.jpabandmate.entities.User"%>

<c:choose>
<c:when test="${not empty sessionScope.loggedInUser}">
	<c:choose>
		<c:when test="${sessionScope.loggedInUser.admin == true }">
			<jsp:include page="adminNavbar.jsp" />
		</c:when>
		<c:otherwise>
			<jsp:include page="navbarWUserLoggedIn.jsp" />
		</c:otherwise>
	</c:choose>
	
</c:when>
<c:otherwise>
	<jsp:include page="navbar.jsp" />
</c:otherwise>
</c:choose>


<!--  <div class="navbar-nav ms-auto">
     <a href="">Login</a>|<a href="">Sign Up</a>
    </div> -->