<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Band</title>
<!-- CSS only -->
<jsp:include page="bootstrapHead.jsp"/>
<jsp:include page="navbar.jsp"/>

</head>
<body>

<main class="container-fluid">

<h1>Edit Band</h1>

<form action="submitEditBand.do" method="POST">
  <div class="form-group">
  <input type="hidden" name="id" value="${band.id}">
					<span class="input-group-text">First Name</span>
    <label for="name"></label>
    <input type="text" name="name" class="form-control" id="name" value="${band.name}">
  </div>
  <div class="form-group">
  <div class="input-group-prepend">
					<span class="input-group-text">Description</span>
				</div>
    <label for="description"></label>
    <input type="text" name="description" class="form-control" id="description" value="${band.description}">
  </div>
  
  <div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Select a genre to add</span>
						<select name="genreId" id="dropdown">
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
			
			
			
  
 <div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Year Formed</span>
				</div>
    <label for="yearFormed"></label>
    <input type="text" name="yearFormed" class="form-control" id="yearFormed" value="${band.yearFormed}">
  </div>
  <div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Image</span>
				</div>
    <label for="bandImage"></label>
    <input type="text" name="bandImage" class="form-control" id="bandImage" value="${band.bandImage}">
  </div>
  
  
			<br>
  <button type="submit" class="btn btn-secondary">Submit</button>
</form>

</main>

<jsp:include page="bootstrapFoot.jsp" />

</body>
</html>