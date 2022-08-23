<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Musician</title>
<!-- CSS only -->
<jsp:include page="bootstrapHead.jsp"/>

</head>
<body>

<jsp:include page="navbarController.jsp" />

<c:choose>
	<c:when test="${not empty musician}">
	
		<table class="table table-stripped mt-3">
			<thead class="table-secondary"> 
				<tr>
						<th></th>
					<th>Musician</th>
					<th>Bands</th>
					<th>Bio</th>
					<th>Instruments</th>
					<th>Vocalist</th>
				</tr>
			</thead>
			
			<tbody>
			
				
				<tr>
					<td><img src="${musician.bandMemberImage}" width="75px" height="75px"/></td>
					
					<td>${musician.firstName} ${musician.lastName}</td>
					<td>
					<c:forEach var="member" items="${bandMembers}">
						<c:forEach var="band" items="${bands}">
						<c:choose>
							<c:when test="${member.getId().musicianId == musician.id && member.getId().bandId == band.id}">
							${band.name}<br>
							</c:when>
						</c:choose>
					</c:forEach>
					</c:forEach>
					</td> 
					<td> ${musician.bio}</td>
					<td>
					<c:forEach var="instrument" items="${instruments}">
						<c:choose>
							<c:when test="${instrument.getMusician().id == musician.id}">
							${instrument.name}<br>
							</c:when>
						</c:choose>
					</c:forEach>
					<td> 
					
					
				</tr>
			
			
			</tbody>
		</table>
		
		
	</c:when>
	
	
	
	<c:otherwise>
		<h3>No Musicians Found</h3>
	</c:otherwise>
</c:choose>



<jsp:include page="bootstrapFoot.jsp" />

</body>
</html>