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
<style>
.table td th {
    white-space: nowrap;
    width: 1%;
}
</style>

</head>
<body>

<jsp:include page="navbarController.jsp" />
	<div class="row">
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
		<table class="table table-sm table-striped ">

			<thead>

				<tr class="table-warning">
					<th scope="col">Event</th>
					<th scope="col">Number Of Ticket</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="entry" items="${ticketByEvent.entrySet()}">
					<tr>
						<td><a href="showTicketByEventDetails.do?eventId=${entry.key.id}">
						<c:out value="${entry.key.name}" /></a></td>
						<td><c:out value="${entry.value}" /></td>
				

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