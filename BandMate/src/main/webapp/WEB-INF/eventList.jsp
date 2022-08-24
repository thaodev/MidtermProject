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

			<table class="table table-stripped mt-3">
				<thead class="table-secondary">
					<tr>
						<!-- <th>ID</th> -->
						<th>Date</th>
						<th>Name</th>
						<th>Ticket Price</th>
						<th>Action</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="performance" items="${performances}">
						<tr>
							<%-- <td>${performance.id}</td> --%>

							<td>${performance.dateFormatted}</td>

							<td><a href="eventPage.do?id=${performance.id}">${performance.name}</a></td>

							<td><p>$ ${performance.ticketPrice}</p></td>
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

</body>
</html>