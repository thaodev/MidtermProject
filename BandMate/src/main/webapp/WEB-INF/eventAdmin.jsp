<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Events</title>
<!-- CSS only -->
<jsp:include page="bootstrapHead.jsp"/>

</head>
<body>

<jsp:include page="navbarController.jsp" />

<c:choose>
	<c:when test="${! empty performances}">
	
		<table class="table table-stripped mt-3">
			<thead class="table-secondary"> 
				<tr>
					<th>ID</th>
					<th>Date</th>
					<th>Name</th>
					<th>Venue</th>
					<th>Ticket Price</th>
					<th>Start Time</th>
					<th>End Time</th>
					<th>Delete</th>
					<th>Edit</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="performance" items="${performances}">
				<tr>
					<td>${performance.id}</td>
					
					<td>${performance.dateFormatted}</td>
					
					<td>${performance.name}</td>
					
					<td>${performance.venue.name}</td>
					
					<td><p>$ ${performance.ticketPrice}</p></td>
					
					<td>${performance.startTime.hour%12}:<fmt:formatNumber pattern="00" value="${performance.startTime.minute}"/></td>
					
					<td>${performance.endTime.hour%12}:<fmt:formatNumber pattern="00" value="${performance.endTime.minute}"/></td>
					
					
					<td><a href="deletePerformance.do?performanceId=${performance.id}" type="button" class="btn btn-danger btn-sm"onclick="if(!(confirm('Are you sure you want to delete this event?'))) return false">x</a></td>
					
					<td><a href="editPerformance.do?performanceId=${performance.id}" type="button" class="btn btn-primary btn-sm">Edit</a></td>
					
					
				</tr>
				
			</c:forEach>
			
			</tbody>
		</table>
		
		
	</c:when>
	
	<c:otherwise>
		<h3>No Performances Found</h3>
	</c:otherwise>
</c:choose>

<a href="createPerformance.do" type="button" class="btn btn-secondary">CREATE EVENT</a>


<jsp:include page="bootstrapFoot.jsp" />

</body>
</html>