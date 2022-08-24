<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">BANDMATE</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto ">
      <li class="nav-item active">
        <a class="nav-link" href="home.do">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="eventListPage.do">Events</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Your Band</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="viewProfile.do">Your Profile</a>
      </li>
    </ul>
	<div class="navbar-nav ms-auto">

<div class="navbar-nav ms-auto text-white">
					<p class="mr-3 text-center">${sessionScope.loggedInUser.username}</p>
					<a href="logout.do" type="submit" class="btn btn-warning"
						data-toggle="button" aria-pressed="false"> Logout</a>

				</div>
    </div>
  </div>
</nav>

