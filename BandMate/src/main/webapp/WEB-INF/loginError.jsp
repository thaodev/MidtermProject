<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.skilldistillery.jpabandmate.entities.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Site</title>

<jsp:include page="bootstrapHead.jsp" />

</head>
<body>
<jsp:include page="navbarController.jsp" />
	<div class="text-center"> Either username or password doesn't match. Please try again!</div>
	<jsp:include page="bootstrapFoot.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>