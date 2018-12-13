package com.hostelManagement.classes;

public class RoomChangeApplication extends Application{
	private String currentRoom;
	private String currentHostel;
	
	public RoomChangeApplication(int status,String reason,String date,String applicantId,String currentRoom,String currentHostel){
		super(status,reason,date,applicantId);
		this.currentRoom = currentRoom;
		this.currentHostel = currentHostel;
	}

	public String getCurrentRoom() {
		return currentRoom;
	}

	public void setCurrentRoom(String currentRoom) {
		this.currentRoom = currentRoom;
	}

	public String getCurrentHostel() {
		return currentHostel;
	}

	public void setCurrentHostel(String currentHostel) {
		this.currentHostel = currentHostel;
	}
}