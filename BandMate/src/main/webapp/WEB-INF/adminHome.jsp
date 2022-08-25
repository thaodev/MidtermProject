<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.skilldistillery.jpabandmate.entities.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Band Mate</title>
<!-- CSS only -->
<jsp:include page="bootstrapHead.jsp" />
<jsp:include page="adminNavbar.jsp" />
<style>
body {
	background-image:
		url("https://img.freepik.com/free-vector/musical-notes-with-sound-wave-background_1017-32863.jpg?w=996&t=st=1661054925~exp=1661055525~hmac=6701dec3cf9ce528260092c769a7fd00b098c6b62b37e3664874b3a6d7fa6faf")
}
</style>

</head>
<body>
	<div class=container>
		<div class="card-columns">
			<div class="row">
				<div class="col"></div>
				<div class="col	">
					<div class="card float-right" style="width: 20rem;">
						<div class="card-body bg-secondary">
							<h4 class="card-title">Users</h4>
							<h6 class="card-subtitle text-muted"></h6>
							<p class="card-text">You can create, edit, or delete a User account through here.</p>
							<a class="btn btn-outline-dark bg-white" href="showAllUserBy1stPage.do">View
								Details</a>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card" style="width: 20rem;">
						<div class="card-body bg-success">
							<h4 class="card-title">Events</h4>
							<h6 class="card-subtitle text-muted"></h6>
							<p class="card-text">Create your upcoming events and don't
								forget to delete the old ones...</p>
							<a class="btn btn-outline-dark bg-white" href="eventPageAdmin.do">View
								Details</a>
						</div>
					</div>
				</div>
				<div class="col"></div>
			</div>
			<div class="row">
				<div class="col"></div>
				<div class="col">
					<div class="card float-right" style="width: 20rem;">
						<div class="card-body bg-warning">
							<h4 class="card-title">Venues</h4>
							<h6 class="card-subtitle text-muted"></h6>
							<p class="card-text">Have a new spot to host an event? Create, edit, or delete a Venue through here.</p>
							<a class="btn btn-outline-dark bg-white" href="venueAdmin.do">View
								Details</a>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card" style="width: 20rem;">
						<div class="card-body" style="background-color: pink">
							<h4 class="card-title">Musicians</h4>
							<h6 class="card-subtitle text-muted"></h6>
							<p class="card-text">Take a closer look into our musicians. Create, edit, or delete a Musician account through here.</p>
							<a class="btn btn-outline-dark bg-white" href="musicianListPage.do">View
								Details</a>
						</div>

					</div>

				</div>
				<div class="col"></div>
			</div>
			<div class="row">
				<div class="col"></div>
				<div class="col">
					<div class="card" style="width: 20rem;">
						<div class="card-body bg-info">
							<h4 class="card-title">Bands</h4>
							<h6 class="card-subtitle text-muted"></h6>
							<p class="card-text">Manage band information and band accounts through here. Create, edit, or delete a Band account through here.</p>
							<a class="btn btn-outline-dark bg-white" href="bandListPage.do">View
								Details</a>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card" style="width: 20rem;">
						<div class="card-body">
							<h4 class="card-title">Reviews</h4>
							<h6 class="card-subtitle text-muted"></h6>
							<p class="card-text">Manage reviews through here.</p>
							<a class="btn btn-outline-dark" href="performanceReviewList.do">View Details</a>
						</div>
					</div>
				</div>
				<div class="col"></div>
			</div>
			<div class="row">
				<div class="col"></div>
				<div class="col">
					<div class="card" style="width: 20rem;">
						<div class="card-body" style="background-color: 255-102-102">
							<h4 class="card-title">Tickets</h4>
							<h6 class="card-subtitle text-muted"></h6>
							<p class="card-text">Look into our Ticket activity.</p>
							<a class="btn btn-outline-dark bg-white" href="showTicket.do">View
								Details</a>
						</div>
					</div>
				</div>
				<div class="col">
				<div class="card" style="width: 20rem;"></div>
				</div>

				<div class="col"></div>
			</div>
		</div>
	</div>
	<jsp:include page="bootstrapFoot.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>