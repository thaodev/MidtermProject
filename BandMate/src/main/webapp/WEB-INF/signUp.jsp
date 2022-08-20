<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.skilldistillery.jpabandmate.entities.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up Site</title>

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
	<div class="container">
		<div class="text-center mb-3" style="font-size:30px">BECOME OF
			MEMBER OUR EXORTIC COMMUNITY</div>
		<div style="font-style: italic">*indicates a mandatory field</div>
		<form action="signUpForm.do" method="POST">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">First Name*</span>
				</div>
				<input class="form-control" type="text" required name="firstName"
					placeholder="Enter First Name">
			</div>
			<br>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" >Last Name*</span>
				</div>
				<input class="form-control" type="text"  required name="lastName"
					placeholder="Enter Last Name">
			</div>
			<br>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Username*</span>
				</div>
				<input class="form-control" type="text"  required name="username"
					placeholder="Enter Username">
			</div>
			<br>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Password*</span>
				</div>
				<input class="form-control" type="password" required name="password"
					placeholder="Enter password">
			</div>
			<br>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Email*</span>
				</div>
				<input class="form-control" type="email" required name="email"
					placeholder="Enter Email">
			</div>
			<br>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Phone</span>
				</div>
				<input class="form-control" type="text" name="phone"
					placeholder="Enter Phone">
			</div>
			<br>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Date Of Birth</span>
				</div>
				<input class="form-control" type="date" name="dob"
					placeholder="Enter Date Of Birth">
			</div>
			<br>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Address</span>
				</div>
				<input class="form-control" type="text" name="address"
					placeholder="Enter Address">
			</div>
			<br>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Tell us something about yourself</span>
				</div>
				<input class="form-control" type="text" name="bio"
					placeholder="Enter your biography">
			</div>
			<br>

			<button class="btn btn-info btn-lg btn-block text-center" type="submit">
				Submit</button>
		</form>
	</div>
<jsp:include page="bootstrapFoot.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>