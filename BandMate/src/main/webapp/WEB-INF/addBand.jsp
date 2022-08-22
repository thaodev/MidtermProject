<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.skilldistillery.jpabandmate.entities.User"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Band</title>

<jsp:include page="bootstrapHead.jsp" />

</head>
<body>
<jsp:include page="navbarController.jsp" />
<c:if test="${not empty errorMsg }">
	<p style="font-size:10px; font-color:red"><c:out value="${errorMsg}"/></p>
	<c:out value="${errorMsg }"/>
</c:if>
	<div class="container">
		<div class="text-center mb-3" style="font-size: 30px">Add a New Band</div>
		<div style="font-style: italic">*indicates a mandatory field</div>
		<form action="createNewBand.do" method="POST">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Band Name*</span>
				</div>
				<input class="form-control" type="text" required name="name"
					placeholder="Enter Band Name">
			</div>
			<br>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Band Description*</span>
				</div>
				<input class="form-control" type="text" required name="description"
					placeholder="Enter Description">
			</div>
			<br>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Genre*</span>
						<select name="genre" id="dropdown" required>
							<option value="Hard Rock">Hard Rock</option>
							<option value="Metal">Metal</option>
							<option value="Pop">Pop</option>
							<option value="Country">Country</option>
							<option value="Jazz">Jazz</option>
							<option value="Blues">Blues</option>
							<option value="EDM">EDM</option>
							<option value="Disco">Disco</option>
							<option value="Grunge">Grunge</option>
							<option value="Alternative">Alternative</option>
							<option value="Folk">Folk</option>
							<option value="Psychedelic Rock">Psychedelic Rock</option>
							<option value="Death Metal">Death Metal</option>
							<option value="Post-Grunge">Post-Grunge</option>
							<option value="Classical">Classical</option>
						</select> <br><br>
				</div>
			</div>
			<br>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Year Formed</span>
				</div>
				<input class="form-control" type="text" name="yearFormed"
					placeholder="Enter Year Formed">
			</div>
			<br>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Band Image(URL)</span>
				</div>
				<input class="form-control" type="text" name="bandImage"
					placeholder="Enter URL of an image of your band">
			</div>
			<br>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
				</div>
				<input class="form-control" type="hidden" name="manager" value="${user}">
			</div>
				

			<button class="btn btn-info btn-lg btn-block text-center"
				type="submit">Submit</button>
		</form>
	</div>
	<jsp:include page="bootstrapFoot.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>