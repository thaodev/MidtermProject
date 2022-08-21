<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.skilldistillery.jpabandmate.entities.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up Site</title>

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
	<div class="row">
		<!--  -->
		<div class="col-md-3 offset-md-3"></div>
		<div class="col-md-3 offset-md-3">
			<form action="searchByUserLastName.do"
				class="form-group mx-sm-3 mb-2 ">
				<input type="search" class="rounded" name="search"
					placeholder="Search By Name" aria-label="Search"
					aria-describedby="search-addon" />
				<button type="submit" class="btn btn-secondary mb-2">Search</button>
			</form>
		</div>
	</div>
	<div class="container-fluid">
		<!-- 	    <form action="searchByClient.do" class="form-inline float-left " >my-2 my-lg-0
      <input class="form-control mr-sm-2" type="search" name="search" placeholder="Type client name" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search By Client</button>
    </form> -->

		<div class="row text-center">
			<h3>USER MASTER LIST</h3>
		</div>
		<table class="table table-striped ">

			<thead>

				<tr class="table-info">
					<th scope="col">Name</th>
					<th scope="col">Username</th>
					<th scope="col">Street Address</th>
					<th scope="col">City</th>
					<th scope="col">Phone</th>
					<th scope="col">Email</th>
					<th scope="col">Enabled</th>
					<th scope="col">Admin</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${users}">
					<!-- construct an delete link with schedule id  -->
					<c:url var="updateLink" value="updateUser">
						<c:param name="id" value="${user.id}" />
					</c:url>
					<!-- construct an update link with schedule id  -->
					<c:url var="deleteLink" value="deleteUser">
						<c:param name="id" value="${user.id}" />
					</c:url>
					<tr>
						<td>${user.firstName}${user.lastName}</td>
						<td><c:out value="${user.username}" /></td>
						<td><c:out value="${user.address.street}" /></td>
						<td><c:out value="${user.address.city}" /></td>
						<td><c:out value="${user.phone}" /></td>
						<td><c:out value="${user.email}" /></td>
						<td><c:out value="${user.enabled}" /></td>
						<td><c:out value="${user.admin}" /></td>
						<td><a href="${updateLink}">Update</a>|<a
							href="${deleteLink}"
							onclick="if(!(confirm('Are you sure you want to delete this schedule?'))) return false">Delete</a></td>


					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="row ">
			<div class="col-sm text-center ">
				<a href="addUser.do" class="btn btn-warning" role="button"
					aria-pressed="true">Add User</a>
			</div>
		</div>
	</div>

	<jsp:include page="bootstrapFoot.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>