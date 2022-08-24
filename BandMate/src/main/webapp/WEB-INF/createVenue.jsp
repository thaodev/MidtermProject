<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Venue</title>
<!-- CSS only -->
<jsp:include page="bootstrapHead.jsp"/>
<jsp:include page="navbar.jsp"/>
</head>
<body>
<main class="container-fluid">
<br>
<h1>Create A VENUE</h1>

<form action="submitCreateVenueForm.do" method="POST">
  <div class="form-group">
    <label for="name"></label>
    <input type="text" name="name" class="form-control" id="name" placeholder="NAME:" required>
  </div>
  
  
  <div class="form-group">
    <label for="capacity"></label>
    <input type="text" name="capacity" class="form-control" id="capacity" placeholder="CAPACITY:" required>
  </div>
  <div class="form-group">
    <label for="description"></label>
    <input type="text" name="description" class="form-control" id="description"  placeholder="DESCRIPTION:" required>
  </div>
  <div class="form-group">
    <label for="venueImageUrl"></label>
    <input type="text" name="venueImageUrl" class="form-control" id="venueImageUrl" placeholder="VENUE IMAGE URL:" required>
  </div>
  <br>
  <div class="input-group mb-3">
				<input class="form-control" type="text" name="address.street"
					placeholder="Enter Address">
			</div>
			<div class="input-group row mb-4">
				<div class="col">
					<div class="form-outline">
						<input type="text" name="address.city" class="form-control" id="address.city" placeholder="CITY:" required>
					</div>
				</div>
				</div>
				<div class="col">
					<div class="form-outline">
						<input type="text" name="address.state" class="form-control" id="address.state" placeholder="STATE:" required>
					</div>
				</div>
				<div class="col">
					<div class="form-outline">
					<input type="text" name="address.zipCode" class="form-control" id="address.zipCode" placeholder="ZIP CODE:" required>
					</div>
					</div>
  <br>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>


</main>

<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>