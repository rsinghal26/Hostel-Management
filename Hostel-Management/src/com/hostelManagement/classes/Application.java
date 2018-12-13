package com.hostelManagement.classes;

public class Application {

	private static int id = 121;
	private int status;
	private String reason;
	private String date;
	private String applicantId;
	
	Application(int status,String reason,String date,String applicantId){
		this.status = status;
		this.reason = reason;
		this.date = date;
		this.applicantId = applicantId;
	}

	public static int getId() {
		return id;
	}

	public static void setId(int newId) {
		id = newId;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getReason() {
		return reason;
	}

	public String getApplicantId() {
		return applicantId;
	}

	public void setApplicantId(String applicantId) {
		this.applicantId = applicantId;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
}
