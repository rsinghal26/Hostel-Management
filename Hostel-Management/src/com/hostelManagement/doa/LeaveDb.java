package com.hostelManagement.doa;

import java.sql.*;

import com.hostelManagement.classes.Application;
import com.hostelManagement.classes.LeaveApplication;

public class LeaveDb {
	
	public int leaveInsert(LeaveApplication leaveApp) throws ClassNotFoundException, SQLException {
		      int status = leaveApp.getStatus();
		      String reason = leaveApp.getReason();
		      String date = leaveApp.getDate();
		      String applicantId = leaveApp.getApplicantId();
		      String fromDate = leaveApp.getFromDate();
		      String toDate = leaveApp.getToDate();
		      int id = Application.getId();
		      
		      String sql = "INSERT INTO leaveapplication values('"+id+"','"+applicantId+"','"+toDate+"','"+fromDate+"','"+date+"','"+reason+"','"+status+"')";
		      
		      DatabaseConnection db = new DatabaseConnection();
		      db.connect();
		      int count = db.update(sql);
		      Application.setId(id+1);
		      db.close();
		      return count;
	}
}