<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
					<th>Ticket Price</th>
					<th>Start Time</th>
					<th>End Time</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="performance" items="${performances}">
				<tr>
					<td>${performance.id}</td>
					
					<td>${performance.performanceDate}</td>
					
					<td>${performance.name}</td>
					
					<td>${performance.ticketPrice}</td>
					
					<td>${performance.startTime}</td>
					
					<td>${performance.endTime}</td>
					
				</tr>
				
			</c:forEach>
			
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