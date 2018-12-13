<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import='com.hostelManagement.doa.DatabaseConnection, java.sql.*'%> 

<%if(session.getAttribute("userType").equals("student")){
	response.sendRedirect("StudentHome.jsp");
} %>  
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
margin-bottom:20px;
}

.buttonAccept {
    background: green;
    padding: 10px;
    text-align: center;
    border-radius: 5px;
    color: white;
    cursor: pointer;
    font-weight: bold;
}

.buttonReject {
    background: red;
    padding: 10px;
    text-align: center;
    border-radius: 5px;
    color: white;
    cursor: pointer;
    font-weight: bold;
}

.buttonBox a:hover{
	color:black;
}

</style>
</head>
<body>
	<div class="navbar">
		<a href="Home.jsp">Home</a>
		<a href="AdminLeave.jsp">Leave Applications</a>
		<a href="AdminRoomChange.jsp" class="active">Room Change Applications</a>
		<a href="AdminFileComplaints.jsp">Complaints Applications</a>
		<a href="AdminInTime.jsp">In-Time Applications</a> 
		<div style="float:right;color:white">
		  	<a href="#"><b>HOSTEL MANAGEMENT SYSTEM</b></a>
		  </div>
	</div>
	
	<%
		DatabaseConnection db = new DatabaseConnection();
    	db.connect(); 
    	String sql = "SELECT * FROM RoomChange where status = 1";
    	ResultSet rs = db.Query(sql);	
    %>
	
	<div style="margin-top:20px;padding:10px;">
		<%	while(rs.next()){
			int applicationId = rs.getInt("application_id");
			String applicantId = rs.getString("applicant_id");
			Date date = rs.getDate("application_date");
			String applicantRoom = rs.getString("applicantRoom");
			String applicantHostel = rs.getString("applicantHostel");
			String reason = rs.getString("reason");
		%>
    	<fieldset>
    		<label for="applicationId"><b>Application Id:</b></label>
            <span><%= applicationId %></span>
            <label for="applicantId"><b>Applicant Id:</b></label>
            <span><%= applicantId %></span><br><br>
            <label for="currentRoom"><b>Current Room:</b></label>
            <span><%= applicantRoom %></span>
            <label for="currentHostel"><b>Current Hostel:</b></label>
            <span><%= applicantHostel %></span><br><br>
            <label for=reason"><b>Reason:</b></label>
            <span><%= reason %></span>
			<div class="buttonBox">
            	<form action="acceptApplication" method='POST'>
          			<input value="<%=applicationId%>" name="id" style="display:none">
          			<input value="accept" name="type" style="display:none">
          			<input value="roomchange" name="appType" style="display:none">
            		<button class="buttonAccept" style="float:right;margin-left:20px;">Accept</button>
            	</form>
            	<form action="acceptApplication" method='POST'>
            		<input value="<%=applicationId%>" name="id" style="display:none">
            		<input value="reject" name="type" style="display:none">
            		<input value="roomchange" name="appType" style="display:none">
            		<button class="buttonReject" style="float:right">Reject</button>
            	</form>
            </div> 
            
        </fieldset>
        <%}
			db.close();
		%>
	</div>
	
</body>
<%	String val = request.getParameter("s");
	if(val!=null && !val.isEmpty() && val.equals("ok")){ %>
	<script type="text/javascript">
		alert("Change has been done");
	</script>
<%}else if(val!=null && !val.isEmpty() && val.equals("none")){ %>
	<script type="text/javascript">
		alert("Somthing went wrong!!");
	</script>
<%} %>
</html>