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
		<div class="row">
			<div class="col">
				<div class="card" style="width: 20rem;">
					<div class="card-body">
						<h4 class="card-title">Users</h4>
						<h6 class="card-subtitle text-muted">Card subtitle</h6>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Illo, quas.</p>
						<a class="btn btn-outline-primary" href="#">Read More</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card" style="width: 20rem;">
					<div class="card-body">
						<h4 class="card-title">Events</h4>
						<h6 class="card-subtitle text-muted">Card subtitle</h6>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Illo, quas.</p>
						<a class="btn btn-outline-primary" href="#">Read More</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="card" style="width: 20rem;">
					<div class="card-body">
						<h4 class="card-title">Venues</h4>
						<h6 class="card-subtitle text-muted">Card subtitle</h6>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Illo, quas.</p>
						<a class="btn btn-outline-primary" href="#">Read More</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card" style="width: 20rem;">
					<div class="card-body">
						<h4 class="card-title">Musicians</h4>
						<h6 class="card-subtitle text-muted">Card subtitle</h6>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Illo, quas.</p>
						<a class="btn btn-outline-primary" href="#">Read More</a>
					</div>

				</div>
			</div>
		</div>

	</div>
	<jsp:include page="bootstrapFoot.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>