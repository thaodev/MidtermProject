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
<!-- Custom styles for this template -->
<link href="css/myStyleSheet.css" rel="stylesheet">
<%-- 
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
</c:choose> --%>

<jsp:include page="navbarController.jsp" />

</head>
<body>

	<div class="container-fluid">

	<div class="text-center">
		<h1>Welcome to Band Mate</h1>
		<h4>Are you looking for your next musical experience? You found the right place. Explore below!</h4>
	</div>

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
									src="https://images.unsplash.com/photo-1612443016610-00c5fa0ec439?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
									height="400px" class="d-block img-fluid rounded" alt="">
								<div class="carousel-caption d-none d-md-block">
									<h5></h5>
								</div>
							</div>
							<div class="carousel-item" data-bs-interval="5000">
								<img
									src="https://images.unsplash.com/photo-1528489496900-d841974f5290?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
									height="400px" class="d-block img-fluid rounded" alt="">
								<div class="carousel-caption d-none d-md-block">
									<h5></h5>
									<p></p>
								</div>
							</div>
							<div class="carousel-item" data-bs-interval="5000">
								<img
									src="https://images.unsplash.com/photo-1508979822114-db019a20d576?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
									height="400px" class="d-block img-fluid rounded" alt="war">
								<div class="carousel-caption d-none d-md-block">
									<h5></h5>
									<p></p>
								</div>
							</div>
							<div class="carousel-item" data-bs-interval="5000">
								<img
									src="https://images.unsplash.com/photo-1598387993441-a364f854c3e1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80"
									height="400px" class="d-block img-fluid rounded" alt="war">
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

		<div class="card-columns mr-auto mt-4">
			<div class="row">
				<div class="col">
					<div class="card">
						<img class="card-img-top img-fluid"
							src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
							alt="">
						<div class="card-body">
							<h4 class="card-title">Find a Musician</h4>
							<p class="card-text">Search for your favorite musicians or just browse some lesser-known talent...</p>
						</div>
						<div class="text-center">
							<form action="musicianByKeyword.do" class="form-group mx-sm-3 mb-2">
								<input type="search" class="rounded" name="search"
									placeholder="" aria-label="Search"
									aria-describedby="search-addon" />
								<button type="submit" class="btn btn-secondary mb-2">Search
									By Musician</button>
							</form>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<img class="card-img-top img-fluid"
							src="https://images.unsplash.com/photo-1501612780327-45045538702b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
							alt="">
						<div class="card-body">
							<h4 class="card-title">Search for Bands</h4>
							<p class="card-text">Find a band you've been waiting to see live on stage...</p>
						</div>
						<div class="text-center">
							<form action="bandByKeyword.do" class="form-group mx-sm-3 mb-2">
								<input type="search" class="rounded" name="search"
									placeholder="" aria-label="Search"
									aria-describedby="search-addon" />
								<button type="submit" class="btn btn-secondary mb-2">Search
									By Band</button>
							</form>
						</div>
					</div>
				</div>
				<div class="col">

					<div class="card">
						<img class="card-img-top img-fluid"
							src="https://images.unsplash.com/photo-1501386761578-eac5c94b800a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
							alt="">
						<div class="card-body">
							<h4 class="card-title">Upcoming Performances</h4>
							<p class="card-text"> Shop millions of live events and discover can't-miss concerts... 
							
							</p>
						</div>
						<div class="text-center">
							<form action="eventByKeyword.do" class="form-group mx-sm-3 mb-2">
							<label for="keyword"></label>
								<input type="search" class="rounded" name="keyword"
									placeholder="" aria-label="Search"
									aria-describedby="search-addon" />

								<button type="submit" class="btn btn-secondary mb-2">Search
									By Event</button>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
	<jsp:include page="bootstrapFoot.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>