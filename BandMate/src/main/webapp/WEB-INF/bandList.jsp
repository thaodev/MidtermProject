<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bands</title>
<!-- CSS only -->
<jsp:include page="bootstrapHead.jsp"/>

</head>
<body>

<jsp:include page="navbarController.jsp" />

<c:choose>
	<c:when test="${not empty bands}">
	
		<table class="table table-stripped mt-3">
			<thead class="table-secondary"> 
				<tr>
					<th></th>
					<th>Band</th>
					<th>Genre</th>
					<th>Year Formed</th>
					<th>Band Members</th>
					<th>Delete</th>
					<th>Edit</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="band" items="${bands}">
				
				<tr>
					<td><img src="${band.bandImage}" width="75px" height="75px"/></td>
					
					<td><a href="bandPage.do?id=${band.id}">${band.name}</a></td>
					<td>
					<c:forEach var="genre" items="${band.genres}">
					${genre.name}<br>
					</c:forEach>
					</td> 
					<td>${band.yearFormed}</td>
					
					<td>
					<c:forEach var="member" items="${bandMembers}">
						<c:choose>
							<c:when test="${member.getId().bandId == band.id}">
							${member.stageName}<br>
							</c:when>
						</c:choose>
					</c:forEach>
					</td> 
					
					
					<td><a href="deleteBand.do?bandId=${band.id}" type="button" class="btn btn-danger btn-sm">x</a></td>
					<td><a href="editBand.do?bandId=${band.id}" type="button" class="btn btn-primary btn-sm">Edit</a></td>
					
					
				</tr>
				
				
			</c:forEach>
			
			</tbody>
		</table>
		
		
	</c:when>
	
	<c:otherwise>
		<h3>No Bands Found</h3>
	</c:otherwise>
</c:choose>

<form action="addBand.do">
<button class="btn btn-info btn-lg btn-block text-center" type="submit" value="Add New Band">
Add New Band </button>
				</form>

<jsp:include page="bootstrapFoot.jsp" />

</body>
</html>