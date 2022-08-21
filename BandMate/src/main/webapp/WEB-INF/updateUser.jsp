<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.skilldistillery.jpabandmate.entities.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	<c:if test="${not empty errorMsg }">
		<p style="font-size: 10px; font-color: red">
			<c:out value="${errorMsg}" />
		</p>
		<c:out value="${errorMsg }" />
	</c:if>
	<div class="container mx-auto">

		<form action="updateUser.do" method="POST">
			<input type="hidden" name="id" value="<c:out value= "${user.id}"/>" />
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">First Name*</span>
				</div>
				<input class="form-control" type="text" value="${user.firstName }"
					required name="firstName" placeholder="Enter First Name">
			</div>
			<br>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Last Name*</span>
				</div>
				<input class="form-control" type="text" value="${user.lastName }"
					required name="lastName" placeholder="Enter Last Name">
			</div>
			<br>
			<div class="input-group mb-3">
				<span class="input-group-text">Enabled</span>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio"
						name="inlineRadioOptions" id="inlineRadio1"
						<c:if test="${user.enabled == true }">checked</c:if> value="1">
					<label class="form-check-label" for="inlineRadio1">Yes</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio"
						name="inlineRadioOptions" id="inlineRadio2"
						<c:if test="${user.enabled == false}">checked</c:if> value="0">
					<label class="form-check-label" for="inlineRadio2">No</label>
				</div>
			</div>
			<br>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Username*</span>
				</div>
				<input class="form-control" type="text" value="${user.username }"
					required name="username" placeholder="Enter Username">
			</div>
			<br>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Password*</span>
				</div>
				<input class="form-control" type="password"
					value="${user.password }" required name="password"
					placeholder="Enter password">
			</div>
			<br>
			<div class="input-group mb-3">
				<span class="input-group-text">Admin</span>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio"
						name="inlineRadioOptions" id="inlineRadio3"
						<c:if test="${user.admin == true }">checked</c:if> value="1">
					<label class="form-check-label" for="inlineRadio3">Yes</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio"
						name="inlineRadioOptions" id="inlineRadio4"
						<c:if test="${user.admin == false}">checked</c:if> value="0">
					<label class="form-check-label" for="inlineRadio4">No</label>
				</div>
			</div>
			<br>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Email*</span>
				</div>
				<input class="form-control" type="email" value="${user.email }"
					required name="email" placeholder="Enter Email">
			</div>
			<br>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Phone</span>
				</div>
				<input class="form-control" type="text" value="${user.phone}"
					name="phone" placeholder="Enter Phone">
			</div>
			<br>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Date Of Birth</span>
				</div>
				<input class="form-control" type="date" value="${user.dob }"
					name="dob" placeholder="Enter Date Of Birth">
			</div>
			<br>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Address</span>
				</div>
				<input class="form-control" type="text"
					value="${user.address.street }" name="address.street"
					placeholder="Enter Street Address">
			</div>
			<br>
			<div class="input-group row mb-4">
				<div class="col">
					<div class="form-outline">
						<input type="text" id="form9Example3"
							class="form-control input-custom" value="${user.address.city}"
							name="address.city" /> <label class="form-label"
							for="form9Example3">City</label>
					</div>
				</div>
				<div class="col">
					<div class="form-outline">
						<input type="text" id="form9Example4"
							class="form-control input-custom" value="${user.address.state}"
							name="address.state" /> <label class="form-label"
							for="form9Example4">State</label>
					</div>
				</div>
				<div class="col">
					<div class="form-outline">
						<input type="text" id="form9Example4"
							class="form-control input-custom"
							value="${user.address.zipCode }" name="address.zipCode" /> <label
							class="form-label" for="form9Example4">Zip</label>
					</div>
				</div>

			</div>

			<%-- 			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Tell us something about
						yourself</span>
				</div>
				<input class="form-control" type="text" value = "${user.bio}"name="bio"
					placeholder="Enter your biography">
			</div> --%>
			<div class="card">
				<div class="card-header">
					<h5>
						<a href="#collapse3" data-parent="#accordion"
							data-toggle="collapse"> User's biography </a>
					</h5>
				</div>

				<div id="collapse3" class="collapse">
					<div class="card-body">
						<c:out value="${user.bio}" />
					</div>
				</div>
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