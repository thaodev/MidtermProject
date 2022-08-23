<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Venues</title>
<!-- CSS only -->
<jsp:include page="bootstrapHead.jsp"/>

</head>
<body>

<jsp:include page="navbarController.jsp" />

<c:choose>
	<c:when test="${! empty venues}">
	
		<table class="table table-stripped mt-3">
			<thead class="table-secondary"> 
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>VenueImageUrl</th>
					<th>Capacity</th>
					<th>Address</th>
					<th>Description</th>
					<th>Performances</th>
					<th>Delete</th>
					<th>Edit</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="venue" items="${venues}">
				<tr>
					<td>${venue.id}</td>
					
					<td>${venue.name}</td>
					
					<td>${venue.venueImageUrl}</td>
					
					<td>${venue.capacity}</td>
					
					<td>${venue.address}</td>
					
					<td>${venue.description}</td>
					
					<td>${venue.performances[0].name}</td>
					
					<td><a href="deleteVenue.do?venueId=${venue.id}" type="button" class="btn btn-danger btn-sm">x</a></td>
					<td><a href="editVenue.do?venueId=${venue.id}" type="button" class="btn btn-primary btn-sm">Edit</a></td>
					
					
				</tr>
				
			</c:forEach>
			
			</tbody>
		</table>
		
		
	</c:when>
	
	<c:otherwise>
		<h3>No Venues Found</h3>
	</c:otherwise>
</c:choose>

<a href="createVenue.do" type="button" class="btn btn-secondary">CREATE VENUE</a>


<jsp:include page="bootstrapFoot.jsp" />

</body>
</html>