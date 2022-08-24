<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event</title>
<!-- CSS only -->
<jsp:include page="bootstrapHead.jsp"/>

</head>
<body>

<jsp:include page="navbarController.jsp" />

<c:choose>
	<c:when test="${! empty performance}">
	
		<table class="table table-stripped mt-3">
			<thead class="table-secondary"> 
				<tr>
					<!-- <th>ID</th> -->
					<th>Date</th>
					<th>Name</th>
					<th>Venue</th>
					<th>Band</th>
					<th>Ticket Price</th>
					<th>Start Time</th>
					<th>End Time</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<%-- <td>${performance.id}</td> --%>
					
					<td>${performance.dateFormatted}</td>
					
					<td>${performance.name}</td>
					
					<td>${performance.venue.name}</td>
					
					<td>${performance.band.name}</td>
					
					<td><p>$ ${performance.ticketPrice} </p></td>
					
					<td>${performance.startTime.hour%12}:<fmt:formatNumber pattern="00" value="${performance.startTime.minute}"/></td>
					
					<td>${performance.endTime.hour%12}:<fmt:formatNumber pattern="00" value="${performance.endTime.minute}"/></td>
					
				</tr>
				
			
			</tbody>
		</table>
		
		
	</c:when>
	
	<c:otherwise>
		<h3>No Performances Found</h3>
	</c:otherwise>
</c:choose>


<jsp:include page="bootstrapFoot.jsp" />

</body>
</html>