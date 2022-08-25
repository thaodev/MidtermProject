<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Venues</title>
<!-- CSS only -->
<jsp:include page="bootstrapHead.jsp"/>
<jsp:include page="navbar.jsp"/>

</head>
<body>

<main class="container-fluid">

<h1>Edit Venue</h1>

<form action="submitEditVenueForm.do" method="POST">
  <div class="form-group">
  <input type="hidden" name="id" value="${venue.id}">
    <label for="name"></label>
    <input type="text" name="name" class="form-control" id="name" value="${venue.name}">
  </div>
  
  <div class="form-group">
    <label for="capacity"></label>
    <input type="text" name="capacity" class="form-control" id="capacity" value="${venue.capacity}">
  </div>
  
  
  <div class="form-group">
    <label for="description"></label>
    <input type="text" name="description" class="form-control" id="description" value="${venue.description}">
  </div>
  
  <div class="form-group">
    <label for="venueImageUrl"></label>
    <input type="text" name="venueImageUrl" class="form-control" id="venueImageUrl" value="${venue.venueImageUrl}">
  </div>
  <br>
  
  <div class="input-group mb-3">
  <input class="form-control" type="hidden" name="address.id" value="${venue.address.id}">
  
				<input class="form-control" type="text" name="address.street"
					placeholder="Enter Address" value="${venue.address.street}">
			</div>
			<div class="input-group row mb-4">
				<div class="col">
					<div class="form-outline">
						<input type="text" name="address.city" class="form-control" id="address.city" value="${venue.address.city}" required>
					</div>
				</div>
				</div>
				<div class="col">
					<div class="form-outline">
						<input type="text" name="address.state" class="form-control" id="address.state" value="${venue.address.state}" required>
					</div>
					<br>
				</div>
				<div class="col">
					<div class="form-outline">
					<input type="text" name="address.zipCode" class="form-control" id="address.zipCode" value="${venue.address.zipCode}" required>
					</div>
					</div>
  <br>
  
  
  <br>
  <button type="submit" class="btn btn-secondary">Submit</button>
</form>

</main>


<jsp:include page="bootstrapFoot.jsp" />
<jsp:include page="footer.jsp" />
</body>
</html>