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
			<!-- 
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Genre*</span>
						<select name="genreId" id="dropdown" required>
							<option value="1">Hard Rock</option>
							<option value="2">Metal</option>
							<option value="3">Pop</option>
							<option value="4">Country</option>
							<option value="5">Jazz</option>
							<option value="6">Blues</option>
							<option value="7">EDM</option>
							<option value="8">Disco</option>
							<option value="9">Grunge</option>
							<option value="10">Alternative</option>
							<option value="11">Folk</option>
							<option value="12">Psychedelic Rock</option>
							<option value="13">Death Metal</option>
							<option value="14">Post-Grunge</option>
							<option value="15">Classical</option>
						</select> <br><br>
				</div>
			</div>
			 -->
			
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Select genres</span>
					<c:forEach varStatus="n" var="genre" items="${genres}">
						<input type="checkbox"
							<c:if test="${band.genres.contains(genre)}">checked</c:if>
							id="genre${n.index}" name="genreIds" value="${genre.id}">
						<label for="genre${n.index}">${genre.name}</label>
					</c:forEach>

				</div>
			</div>
			
			
			<br>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Year Formed</span>
				</div>
				<input class="form-control" type="year" required name="yearFormed"
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
				

			<button class="btn btn-info btn-lg btn-block text-center"
				type="submit">Submit</button>
		</form>
	</div>
	<jsp:include page="bootstrapFoot.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>