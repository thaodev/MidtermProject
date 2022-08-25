<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.skilldistillery.jpabandmate.entities.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Result Site</title>

<jsp:include page="bootstrapHead.jsp" />

</head>
<body>
<jsp:include page="navbarController.jsp" />
<p class="text-center h1">
	&#127808 <c:out value="${message}" />. Please log in! &#127808</p>
	
<jsp:include page="bootstrapFoot.jsp" />
<jsp:include page="footer.jsp" />
</body>
</html>