<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <input type="text" name="performanceDate" class="form-control" id="performanceDate" value="${performance.performanceDate}">
  </div>
  <div class="form-group">
    <label for="name"></label>
    <input type="text" name="name" class="form-control" id="name" value="${performance.name}">
  </div>
  <div class="form-group">
    <label for="venue"></label>
    <input type="text" name="venue" class="form-control" id="venue" value="${performance.venue.name}">
  </div>
  <div class="form-group">
    <label for="ticketPrice"></label>
    <input type="text" name="ticketPrice" class="form-control" id="ticketPrice" value="${performance.ticketPrice}">
  </div>
  
  
  <div class="form-group">
    <label for="startTime"></label>
    <input type="time" name="startTime" class="form-control" id="startTime" value="${performance.startTime}">
  </div>
  
  <div class="form-group">
    <label for="endTime"></label>
    <input type="time" name="endTime" class="form-control" id="endTime" value="${performance.endTime}">
  </div>
  
  
  <br>
  <button type="submit" class="btn btn-secondary">Submit</button>
</form>

</main>

<jsp:include page="bootstrapFoot.jsp" />

</body>
</html>