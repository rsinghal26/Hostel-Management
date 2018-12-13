package com.hostelManagement.doa;

import java.sql.SQLException;

import com.hostelManagement.classes.Application;
import com.hostelManagement.classes.ComplaintApplication;

public class ComplaintDb {
	public int complaintInsert(ComplaintApplication complaintApp) throws ClassNotFoundException, SQLException{
		  int status = complaintApp.getStatus();
	      String date = complaintApp.getDate();
	      String applicantId = complaintApp.getApplicantId();
	      String reason = complaintApp.getReason();
	      int category = complaintApp.getCategory();
	      int id = Application.getId();
	      
	      String sql = "INSERT INTO FilesComplaint values('"+id+"','"+applicantId+"','"+date+"','"+reason+"','"+category+"','"+status+"')";
	      
	      DatabaseConnection db = new DatabaseConnection();
	      db.connect();
	      int count = db.update(sql);
	      Application.setId(id+1);
	      db.close();
	      return count;
	}
}
