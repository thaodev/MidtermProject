<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page import="com.skilldistillery.jpabandmate.entities.User"%>
<%
if (session != null) {
	User user = (User) session.getAttribute("loggedInUser");
	if (user != null) {
		out.println(user.getUsername());
	}
}
%> --%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<a class="navbar-brand" href="#">BANDMATE</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse justify-content-between"
		id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto ">
			<li class="nav-item active"><a class="nav-link" href="home.do">Home</a>
			</li>
			<li class="nav-item"><a href="eventListPage.do" class="nav-link">Events</a>
			</li>
		</ul>
<%-- 		<div class="navbar-nav ms-auto text-white">
			<c:out value="${user.username}" />
		</div> --%>
		<div class="navbar-nav ms-auto">
			<a href="login.do" type="submit" class="btn btn-warning"
				data-toggle="button" aria-pressed="false" autocomplete="off">
				Login</a>| <a href="signUp.do" type="submit" class="btn btn-warning"
				data-toggle="button" aria-pressed="false" autocomplete="off">
				Sign Up</a>
		</div>
	</div>
</nav>




<!--  <div class="navbar-nav ms-auto">
     <a href="">Login</a>|<a href="">Sign Up</a>
    </div> -->