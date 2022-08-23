<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.skilldistillery.jpabandmate.entities.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Ticket Sale</title>

<jsp:include page="bootstrapHead.jsp" />

</head>
<body>
	<jsp:include page="navbarController.jsp" />
	<c:if test="${not empty errorMsg }">
		<%-- 		<p style="font-size: 10px; font-color: red">
			<c:out value="${errorMsg}" />
		</p> --%>
		<c:out value="${errorMsg }" />
	</c:if>
	<div class="container mt-3">
		<h3 class="text-center">CREATE EVENT TICKET</h3>
		<form action="showTicket.do" method="POST">
			<%-- <input type="hidden" name="id" value="<c:out value= "${ticket.id}"/>" /> --%>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Event*</span>
				</div>
				<div>${performance.name }</div>
<%-- 				<input class="form-control" type="text"
					value="${performance.name }" required> --%>
			</div>
			<br>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Purchaser First Name*</span>
				</div>
				<input class="form-control" type="text"
	  	placeholder="Enter First Name" required name="user.firstName">
			</div>
			<br>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Purchaser Last Name*</span>
				</div>
				<input class="form-control" type="text"
					placeholder="Enter Last Name" required name="user.firstName">
			</div>
			<br>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Ticket Price*</span>
				</div>
				<input class="form-control" type="text" required name="performance.ticketPrice"
					value="${performance.ticketPrice}">
			</div>
			<br>
			<input type="hidden" name="performance.id" value="${performance.id}"/>
			<input type="hidden" name="user.id" value="${loggedInUser.id}"/>
			<button class="btn btn-info btn-lg btn-block text-center"
				type="submit">Submit</button>
		</form>
	</div>
	<jsp:include page="bootstrapFoot.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>