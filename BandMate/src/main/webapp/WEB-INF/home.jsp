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
<%
User user = (User) session.getAttribute("loggedInUser");
%>
<c:choose>
	<c:when test="${empty user}">
		<jsp:include page="navbar.jsp" />
	</c:when>
	<c:otherwise>
		<jsp:include page="navbarWUserLoggedIn.jsp" />
	</c:otherwise>
</c:choose>

</head>
<body>

	<div class="container-fluid">
		<h1>Welcome to Band Mate</h1>
		${SMOKETEST}
		<form action="" class="form-group mx-sm-3 mb-2  ms-auto">
			<input type="search" class="rounded" name="search" placeholder=""
				aria-label="Search" aria-describedby="search-addon" />
			<button type="submit" class="btn btn-secondary mb-2">Search</button>
		</form>

		<div class="container">
			<div class="row">
				<div class="col-sm-8 m-auto">

					<div id="carouselExampleCaptions" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleCaptions"
								data-bs-slide-to="0" class="active" aria-current="true"
								aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleCaptions"
								data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleCaptions"
								data-bs-slide-to="2" aria-label="Slide 3"></button>
							<button type="button" data-bs-target="#carouselExampleCaptions"
								data-bs-slide-to="3" aria-label="Slide 4"></button>
						</div>
						<div class="carousel-inner ">
							<div class="carousel-item active" data-bs-interval="5000">
								<img
									src="https://images.unsplash.com/photo-1514320291840-2e0a9bf2a9ae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
									height="400px" class="d-block img-fluid " alt="">
								<div class="carousel-caption d-none d-md-block">
									<h5></h5>
								</div>
							</div>
							<div class="carousel-item" data-bs-interval="5000">
								<img
									src="https://images.unsplash.com/photo-1528489496900-d841974f5290?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
									height="400px" class="d-block img-fluid " alt="">
								<div class="carousel-caption d-none d-md-block">
									<h5></h5>
									<p></p>
								</div>
							</div>
							<div class="carousel-item" data-bs-interval="5000">
								<img
									src="https://images.unsplash.com/photo-1508979822114-db019a20d576?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
									height="400px" class="d-block img-fluid " alt="war">
								<div class="carousel-caption d-none d-md-block">
									<h5></h5>
									<p></p>
								</div>
							</div>
							<div class="carousel-item" data-bs-interval="5000">
								<img
									src="https://images.unsplash.com/photo-1598387993441-a364f854c3e1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80"
									height="400px" class="d-block img-fluid" alt="war">
								<div class="carousel-caption d-none d-md-block">
									<h5></h5>
									<p></p>
								</div>
							</div>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>
			</div>
		</div>




	</div>
	<jsp:include page="bootstrapFoot.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>