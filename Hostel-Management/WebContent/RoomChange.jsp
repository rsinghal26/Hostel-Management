<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      
      <%if(session.getAttribute("userType").equals("")){
	response.sendRedirect("Home.jsp");
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
	  <div class="dropdown active">
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
	
	<fieldset style="margin-top:20px">
		<legend>Room Change Application</legend>
	
	<div style="margin-top:20px;padding:10px;">
            <fieldset>
                <legend>Student Information</legend>
                <label for="rollNo"><b>Roll No.</b></label>
                <span><%=session.getAttribute("rollNo") %></span>
                <label for="email"><b>Email:</b></label>
                <span><%=session.getAttribute("email") %></span>
                <label for="branch"><b>Branch:</b></label>
                <span><%=session.getAttribute("branch") %></span>
            </fieldset>
	</div>
	
	<div style="margin-top:20px;padding:10px">
		<form action="applyRoomChange" method="post">
            <fieldset style="padding:10px">
    			<div style="margin-bottom:10px">
	                <label for="From"><b>Current Room:</b></label>
	                <input type="text" name="currentRoom" style="margin-right:30px" required>
	                <label for="To"><b>Current Hostel:</b></label>
	                <select name = "currentHostel">
					  <option value="BH-1">BH-1</option>
					  <option value="BH-2">BH-2</option>
					  <option value="BH-3">BH-3</option>
					  <option value="GH">GH</option>
					</select> <br/>
                </div>
                <label for="reason"><b>Reason:</b></label><br>
                <textarea name="message" rows="5" cols="40" required></textarea> <br/>
                <input type="submit">
            </fieldset>
        </form>
	</div>
	
</fieldset>
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
<%}else if(val!=null && !val.isEmpty() && val.equals("noe")){ %>
	<script type="text/javascript">
		alert("Invalid room or hostel!!");
	</script>
<%} %>
</html>