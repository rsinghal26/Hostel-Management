package com.hostelManagement.classes;

public class InTimeApplication extends Application {
	
	private String fromDate;
	private String toDate;
	private int duration;
	private String facultyMantor;
	
	public InTimeApplication(int status,String reason,String date,String applicantId,String fromDate, String toDate, int duration, String facultyMantor){
		super(status, reason, date, applicantId);
		this.fromDate = fromDate;
		this.toDate=toDate;
		this.duration = duration;
		this.facultyMantor = facultyMantor;
		
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

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public String getFacultyMantor() {
		return facultyMantor;
	}

	public void setFacultyMantor(String facultyMantor) {
		this.facultyMantor = facultyMantor;
	}
}
