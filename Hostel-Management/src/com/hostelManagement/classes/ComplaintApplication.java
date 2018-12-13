package com.hostelManagement.classes;

public class ComplaintApplication extends Application{
	private int category;
	
	public ComplaintApplication(int status,String reason,String date,String applicantId,int category){
		super(status,reason,date,applicantId);
		this.category = category;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}
}