<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Band</title>
<!-- CSS only -->
<jsp:include page="bootstrapHead.jsp" />
<jsp:include page="navbar.jsp" />

</head>
<body>

	<main class="container-fluid">

		<h1>Edit Band</h1>

		<form action="submitEditBand.do" method="POST">
			<div class="form-group">
				<input type="hidden" name="id" value="${band.id}"> <span
					class="input-group-text">First Name</span> <label for="name"></label>
				<input type="text" name="name" class="form-control" id="name"
					value="${band.name}">
			</div>
			<div class="form-group">
				<div class="input-group-prepend">
					<span class="input-group-text">Description</span>
				</div>
				<label for="description"></label> <input type="text"
					name="description" class="form-control" id="description"
					value="${band.description}">
			</div>

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



			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Year Formed</span>
				</div>
				<label for="yearFormed"></label> <input type="text"
					name="yearFormed" class="form-control" id="yearFormed"
					value="${band.yearFormed}">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Image</span>
				</div>
				<label for="bandImage"></label> <input type="text" name="bandImage"
					class="form-control" id="bandImage" value="${band.bandImage}">
			</div>


			<br>
			<button type="submit" class="btn btn-secondary">Submit</button>
		</form>

	</main>

	<jsp:include page="bootstrapFoot.jsp" />

</body>
</html>