package com.hostelManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.hostelManagement.classes.InTimeApplication;
import com.hostelManagement.doa.InTime;

@WebServlet("/applyInTime")
public class InTimeServlet extends HttpServlet {
	
public void service(HttpServletRequest req, HttpServletResponse res) throws IOException{
		 
		HttpSession session = req.getSession();
	
		String rollNo = (String) session.getAttribute("rollNo");
//		String email = (String) session.getAttribute("email");
//		String branch = (String) session.getAttribute("branch");
		String fromDate = req.getParameter("fromDate");
		String toDate = req.getParameter("toDate");
		int duration = Integer.parseInt(req.getParameter("duration"));
		String facultyMantor = req.getParameter("Faculty");
		String reason = (String)req.getParameter("message");
		
		int toY = Integer.parseInt(toDate.substring(0,4));
		int toM = Integer.parseInt(toDate.substring(5,7));
		int toD = Integer.parseInt(toDate.substring(8,10));
		
		int fromY = Integer.parseInt(fromDate.substring(0,4));
		int fromM = Integer.parseInt(fromDate.substring(5,7));
		int fromD = Integer.parseInt(fromDate.substring(8,10));
		
		if((toM==fromM && toY == fromY &&toD > fromD)||(fromY == toY && fromM < toM)||(fromY<toY)){
			long millis=System.currentTimeMillis();  
			java.sql.Date date=new java.sql.Date(millis);  
			
			InTimeApplication inTimeApp = new InTimeApplication(1,reason,date.toString(),rollNo,fromDate,toDate,duration, facultyMantor);
			InTime db = new InTime();
			
			try {
				int count = db.inTimeInsert(inTimeApp);
				if(count > 0){
					//successful
					res.sendRedirect("InTime.jsp?s=ok");
				}else{
					res.sendRedirect("InTime.jsp?s=none");
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			res.sendRedirect("LeaveApp.jsp?s=invalid");
		}
	}
}
