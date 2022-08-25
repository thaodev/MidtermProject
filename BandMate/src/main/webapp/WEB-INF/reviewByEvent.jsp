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
<title>Review Master List</title>

<jsp:include page="bootstrapHead.jsp" />


</head>
<body>

	<jsp:include page="navbarController.jsp" />
	<!-- 	<div class="row">
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
	</div> -->
	<div class="container-fluid">
		<div class="row text-center">
			<h3>REVIEW MASTER LIST</h3>
		</div>
		<table class="table table-sm table-striped ">

			<thead>

				<tr class="table-warning">
					<th scope="col">Event</th>
					<!-- <th scope="col">Review</th> -->
					<th scope="col" >Number of Tickets sold</th>
					<th colspan="3" class="text-cent">Reviews</th>
				</tr>
			<!-- 	<tr class="table-warning">
					<th scope="col">Username</th>
					<th scope="col">Rating</th>
					<th scope="col">Comment</th>
				</tr> -->

			</thead>
			<tbody>
				<c:forEach var="entry" items="${reviewsByEvent.entrySet()}">

					<tr>
						<td><a
							href="showTicketByEventDetails.do?eventId=${entry.key.id}"> <c:out
									value="${entry.key.name}" />
						</a></td>
						<td><c:out value="${entry.value[0]}" /></td>
						<td>
							<table>
								<tbody>
									<c:forEach var="review" items="${entry.key.reviews }">
										<tr>
											<td> <c:out value="${review.user.username}" /></td>
											<td><c:out value="${review.rating}" /></td>
											<td><c:out value="${review.ratingComment}" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</td>
				</c:forEach>
			</tbody>
		</table>

	</div>

	<jsp:include page="bootstrapFoot.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>