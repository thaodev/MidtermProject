<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page
	import="com.skilldistillery.jpabandmate.entities.User, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Profile</title>

<jsp:include page="bootstrapHead.jsp" />

</head>
<body>
	<c:choose>
		<c:when test="${not empty sessionScope.loggedInUser}">
			<c:out value="${ sessionScope.loggedInUser.getUsername()}" />
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>
	out.println("user is " + user.getUsername());

	<jsp:include page="navbarController.jsp" />

	<div class="container mt-3">
		<h3 class="text-center">MY PROFILE</h3>
		<table class="table">
			<tr>
				<th>First Name</th>
				<td><c:out value="${user.firstName }" /></td>
			</tr>
			<tr>
				<th>Last Name</th>
				<td>${user.lastName }</td>
			</tr>
			<tr>
				<th>Username</th>
				<td>${user.username }</td>
			</tr>
			<tr>
				<th>Password</th>
				<td>${ user.password}</td>
			</tr>
			<tr>
				<th>Email</th>
				<td>${user.email }</td>
			</tr>
			<tr>
				<th>Phone</th>
				<td>${user.phone }</td>
			</tr>
			<tr>
				<th>Date of Birth</th>
				<td>${user.dob }</td>
			</tr>
			<tr>
				<th>Address</th>
				<td>${user.address.street },${user.address.city },
					${user.address.state }, ${user.address.zipCode }</td>
			</tr>
			<tr>
				<th>Biography</th>
				<td>${user.bio }</td>
			</tr>
		</table>

		<form action="updateUser.do" method="POST">
			<input type="hidden" name="id" value="<c:out value= "${user.id}"/>" />
			<button class="btn btn-info btn-lg btn-block text-center"
				type="submit">Update profile</button>
		</form>
	</div>
	<jsp:include page="bootstrapFoot.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>