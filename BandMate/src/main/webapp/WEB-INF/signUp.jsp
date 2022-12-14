<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.skilldistillery.jpabandmate.entities.User"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up Site</title>

<jsp:include page="bootstrapHead.jsp" />

</head>
<body>
<jsp:include page="navbarController.jsp" />
<c:if test="${not empty errorMsg }">
	<p style="font-size:10px; font-color:red"><c:out value="${errorMsg}"/></p>
	<c:out value="${errorMsg }"/>
</c:if>
	<div class="container">
		<div class="text-center mb-3" style="font-size: 30px">BECOME OF
			MEMBER OUR EXORTIC COMMUNITY</div>
		<div style="font-style: italic">*indicates a mandatory field</div>
		<form action="addUser.do" method="POST">
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
					<span class="input-group-text">Last Name*</span>
				</div>
				<input class="form-control" type="text" required name="lastName"
					placeholder="Enter Last Name">
			</div>
			<br>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Username*</span>
				</div>
				<input class="form-control" type="text" required name="username"
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
				<input class="form-control" type="text" name="address.street"
					placeholder="Enter Address">
			</div>
			<br>
			<div class="input-group row mb-4">
				<div class="col">
					<div class="form-outline">
						<input type="text" id="form9Example3"
							class="form-control input-custom" name="address.city" /> <label
							class="form-label" for="form9Example3">City</label>
					</div>
				</div>
				<div class="col">
					<div class="form-outline">
						<input type="text" id="form9Example4"
							class="form-control input-custom" name="address.state" /> <label
							class="form-label" for="form9Example4">State</label>
					</div>
				</div>
				<div class="col">
					<div class="form-outline">
						<input type="text" id="form9Example4"
							class="form-control input-custom" name="address.zipCode" /> <label
							class="form-label" for="form9Example4">Zip</label>
					</div>
				</div>

			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Tell us something about
						yourself</span>
				</div>
				<input class="form-control" type="text" name="bio"
					placeholder="Enter your biography">
			</div>
			<br>

			<button class="btn btn-info btn-lg btn-block text-center"
				type="submit">Submit</button>
		</form>
	</div>
	<jsp:include page="bootstrapFoot.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>