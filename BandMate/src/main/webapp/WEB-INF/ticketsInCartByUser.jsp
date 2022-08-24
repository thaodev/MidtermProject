<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page
	import="java.util.*, java.time.format.DateTimeFormatter, com.skilldistillery.jpabandmate.entities.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket Master List</title>

<jsp:include page="bootstrapHead.jsp" />


</head>
<body>

	<jsp:include page="navbarController.jsp" />
	<div class="row">
		<!--  -->
		<div class="col-md-3 offset-md-3"></div>
		<div class="col-md-3 offset-md-3">
			<form action="searchTicketByEvent.do"
				class="form-group mx-sm-3 mb-2 mt-2">
				<input type="search" class="rounded" name="search"
					placeholder="Search By Event Or Venue" aria-label="Search"
					aria-describedby="search-addon" />
				<button type="submit" class="btn btn-secondary mb-2">Search</button>
			</form>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row text-center">
			<h3>TICKETS IN SHOPPING CART</h3>
		</div>
		<c:choose>
			<c:when test="${empty ticketSales }">
				<p>Your shopping cart is empty</p>
			</c:when>
			<c:otherwise>
				<table class="table table-striped ">

					<thead>

						<tr class="table-danger">
							<th scope="col">Event</th>
							<th scope="col">Ticket Price</th>
							<th scope="col">&#9200 Event Date</th>
							<th scope="col">Quantity</th>
							<th scope="col">Amount</th>
							<!-- <th scope="col">Duration</th> -->
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="entry" items="${ticketSales}">
							<c:if test="${entry.value[1] > 0}">
								<c:url var="deleteLink" value="deleteTicketsInCard">
									<c:param name="id" value="${entry.key.id}" />
								</c:url>
								<tr>
									<td><c:out value="${entry.key.name}" /></td>
									<td><fmt:formatNumber type="currency"
											value="${entry.key.ticketPrice}" /></td>
									<td><c:out value="${entry.key.performanceDate}" /></td>
									<td><c:out value="${entry.value[0]}" /></td>
									<td><fmt:formatNumber type="currency"
											value="${entry.value[1]}" /></td>
									<c:set var="total" value="${total + entry.value[1]}" />
									<%-- <td><c:set var="duration" value="${ticket.performance.endTime-ticket.performance.startTime}" />
						<c:out value="${duration}"/> 
						</td>--%>
									<td><a href="${deleteLink}"
										onclick="if(!(confirm('Are you sure you want to remove this ticket?'))) return false">Remove</a></td>

							</tr>
							</c:if>
						</c:forEach>
						<tr style="font-size: 20px; font-style: bold">
							<td colspan="4" class="justify-content-end">Total:</td>
							<td><fmt:formatNumber type="currency" value="${total}" /></td>
							<td></td>
						</tr>
					</tbody>
				</table>

				<div class="row ">
					<div class="col-sm text-center ">
						<a href="checkout.do" class="btn btn-warning" role="button"
							aria-pressed="true">Checkout</a>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>


	<jsp:include page="bootstrapFoot.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>