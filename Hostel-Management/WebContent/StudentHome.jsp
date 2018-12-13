<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.navbar {
  overflow: hidden;
  background-color: #333;
  font-family: Arial, Helvetica, sans-serif;
}

.active {
  background-color: red;
}

.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: red;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}

label{ 
	margin-right:5px;
	
}

span {
margin-right:30px;
}

html,body{
    margin:0;
    height:100%;
}
img{
  display:block;
  width:100%; height:100%;
  object-fit: cover;
}

</style>


</head>
<body>

<%session.setAttribute("userType","student"); %>
<%
		session.setAttribute("rollNo", "16UCS151");
		session.setAttribute("email", "16ucs151@lnmiit.ac.in");
		session.setAttribute("branch", "CSE");		
	%>

<%if(session.getAttribute("userType").equals("student")){ %>
	<div class="navbar">
		<a href="Home.jsp" class="active">Home</a>
		  <a href="StudentMain.jsp">Profile</a>
		  <div class="dropdown">
		    <button class="dropbtn">Applications 
		      <i class="fa fa-caret-down"></i>
		    </button>
		    <div class="dropdown-content">
		      <a href="LeaveApp.jsp">Leave application</a>
		      <a href="RoomChange.jsp">Room change application</a>
		      <a href="FileComplaint.jsp">File complaints</a>
		      <a href="InTime.jsp">In-time extension</a>
		    </div>
		  </div> 
		  <div class="dropdown">
		    <button class="dropbtn">Previous Applications 
		      <i class="fa fa-caret-down"></i>
		    </button>
		    <div class="dropdown-content">
		      <a href="oLeaveApp.jsp">Leave application</a>
		      <a href="oRoomChange.jsp">Room change application</a>
		      <a href="oFileComplaint.jsp">Complaints</a>
		      <a href="oInTime.jsp">In-time extension</a>
		    </div>
		  </div> 
		  <div style="float:right;color:white">
		  	<a href="#"><b>HOSTEL MANAGEMENT SYSTEM</b></a>
		  </div>
		</div>
<%}else{ %>
	<div class="navbar">
		<a href="Home.jsp"  class="active">Home</a>
		<a href="AdminLeave.jsp">Leave Applications</a>
		<a href="AdminRoomChange.jsp">Room Change Applications</a>
		<a href="AdminFileComplaints.jsp">Complaints Applications</a>
		<a href="AdminInTime.jsp">In-Time Applications</a> 
		<div style="float:right;color:white">
		  	<a href="#"><b>HOSTEL MANAGEMENT SYSTEM</b></a>
		  </div>
	</div>
<%} %>	
<img src="https://www.entrancezone.com/engineering/wp-content/uploads/2016/10/LNMIIT-2017-1.jpg" alt="image">


</body>
</html>