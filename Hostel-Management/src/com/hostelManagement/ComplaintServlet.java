package com.hostelManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hostelManagement.classes.ComplaintApplication;
import com.hostelManagement.doa.ComplaintDb;

@WebServlet("/applyComplaint")
public class ComplaintServlet extends HttpServlet{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException{
		HttpSession session = req.getSession();
		
		String rollNo = (String) session.getAttribute("rollNo");
		String email = (String) session.getAttribute("email");
		String branch = (String) session.getAttribute("branch");
		int category = Integer.parseInt(req.getParameter("category"));
		String reason = (String)req.getParameter("message");
		
		long millis=System.currentTimeMillis();  
		java.sql.Date date=new java.sql.Date(millis); 
		
		ComplaintApplication complaintApp = new ComplaintApplication(1,reason,date.toString(),rollNo,category);
		ComplaintDb db = new ComplaintDb();
		
		try {
			int count = db.complaintInsert(complaintApp);
			if(count > 0){
				//successful
				res.sendRedirect("FileComplaint.jsp?s=ok");
			}else{
				res.sendRedirect("FileComplaint.jsp?s=none");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		PrintWriter out  = res.getWriter();
		out.println(category);
		out.println(reason);
		out.println(rollNo);
		out.println(email);
		out.println(branch);
		out.println(date);
	}
}