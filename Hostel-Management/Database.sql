
create table InTimeApplication (
	application_id int Primary key NOT NULL,
	applicant_id nvarchar(10) NOT NULL,
	application_date Date NOT NULL,
	fromDate Date NOT NULL,
	toDate Date NOT NULL,
	reason text,
	duration int,
	facultyMentor nvarchar(20),
	status int
);

create table leaveapplication (
	application_id int PRIMARY KEY NOT NULL,
	applicant_id nvarchar(10) NOT NULL,
	to_ Date NOT NULL,
	from_ Date NOT NULL,
	application_date Date NOT NULL,
	reason text,
	status int
);

create table RoomChange(
	application_id int PRIMARY KEY NOT NULL,
	applicant_id nvarchar(10) NOT NULL,
	application_date Date NOT NULL,
	applicantHostel nvarchar(5),
	applicantRoom nvarchar(10),
	reason text,
	status int
);

create table Room(
	roomNo nvarchar(10) Primary key NOT NULL,
	type nvarchar(5),
	capacity int
);

create table Complaint ( 
	categoryID int Primary key,
	categoryName nvarchar(50)
);

create table RoomHostel (
	roomNo nvarchar(10),
	isAllocated boolean,
	hostelID nvarchar(10),
	FOREIGN KEY (roomNo) REFERENCES Room(roomNo)
);

create table FilesComplaint(
	application_id int Primary key,
	applicant_id nvarchar(10),
	complaintDate Date,
	details text,
	categoryID int,
	status int,
	FOREIGN KEY (categoryID) REFERENCES Complaint(categoryID)
);


create table Hostel(
	hostelID nvarchar(10) Primary key,
	hostelName nvarchar(10),
	capacity int,
	roomsCount int
);




