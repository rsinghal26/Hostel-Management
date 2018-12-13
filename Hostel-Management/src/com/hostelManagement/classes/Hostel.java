package com.hostelManagement.classes;

public class Hostel {
	private String hostelId;
	private String hostelName;
	private int hostelCapacity;
	private int roomsCount;
	
	Hostel(String hostelId,String hostelName,int hostelCapacity,int roomsCount){
		this.hostelId = hostelId;
		this.hostelName = hostelName;
		this.hostelCapacity = hostelCapacity;
		this.roomsCount = roomsCount;
	}

	public String getHostelId() {
		return hostelId;
	}

	public void setHostelId(String hostelId) {
		this.hostelId = hostelId;
	}

	public String getHostelName() {
		return hostelName;
	}

	public void setHostelName(String hostelName) {
		this.hostelName = hostelName;
	}

	public int getHostelCapacity() {
		return hostelCapacity;
	}

	public void setHostelCapacity(int hostelCapacity) {
		this.hostelCapacity = hostelCapacity;
	}

	public int getRoomsCount() {
		return roomsCount;
	}

	public void setRoomsCount(int roomsCount) {
		this.roomsCount = roomsCount;
	}
}
