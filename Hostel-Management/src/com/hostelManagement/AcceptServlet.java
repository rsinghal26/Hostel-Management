package com.hostelManagement;

import java.io.IOException;
import java.sql.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hostelManagement.doa.DatabaseConnection;

@WebServlet("/acceptApplication")
public class AcceptServlet extends HttpServlet{
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException{
		String type = req.getParameter("type");
		String id = req.getParameter("id");
		String appType = req.getParameter("appType");
		int count;
		DatabaseConnection db = new DatabaseConnection();
    	try {
			db.connect();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		String sql;
		if(type.equals("accept")){
			sql = "UPDATE "+appType+" SET status = 2 WHERE application_id='"+id+"'";
		}else{
			sql = "UPDATE "+appType+" SET status = 0 WHERE application_id='"+id+"'";
		}
		
		try {
			count = db.update(sql);
			db.close();
			if(count > 0){
				//successful
				res.sendRedirect("AdminLeave.jsp?s=ok");
			}else{
				res.sendRedirect("AdminLeave.jsp?s=none");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
