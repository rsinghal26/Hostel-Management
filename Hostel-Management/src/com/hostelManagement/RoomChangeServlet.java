package com.hostelManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hostelManagement.classes.Application;
import com.hostelManagement.classes.RoomChangeApplication;
import com.hostelManagement.doa.DatabaseConnection;
import com.hostelManagement.doa.RoomChangeDb;

@WebServlet("/applyRoomChange")
public class RoomChangeServlet extends HttpServlet{
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException{
		HttpSession session = req.getSession();
		
		String rollNo = (String) session.getAttribute("rollNo");
		String email = (String) session.getAttribute("email");
		String branch = (String) session.getAttribute("branch");
		String currentRoom = req.getParameter("currentRoom");
		String currentHostel = req.getParameter("currentHostel");
		String reason = (String)req.getParameter("message");
		
		String sql = "SELECT * FROM roomhostel WHERE roomNo = '"+currentRoom+"'AND hostelID='"+currentHostel+"'";

		DatabaseConnection db1 = new DatabaseConnection();
	      try {
			db1.connect();
			ResultSet rs = db1.Query(sql);
		    //System.out.println("hostel->"+rs.next());
		    if (rs.next()){
//		    	res.sendRedirect("RoomChange.jsp?s=ok");
			    //db1.close();
		    	long millis=System.currentTimeMillis();  
				java.sql.Date date=new java.sql.Date(millis);  
				
				RoomChangeApplication roomChangeApp = new RoomChangeApplication(1,reason,date.toString(),rollNo,currentRoom,currentHostel);
				RoomChangeDb db = new RoomChangeDb();
				
				try {
					int count = db.roomChangeInsert(roomChangeApp);
					if(count > 0){
						//successful
						res.sendRedirect("RoomChange.jsp?s=ok");
					}else{
						res.sendRedirect("RoomChange.jsp?s=none");
					}
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

		    }else{
		    	res.sendRedirect("RoomChange.jsp?s=noe");
		    }
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	      
		

	}
}