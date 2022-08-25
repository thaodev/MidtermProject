<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Performance</title>
<!-- CSS only -->
<jsp:include page="bootstrapHead.jsp"/>
<jsp:include page="navbarController.jsp" />
</head>
<body>
<main class="container-fluid">
<br>
<h1>Create An Event</h1>

<form action="submitCreatePerformanceForm.do" method="POST">
  <div class="form-group">
    <label for="bandId"></label>
     <input type="number" name="bandId" class="form-control" id="bandId" placeholder="BAND ID:">
  </div>
  <div class="form-group">
    <label for="venueId"></label>
     <input type="number" name="venueId" class="form-control" id="venueId" placeholder="VENUE ID:">
  </div>
  <div class="form-group">
    <label for="performanceDate"></label>
    <input type="date" name="performanceDate" class="form-control" id="performanceDate" placeholder="DATE:">
  </div>
  <div class="form-group">
    <label for="name"></label>
    <input type="text" name="name" class="form-control" id="name" placeholder="NAME OF EVENT:">
  </div>
  <div class="form-group">
    <label for="ticketPrice"></label>
    <input type="text" name="ticketPrice" class="form-control" id="ticketPrice" placeholder="TICKET PRICE:">
  </div>
  <br>
  <div class="form-group">
    <label for="startTime">Start Time:</label>
    <input type="time" name="startTime" class="form-control" id="startTime" step="1"  placeholder="START TIME:">
  </div>
  <div class="form-group">
    <label for="endTime">End Time:</label>
    <input type="time" name="endTime" class="form-control" id="endTime" step="1"  placeholder="END TIME:">
  </div>
  <br>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>


</main>

<jsp:include page="bootstrapFoot.jsp" />
<jsp:include page="footer.jsp" />
</body>
</html>