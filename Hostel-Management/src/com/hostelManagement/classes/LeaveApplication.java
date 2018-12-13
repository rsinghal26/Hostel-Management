package com.hostelManagement.classes;

public class LeaveApplication extends Application {
	
	private String fromDate;
	private String toDate;
	
	public LeaveApplication(int status, String reason, String date, String applicantId,String fromDate,String toDate) {
		super(status, reason, date, applicantId);
		this.fromDate = fromDate;
		this.toDate = toDate;
	}

	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}	
	
}
