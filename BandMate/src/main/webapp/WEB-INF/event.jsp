<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event</title>
<!-- CSS only -->
<jsp:include page="bootstrapHead.jsp" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" />



</head>
<body>

	<jsp:include page="navbarController.jsp" />
	<div class="container-fluid">
		<c:choose>
			<c:when test="${! empty performance}">

				<table class="table table-stripped mt-3">
					<thead style="background-color: #a3a3c2">
						<tr>
							<!-- <th>ID</th> -->
							<th>Date</th>
							<th>Name</th>
							<th>Venue</th>
							<th>Band</th>
							<th>Ticket Price</th>
							<th>Start Time</th>
							<th>End Time</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<%-- <td>${performance.id}</td> --%>

							<td>${performance.dateFormatted}</td>

							<td>${performance.name}</td>

							<td>${performance.venue.name}</td>

							<td>${performance.band.name}</td>

							<td><p>$ ${performance.ticketPrice}</p></td>

							<td>${performance.startTime.hour%12}:<fmt:formatNumber
									pattern="00" value="${performance.startTime.minute}" /></td>

							<td>${performance.endTime.hour%12}:<fmt:formatNumber
									pattern="00" value="${performance.endTime.minute}" /></td>

						</tr>


					</tbody>
				</table>

				<table class="table table-stripped mt-3">
					<thead style="background-color: #a3a3c2">
						<tr>
							<th style="text-align: center">Venue</th>
						</tr>
				</table>
				<div style="text-align: center;">
					<img src="${performance.venue.venueImageUrl}" width="autopx"
						height="350px" />
				</div>
				
				<div>
				<table class="table table-stripped mt-3">
					<thead style="background-color: #a3a3c2">
					<tr>
							<th style="text-align: center">Rating</th>
						</tr>
					</table>
				</div>
				<c:choose>
					<c:when test="${not empty sessionScope.loggedInUser }">

						<h1 class="justify-content-center">Rate: ${performance.name }</h1>
						<c:forEach var="review" items="${performance.reviews}">
							<strong><c:out value="${review.user.username }"/>:</strong> <br>
							<c:out value="Rating: ${review.rating} / Comment: ${review.ratingComment}"/><br>
						</c:forEach>
						<c:if test="${ !loggedInUser.hasPerformanceReview(performance.id)}">

						<form action="performanceReview.do" method="POST">
							<input type="hidden" name="id.performanceId" value="${performance.id}"/>
							<input type="hidden" name="id.userId" value="${loggedInUser.id}"/>
							<input type="hidden" name="performance.id" value="${performance.id}"/>
							<input type="hidden" name="user.id" value="${loggedInUser.id}"/>
							<!-- <input type="hidden" name="id" value="performanceReview.id"/> -->
							<div class="rating">

								<input type="radio" name="rating" value="5" id="5"><label
									for="5">☆</label> <input type="radio" name="rating" value="4"
									id="4"><label for="4">☆</label> <input type="radio"
									name="rating" value="3" id="3"><label for="3">☆</label>
								<input type="radio" name="rating" value="2" id="2"><label
									for="2">☆</label> <input type="radio" name="rating" value="1"
									id="1"><label for="1">☆</label>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
								</div>
								<input class="form-control" type="text" required
									name="ratingComment"
									value="${performanceReview.ratingComment }" style="height:100px; margin:5px"
								placeholder="Write review comment here">
							</div>
							<br>
							<div>
								<button type="submit" class="btn btn-warning"
									data-toggle="button" aria-pressed="false"> Submit </button>


							</div>
						</form>
						</c:if>
					</c:when>
					<c:otherwise>
						<p class="text-center">Please login to leave review!</p>
					</c:otherwise>

				</c:choose>

			</c:when>

			<c:otherwise>
				<h3>No Performances Found</h3>
			</c:otherwise>
		</c:choose>

	</div>
	<jsp:include page="bootstrapFoot.jsp" />

</body>
</html>