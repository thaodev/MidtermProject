<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.time.format.DateTimeFormatter, com.skilldistillery.jpabandmate.entities.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up Site</title>

<jsp:include page="bootstrapHead.jsp" />


</head>
<body>

<jsp:include page="navbarController.jsp" />
	<div class="row">
		<!--  -->
		<div class="col-md-3 offset-md-3"></div>
		<div class="col-md-3 offset-md-3">
			<form action="searchUserByName.do"
				class="form-group mx-sm-3 mb-2 mt-2">
				<input type="search" class="rounded" name="search"
					placeholder="Search By Name" aria-label="Search"
					aria-describedby="search-addon" />
				<button type="submit" class="btn btn-secondary mb-2">Search</button>
			</form>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row text-center">
			<h3>USER MASTER LIST</h3>
		</div>
		<table class="table table-striped ">

			<thead>

				<tr class="table-info">
					<th scope="col">Name</th>
					<th scope="col">Birthday</th>
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
						<td>${user.firstName} ${user.lastName}</td>
						<td><c:out value="${user.dobFormatted}" /></td>
						<td><c:out value="${user.username}" /></td>
						<td><c:out value="${user.address.street}" /></td>
						<td><c:out value="${user.address.city}" /></td>
						<td><c:out value="${user.phone}" /></td>
						<td><c:out value="${user.email}" /></td>
						<td><c:out value="${user.enabled}" /></td>
						<td><c:out value="${user.admin}" /></td>
						<td><a href="${updateLink}">Update</a>|<a
							href="${deleteLink}"
							onclick="if(!(confirm('Are you sure you want to delete this user?'))) return false">Delete</a></td>


					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="row ">
			<div class="col-sm text-center ">
				<a href="signUp.do" class="btn btn-warning" role="button"
					aria-pressed="true">Add User</a>
			</div>
		</div>
	</div>

	<jsp:include page="bootstrapFoot.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>