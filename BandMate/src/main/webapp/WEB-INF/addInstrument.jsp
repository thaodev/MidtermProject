<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.skilldistillery.jpabandmate.entities.User"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Instrument</title>

<jsp:include page="bootstrapHead.jsp" />

</head>
<body>
<jsp:include page="navbarController.jsp" />
<c:if test="${not empty errorMsg }">
	<p style="font-size:10px; font-color:red"><c:out value="${errorMsg}"/></p>
	<c:out value="${errorMsg }"/>
</c:if>
	<div class="container">
		<div class="text-center mb-3" style="font-size: 30px">Enter instrument</div>
		<form action="submitCreateNewInstrument.do" method="POST">

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Instrument</span>
				<input class="form-control" type="text" name="name"
					placeholder="Enter Instrument Name">
			<br>
				</div>
				</div>
				<button class="btn btn-info btn-lg btn-block text-center"
				type="submit">Submit</button>
		</form>

		
	</div>
	<jsp:include page="bootstrapFoot.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>