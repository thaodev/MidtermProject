<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Events</title>
<!-- CSS only -->
<jsp:include page="bootstrapHead.jsp" />

</head>
<body>

	<jsp:include page="navbarController.jsp" />

	<c:choose>
		<c:when test="${! empty performances}">
		<div class="h1 text-center">REGISTER TICKETS BEFORE THEY ARE GONE FOR OUR CONCERTS BELOW</div>
		<c:if test="${empty loggedInUser}"><p class="text-center"> &#127927 Please log in or become our member in order to reserve tickets &#127928 </p></c:if>
			<table class="table table-stripped mt-3">
				<thead class="table-secondary">
					<tr>
						<!-- <th>ID</th> -->
						<th>Date</th>
						<th>Name</th>
						<th>Ticket Price</th>
						<c:if test="${not empty loggedInUser}"><th>Action</th></c:if>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="performance" items="${performances}">
						<tr>
							<%-- <td>${performance.id}</td> --%>

							<td>${performance.dateFormatted}</td>

							<td><a href="eventPage.do?id=${performance.id}">${performance.name}</a></td>

							<td><p>$ ${performance.ticketPrice}</p></td>
							<c:if test="${not empty loggedInUser}">
							<td><form action="addTicketByEventByNonAdmin.do"
									method="POST">
									<input type="hidden" name="performance.id"
										value="${performance.id}" /> <input type="hidden"
										name="performance.ticketPrice"
										value="${performance.ticketPrice}" /> <input type="hidden"
										name="user.id" value="${loggedInUser.id}" />
									<button class="btn btn-secondary btn-sm btn-block text-center"
										type="submit">Add Ticket</button>
								</form></td>
								</c:if>
						</tr>

					</c:forEach>

				</tbody>
			</table>


		</c:when>

		<c:otherwise>
			<h3>No Performances Found</h3>
		</c:otherwise>
	</c:choose>
	<c:if test="${not empty loggedInUser}">
	<div class="row ">
		<div class="col-sm text-center ">
			<a href="showTicketsInCart.do" class="btn btn-warning" role="button"
				aria-pressed="true">Show All Purchase Tickets</a>
		</div>
	</div>
	</c:if>
	<jsp:include page="bootstrapFoot.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>