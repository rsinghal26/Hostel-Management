package com.hostelManagement.classes;

public class Room {
	private String roomNo;
	private String roomType;
	private int capacity;
	private boolean isAllocated;
	
	Room(String roomNo,String roomType,int capacity,boolean isAllocated){
		this.roomNo = roomNo;
		this.roomType = roomType;
		this.capacity = capacity;
		this.isAllocated = isAllocated;
	}

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public boolean isAllocated() {
		return isAllocated;
	}

	public void setAllocated(boolean isAllocated) {
		this.isAllocated = isAllocated;
	}
}
