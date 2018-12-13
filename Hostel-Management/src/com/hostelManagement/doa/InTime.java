package com.hostelManagement.doa;

import java.sql.SQLException;

import com.hostelManagement.classes.Application;
import com.hostelManagement.classes.InTimeApplication;

public class InTime {
	public int inTimeInsert(InTimeApplication inTimeApp) throws ClassNotFoundException, SQLException{
		  int status = inTimeApp.getStatus();
	      String reason = inTimeApp.getReason();
	      String date = inTimeApp.getDate();
	      String toDate = inTimeApp.getToDate();
	      String fromDate = inTimeApp.getFromDate();
	      String applicantId = inTimeApp.getApplicantId();
	      String facultyMentor = inTimeApp.getFacultyMantor();
	      int duration = inTimeApp.getDuration();
	      int id = Application.getId();
	      
	      String sql = "INSERT INTO InTimeApplication values('"+id+"','"+applicantId+"','"+date+"','"+fromDate+"','"+toDate+"','"+reason+"','"+duration+"','"+facultyMentor+"','"+status+"')";
	      
	      DatabaseConnection db = new DatabaseConnection();
	      db.connect();
	      int count = db.update(sql);
	      Application.setId(id+1);
	      db.close();
	      return count;
	}
}
