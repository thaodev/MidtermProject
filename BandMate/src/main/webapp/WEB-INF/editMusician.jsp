<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Musician</title>
<!-- CSS only -->
<jsp:include page="bootstrapHead.jsp"/>
<jsp:include page="navbar.jsp"/>

</head>
<body>

<main class="container-fluid">

<h1>Edit Musician</h1>

<form action="submitEditMusician.do" method="POST">
  <div class="form-group">
  <input type="hidden" name="id" value="${musician.id}">
					<span class="input-group-text">First Name</span>
    <label for="firstName"></label>
    <input type="text" name="firstName" class="form-control" id="firstName" value="${musician.firstName}">
  </div>
  <div class="form-group">
  <div class="input-group-prepend">
					<span class="input-group-text">Last Name</span>
				</div>
    <label for="lastName"></label>
    <input type="text" name="lastName" class="form-control" id="lastName" value="${musician.lastName}">
  </div>
  <div class="form-group">
  <div class="input-group-prepend">
					<span class="input-group-text">Bio</span>
				</div>
    <label for="bio"></label>
    <input type="text" name="bio" class="form-control" id="bio" value="${musician.bio}">
  </div>
  <div class="form-group">
  <div class="input-group-prepend">
					<span class="input-group-text">Image</span>
				</div>
    <label for="bandMemberImage"></label>
    <input type="text" name="bandMemberImage" class="form-control" id="bandMemberImage" value="${musician.bandMemberImage}">
  </div>
  
  <c:forEach var="instrument" items="${instruments}">
						<c:choose>
							<c:when test="${instrument.getMusician().id == musician.id}">
							<div class="form-group">
							<div class="input-group-prepend">
					<span class="input-group-text">Instrument</span>
				</div>
    <label for="instruments"></label>
    <input type="text" name="instruments" class="form-control" id="instruments" value="${instrument.name}">
  </div>
							
							</c:when>
						</c:choose>
					</c:forEach>
  
  <div class="input-group mb-3">
  
			 <span class="input-group-text">Vocals</span>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="vocals"
						id="inlineRadioYes"
						<c:if test="${musician.vocals == 1 }">checked</c:if> value="1">
					<label class="form-check-label" for="inlineRadio1">Yes</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="vocals"
						id="inlineRadioNo"
						<c:if test="${musician.vocals == 0}">checked</c:if> value="0">
					<label class="form-check-label" for="inlineRadioNo">No</label>
				</div>
			</div>
			<br>
  <button type="submit" class="btn btn-secondary">Submit</button>
</form>

</main>

<jsp:include page="bootstrapFoot.jsp" />

</body>
</html>