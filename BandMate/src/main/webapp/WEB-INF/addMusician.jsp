<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.skilldistillery.jpabandmate.entities.User"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Musician</title>

<jsp:include page="bootstrapHead.jsp" />

</head>
<body>
<jsp:include page="navbarController.jsp" />
<c:if test="${not empty errorMsg }">
	<p style="font-size:10px; font-color:red"><c:out value="${errorMsg}"/></p>
	<c:out value="${errorMsg }"/>
</c:if>
	<div class="container">
		<div class="text-center mb-3" style="font-size: 30px">Add a New Musician</div>
		<div style="font-style: italic">*indicates a mandatory field</div>
		<form action="createNewMusician.do" method="POST">
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
					<span class="input-group-text">Musician Bio</span>
				</div>
				<input class="form-control" type="text" name="bio"
					placeholder="Enter Musician Bio">
			</div>
			<br>
			
			
			
			
			<div class="input-group mb-3">
			 <span class="input-group-text">Vocals</span>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="vocals"
						id="inlineRadioYes"
						<c:if test="${musician.vocals == true }">checked</c:if> value="1">
					<label class="form-check-label" for="inlineRadio1">Yes</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="vocals"
						id="inlineRadioNo"
						<c:if test="${musician.vocals == false}">checked</c:if> value="0">
					<label class="form-check-label" for="inlineRadioNo">No</label>
				</div>
			</div>
			<br>
				
				
				
				
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Musician Image(URL)</span>
				</div>
				<input class="form-control" type="text" name="bandImage"
					placeholder="Enter URL of an image of the musician">
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