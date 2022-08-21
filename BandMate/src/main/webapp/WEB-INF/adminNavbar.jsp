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
        <a class="nav-link" href="#">Home</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Management
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="showUser.do">Users</a>
          <a class="dropdown-item" href="#">Events</a>
          <a class="dropdown-item" href="#">Venues</a>
          <a class="dropdown-item" href="#">Musicians</a>
          <a class="dropdown-item" href="#">Bands</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Quantity Review</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="showUser.do">User</a>
      </li>
    </ul>
	<div class="navbar-nav ms-auto">
	<a href="logout.do" type="submit" class="btn btn-warning" data-toggle="button" aria-pressed="false" autocomplete="off">
  Logout</a>
    </div>
  </div>
</nav>




<!--  <div class="navbar-nav ms-auto">
     <a href="">Login</a>|<a href="">Sign Up</a>
    </div> -->