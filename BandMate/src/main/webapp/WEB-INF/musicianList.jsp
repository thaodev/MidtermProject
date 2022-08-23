<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Musicians</title>
<!-- CSS only -->
<jsp:include page="bootstrapHead.jsp"/>

</head>
<body>

<jsp:include page="navbarController.jsp" />

<c:choose>
	<c:when test="${not empty musicians}">
	
		<table class="table table-stripped mt-3">
			<thead class="table-secondary"> 
				<tr>
					<th></th>
					<th>Musician</th>
					<th>Bio</th>
					<th>Instruments</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="musician" items="${musicians}">
				
				<tr>
					<td><img src="${musician.bandMemberImage}" width="75px" height="75px"/></td>
					
					<td><a href="bandPage.do?id=${musician.id}">${musician.firstName} ${musician.lastName}</a></td>
					<td> ${musician.bio}</td>
					<td>
					<c:forEach var="instrument" items="${instruments}">
						<c:choose>
							<c:when test="${instrument.getMusician().getId() == musician.id}">
							${instrument.name}<br>
							</c:when>
						</c:choose>
					</c:forEach>
					</td> 
					
				</tr>
				
				
			</c:forEach>
			
			</tbody>
		</table>
		
		
	</c:when>
	
	<c:otherwise>
		<h3>No Musicians Found</h3>
	</c:otherwise>
</c:choose>

<form action="addMusician.do">
<button class="btn btn-info btn-lg btn-block text-center" type="submit" value="Add New Musician">
Add New Musician </button>
				</form>

<jsp:include page="bootstrapFoot.jsp" />

</body>
</html>