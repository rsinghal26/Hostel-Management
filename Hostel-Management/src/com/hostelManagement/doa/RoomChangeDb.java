package com.hostelManagement.doa;

import java.sql.SQLException;

import com.hostelManagement.classes.Application;
import com.hostelManagement.classes.RoomChangeApplication;

public class RoomChangeDb {
	public int roomChangeInsert(RoomChangeApplication roomChangeApp) throws ClassNotFoundException, SQLException{
		  int status = roomChangeApp.getStatus();
	      String reason = roomChangeApp.getReason();
	      String date = roomChangeApp.getDate();
	      String applicantId = roomChangeApp.getApplicantId();
	      String currentRoom = roomChangeApp.getCurrentHostel();
	      String currentHostel = roomChangeApp.getCurrentRoom();
	      int id = Application.getId();
	      
	      String sql = "INSERT INTO RoomChange values('"+id+"','"+applicantId+"','"+date+"','"+currentRoom+"','"+currentHostel+"','"+reason+"','"+status+"')";
	      
	      DatabaseConnection db = new DatabaseConnection();
	      db.connect();
	      int count = db.update(sql);
	      Application.setId(id+1);
	      db.close();
	      return count;
	}
}
