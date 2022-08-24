<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<jsp:include page="bootstrapHead.jsp"/>
<jsp:include page="navbar.jsp"/>

</head>
<body>

<main class="container-fluid">

<h1>Edit Event</h1>

<form action="submitEditperformanceForm.do" method="POST">
  <div class="form-group">
  <input type="hidden" name="id" value="${performance.id}">
    <label for="performanceDate"></label>
    <input type="date" name="performanceDate" class="form-control" id="performanceDate" value="${performance.performanceDate}">
  </div>
  <div class="form-group">
    <label for="name"></label>
    <input type="text" name="name" class="form-control" id="name" value="${performance.name}">
  </div>
  <br>
  <div class="form-group">
  <select class="form-select" aria-label="Default select example" id="venueId" name="venue.id">
  <c:forEach var="venue" items="${venues}" >
 
  <option value="${venue.id}">${venue.name} </option>
  
  </c:forEach>
  
</select>
  
  </div>
  <div class="form-group">
    <label for="ticketPrice"></label>
    <input type="text" name="ticketPrice" class="form-control" id="ticketPrice" value="${performance.ticketPrice}">
  </div>
  
  
  <div class="form-group">
    <label for="startTime"></label>
    <input type="time" name="startTime" class="form-control" id="startTime" step="1" value="${performance.startTimeFull}">
  </div>
  
  <div class="form-group">
    <label for="endTime"></label>
    <input type="time" name="endTime" class="form-control" id="endTime" step="1" value="${performance.endTimeFull}">
  </div>
  
  
  <br>
  <button type="submit" class="btn btn-secondary">Submit</button>
</form>

</main>

<jsp:include page="bootstrapFoot.jsp" />

</body>
</html>