<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import='com.hostelManagement.doa.DatabaseConnection, java.sql.*'%>       
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


table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}

</style>

</head>
<body>

<div class="navbar">
		<a href="Home.jsp">Home</a>	
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
	  <div class="dropdown active">
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
	
	<br>
	<%
		DatabaseConnection db = new DatabaseConnection();
    	db.connect(); 
    	String sql = "SELECT * FROM RoomChange where applicant_id ='"+ session.getAttribute("rollNo") +"'";
    	ResultSet rs = db.Query(sql);	
    %>
<fieldset>
	<h1 style="text-align:center">Room Change Applications</h1>
	<table>
  <tr>
    <th>Application Id</th>
    <th>Current Room</th>
    <th>Current Hostel</th>
    <th>Reason</th>
    <th>Status</th>
  </tr>
  <%	
  	while(rs.next()){
		int applicationId = rs.getInt("application_id");
		String currentRoom = rs.getString("applicantRoom");
		String currentHostel = rs.getString("applicantHostel");
		int status = rs.getInt("status");
		String statusType = "Pending";
		if(status == 2){
			statusType = "Accepted";
		}else if(status == 0){
			statusType = "Rejected";
		}
		String reason = rs.getString("reason"); %>
		<tr>
		  <td><%=applicationId%></td>
		  <td><%=currentRoom%></td>
		  <td><%=currentHostel%></td>
		  <td><%=reason%></td>
			<% if(status == 0){%>
				<td style="color:red"><b><%=statusType%></b></td>
			<% }else if(status == 2){%>
				<td style="color:green"><b><%=statusType%></b></td>
			<%}else{%>
				<td style="color:#e6b800"><b><%=statusType%></b></td>
			<% }%>
		</tr>
  <%} 
  	db.close();
  	rs.close();
  %>
</table>
</fieldset>
</body>
</html>