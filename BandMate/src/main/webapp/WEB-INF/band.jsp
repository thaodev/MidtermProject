<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Band</title>
<!-- CSS only -->
<jsp:include page="bootstrapHead.jsp"/>

</head>
<body>

<jsp:include page="navbarController.jsp" />

<c:choose>
	<c:when test="${not empty band}">
	
		<table class="table table-stripped mt-3">
			<thead class="table-secondary"> 
				<tr>
					<th></th>
					<th>Id</th>
					<th>Band</th>
					<th>Description</th>
					<th>Genre</th>
					<th>Year Formed</th>
					<th>Band Members</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td><img src="${band.bandImage}" width="200px" height="200px"/></td>
					<td>${band.id}</td>
					<td>${band.name}</td>
					<td>${band.description}</td>
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
					
				</tr>
				
			
			</tbody>
		</table>
		
		
	</c:when>
	
	
	
	<c:otherwise>
		<h3>No Bands Found</h3>
	</c:otherwise>
</c:choose>



<jsp:include page="bootstrapFoot.jsp" />
<jsp:include page="footer.jsp" />
</body>
</html>