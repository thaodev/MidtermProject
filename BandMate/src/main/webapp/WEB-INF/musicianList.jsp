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
					<th>Bands</th>
					<th>Bio</th>
					<th>Delete</th>
					<th>Edit</th>
					<th>Add to Band</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="musician" items="${musicians}">
				
				<tr>
					<td><img src="${musician.bandMemberImage}" width="75px" height="75px"/></td>
					
					<td><a href="musicianPage.do?id=${musician.id}">${musician.firstName} ${musician.lastName}</a></td>
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
					<c:choose>
					<c:when test="${sessionScope.loggedInUser.admin == true}">
					
					<td><a href="deleteMusician.do?musicianId=${musician.id}" type="button" class="btn btn-danger btn-sm">x</a></td>
					<td><a href="editMusician.do?musicianId=${musician.id}" type="button" class="btn btn-primary btn-sm">Edit</a></td>
					
					</c:when>
					<c:otherwise>
					
					
					</c:otherwise>
					</c:choose>
					<td><a href="addMusicianToBand.do?musicianId=${musician.id}" type="button" class="btn btn-secondary btn-sm">Add to Band</a></td>
					
				</tr>
				
				
			</c:forEach>
			
			</tbody>
		</table>
		
		
	</c:when>
	
	<c:otherwise>
		<h3>No Musicians Found</h3>
	</c:otherwise>
</c:choose>
<c:if test="${not empty loggedInUser}">
<form action="addMusician.do">
<button class="btn btn-info btn-lg btn-block text-center" type="submit" value="Add New Musician">
Add New Musician </button>
				</form>
</c:if>
<jsp:include page="bootstrapFoot.jsp" />

</body>
</html>