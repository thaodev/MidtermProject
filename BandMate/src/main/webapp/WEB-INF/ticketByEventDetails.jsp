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
			<h3>TICKET MASTER LIST</h3>
		</div>
		<table class="table table-striped ">

			<thead>

				<tr class="table-danger">
					<th scope="col">Event</th>
					<th scope="col">Purchaser</th>
					<th scope="col">Ticket Price</th>
					<th scope="col">Sale Date</th>
					<th scope="col">Event Date</th>
					<th scope="col">Venue</th>
					<th scope="col">Start Time</th>
					<th scope="col">End Time</th>
					<!-- <th scope="col">Duration</th> -->
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ticket" items="${ticketSales}">
					<!-- construct an delete link with schedule id  -->
					<c:url var="deleteLink" value="deleteUser">
						<c:param name="id" value="${ticketr.id}" />
					</c:url>
					<tr>
						<td><c:out value="${ticket.performance.name}" /></td>
						<td>${ticket.user.firstName} ${ticket.user.lastName}</td>
						<td><fmt:formatNumber type="currency" value="${ticket.ticketPrice}" /></td>
						<td><c:out value="${ticket.saleDate}" /></td>
						<td><c:out value="${ticket.performance.performanceDate}" /></td>
						<td><c:out value="${ticket.performance.venue.name}" /></td>
						<td><c:out value="${ticket.performance.startTime}" /></td>
						<td><c:out value="${ticket.performance.endTime}" /></td>
						<%-- <td><c:set var="duration" value="${ticket.performance.endTime-ticket.performance.startTime}" />
						<c:out value="${duration}"/> 
						</td>--%>
						<td><a href="${deleteLink}"
							onclick="if(!(confirm('Are you sure you want to delete this ticket?'))) return false">Delete</a></td>


					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="row ">
			<div class="col-sm text-center ">
				<a href="addTicket.do" class="btn btn-warning" role="button"
					aria-pressed="true">Add Ticket</a>
			</div>
		</div>
	</div>

	<jsp:include page="bootstrapFoot.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>