DROP DATABASE IF EXISTS DBMS;
CREATE DATABASE DBMS;
USE DBMS;
DROP TABLE IF EXISTS Manuscript;
DROP TABLE IF EXISTS Author;
DROP TABLE IF EXISTS Issue;
DROP TABLE IF EXISTS AcceptedManuscript;
DROP TABLE IF EXISTS Feedback;
DROP TABLE IF EXISTS BeingReviewed;
DROP TABLE IF EXISTS ReviewerInterest;
DROP TABLE IF EXISTS AreaOfInterest;
DROP TABLE IF EXISTS Submission;
DROP TABLE IF EXISTS Typeset;
DROP TABLE IF EXISTS Returned;
DROP TABLE IF EXISTS ManuHistory;
DROP TABLE IF EXISTS Manu_Returned;
DROP TABLE IF EXISTS RejectedManuscript;
DROP TABLE IF EXISTS ReviewerAssignment;

CREATE TABLE Manuscript (
          Manuscript_Number varchar(3) primary key,
Title varchar(15),
Manuscript_Status varchar(15),
Author_ID varchar(15)
#foreign key (Author_ID) references Submission(Author_ID)
); 
 

CREATE TABLE Author(
Author_ID varchar(15) primary key,
Author_Name varchar(15), 
Mail_Address varchar(30),
Email_Address varchar(20),
Affiliation varchar(25)
); 

CREATE TABLE Reviewer (
	Reviewer_Number varchar(3) primary key,
Reviewer_Name varchar(15),
Reviewer_Affiliation varchar(25),
Interest_ID varchar(6),
Reviewer_Email varchar(25)
#Reviewer (Interest_ID) references AreaOfInterest(Interest_ID)
);


CREATE TABLE AreaOfInterest (
         Interest_ID varchar(6) primary key,
Description varchar(20)
);

CREATE TABLE Feedback (
		Reviewer_Number varchar(3) primary key,
			Manuscript_Number varchar(3),
Feedback_Rating int,
Feedback_Recommendation varchar(10),
Feedback_dateReceieved date
#Feedback (Reviewer_Number) references Reviewer (Reviewer_Number)
#Feedback (Manuscript_Number) references Manuscript (Manuscript_Number)
);

CREATE TABLE AcceptedManuscript (
			Manuscript_Number varchar(3) primary key,
Issue_ID varchar(3),
orderWithinIssue varchar(15),
beginningPageNumber int,
numberofPages int,
AcceptedDate date
#AcceptedManuscript (Manuscript_Number) references Manuscript (Manuscript_Number)
#AcceptedManuscript (Issue_ID) references Issue (Issue_ID)
);

CREATE TABLE RejectedManuscript (
			Manuscript_Number varchar(3) primary key,
RejectedDate date
);

CREATE TABLE Issue (
			Issue_ID varchar(3) primary key,
publicationPeriod varchar(10),
publicationYear varchar(4),
volume varchar(2),
Issue_number varchar(3),
printDate date
);

CREATE TABLE ReviewerInterest (
			Reviewer_Number varchar(3),
			Interest_ID varchar(6) primary key
#ReviewerInterest (Reviewer_Number) references Reveiwer (Reviewer_Number)
#ReviewerInterest (Interest_ID) references AreaOfInterest (Interest_ID)
);

CREATE TABLE Submission (
			Manuscript_Number varchar(3) primary key,
			Author_ID varchar(15),
submitDate date,
AuthorOrder varchar(2)
#Manuscript_Number references Manuscript (Manuscript_Number)
#Author_ID references Author (Author_ID)
);

CREATE TABLE Being_Reviewed (
			Manuscript_Number varchar(3) primary key,
			Reviewer_Number varchar(3),
dateSentToReviewer date
);

CREATE TABLE ReviewerAssignment (
			Reviewer_Number varchar(3) primary key,
			Manuscript_Number varchar(3)
);
CREATE TABLE Typeset (
			Manuscript_Number varchar(3),
			Issue_ID varchar(3) primary key,
Font varchar(10),
Font_Size int,
Line_Spacing varchar(10),
Justification varchar(20)
);

CREATE TABLE Manu_Returned (
			Manuscript_Number varchar(3) primary key,
Return_Status varchar(10),
Return_Date date
);

CREATE TABLE Manu_History (
			Manuscript_Number varchar(3),
			Manuscript_Status varchar(15) primary key,
ManuHisDate date
); 
	
#Manuscript
INSERT INTO Manuscript VALUES ('001', 'History', 'Published', '111');
INSERT INTO Manuscript VALUES ('002', 'Computers', 'Rejected', '112');
INSERT INTO Manuscript VALUES ('003', 'Computers2', 'Accepted', '112');
INSERT INTO Manuscript VALUES ('004', 'Math', 'Under Review', '113');
INSERT INTO Manuscript VALUES ('005', 'Science', 'Published', '114');
INSERT INTO Manuscript VALUES ('006', 'Biology', 'Scheduled', '114');
INSERT INTO Manuscript VALUES ('007', 'Calculus', 'Returned', '113');

#Authors
INSERT INTO Author VALUES ('111', 'John Mayer', '123 Harper St.', 'JMayer@gmail.com', 'High School');
INSERT INTO Author VALUES ('112', 'Alice Light', '156 Wallace Ave', 'ALight@yahoo.com', 'Comp Tech');
INSERT INTO Author VALUES ('113', 'Robert Lander', '535 Lamper St.', 'RLander@aol.com', 'Math Club');
INSERT INTO Author VALUES ('114', 'Forest Law', '004 Tecken St.', 'ForLaw3@hotmail.com', 'Hospital');
INSERT INTO Author VALUES ('115', 'Jessica Quest', '229 Alexandra Blvd', 'JQuest56@msn.com', 'Medical Center');

#Submission
INSERT INTO Submission Values ('001', '111', '2018/03/01', '01');
INSERT INTO Submission Values ('002', '112', '2018/03/01', '02');
INSERT INTO Submission Values ('003', '112', '2018/03/04','02');
INSERT INTO Submission Values ('004', '113', '2018/03/04', '03');
INSERT INTO Submission Values ('005', '114', '2018/03/07', '04');
INSERT INTO Submission Values ('006', '114', '2018/03/07', '04');
INSERT INTO Submission Values ('007', '113', '2018/03/09', '03');
INSERT INTO Submission Values ('008', '115', '2018/03/09', '05');

#Manu_Returned
INSERT INTO Manu_Returned VALUES ('008', 'Returned', '2018/03/11');

#Reviewer
INSERT INTO Reviewer VALUES('123', 'Lenny Jenkins', 'High School', '900', 'LenJen@gmail.com');
INSERT INTO Reviewer VALUES('124', 'Wallace Menk', 'Medical Center', '901', 'WallyMenk@yahoo.com');
INSERT INTO Reviewer VALUES('125', 'Jennifer Pret', 'Hospital', '901', 'JPret@aol.com');
INSERT INTO Reviewer VALUES('126', 'Raul Ortiz', 'Music Club', '903', 'ROrtiz@aol.com');
INSERT INTO Reviewer VALUES('127', 'Jacob Key', 'Math Club', '904', 'JKey@hotmail.com');
INSERT INTO Reviewer VALUES('128', 'Emma Poppie', 'Medical Center', '901', 'EmmiePop@gmail.com');
INSERT INTO Reviewer VALUES('129', 'Julia Makoto', 'Comp Tech', '906', 'JMakoto@msn.com');
INSERT INTO Reviewer VALUES('130', 'Taylor Font', 'Biology Club', '901', 'FontTay@msn.com');
INSERT INTO Reviewer VALUES('131', 'Robert Zen', 'High School', '900', 'RZen@hotmail.com'); 

#Being_Reviewed
INSERT INTO Being_Reviewed VALUES ('001', '123', '2018/03/04');
INSERT INTO Being_Reviewed VALUES ('001', '124', '2018/03/04');
INSERT INTO Being_Reviewed VALUES ('001', '126', '2018/03/04');
INSERT INTO Being_Reviewed VALUES ('001', '131', '2018/03/05');

INSERT INTO Being_Reviewed VALUES ('002', '123', '2018/03/06');
INSERT INTO Being_Reviewed VALUES ('002', '125', '2018/03/06');
INSERT INTO Being_Reviewed VALUES ('002', '130', '2018/03/06');

INSERT INTO Being_Reviewed VALUES ('003', '127', '2018/03/05');
INSERT INTO Being_Reviewed VALUES ('003', '129', '2018/03/05');
INSERT INTO Being_Reviewed VALUES ('003', '123', '2018/03/05');
INSERT INTO Being_Reviewed VALUES ('003', '124', '2018/03/08');

INSERT INTO Being_Reviewed VALUES ('004', '127', '2018/03/06');
INSERT INTO Being_Reviewed VALUES ('004', '129', '2018/03/06');
INSERT INTO Being_Reviewed VALUES ('004', '131', '2018/03/07');
INSERT INTO Being_Reviewed VALUES ('004', '128', '2018/03/07');

INSERT INTO Being_Reviewed VALUES ('005', '123', '2018/03/08');
INSERT INTO Being_Reviewed VALUES ('005', '129', '2018/03/08');
INSERT INTO Being_Reviewed VALUES ('005', '127', '2018/03/09');
INSERT INTO Being_Reviewed VALUES ('005', '128', '2018/03/09');
INSERT INTO Being_Reviewed VALUES ('005', '125', '2018/03/09');

INSERT INTO Being_Reviewed VALUES ('006', '126', '2018/03/10');
INSERT INTO Being_Reviewed VALUES ('006', '130', '2018/03/10');
INSERT INTO Being_Reviewed VALUES ('006', '131', '2018/03/11');
INSERT INTO Being_Reviewed VALUES ('006', '129', '2018/03/11');

INSERT INTO Being_Reviewed VALUES ('007', '124', '2018/03/10');
INSERT INTO Being_Reviewed VALUES ('007', '130', '2018/03/10');
INSERT INTO Being_Reviewed VALUES ('007', '125', '2018/03/12');
INSERT INTO Being_Reviewed VALUES ('007', '128', '2018/03/12');

#ReviewerAssignment
INSERT INTO ReviewerAssignment VALUES ('001', '123');
INSERT INTO ReviewerAssignment VALUES ('001', '124');
INSERT INTO ReviewerAssignment VALUES ('001', '901'); 

#ReviewerInterest
INSERT INTO ReviewerInterest VALUES ('123', '900');
INSERT INTO ReviewerInterest VALUES ('124', '901');
INSERT INTO ReviewerInterest VALUES ('125', '901');
INSERT INTO ReviewerInterest VALUES ('126', '903');
INSERT INTO ReviewerInterest VALUES ('127', '904');
INSERT INTO ReviewerInterest VALUES ('128', '901');
INSERT INTO ReviewerInterest VALUES ('129', '906');
INSERT INTO ReviewerInterest VALUES ('130', '901');
INSERT INTO ReviewerInterest VALUES ('131', '900');

#AreaOfInterest
INSERT INTO AreaOfInterest VALUES ('900', 'School Basics');
INSERT INTO AreaOfInterest VALUES ('901', 'Medical Information');
INSERT INTO AreaOfInterest VALUES ('903', 'Musical Theory');
INSERT INTO AreaOfInterest VALUES ('904', 'Mathematics');
INSERT INTO AreaOfInterest VALUES ('906', 'Computer Technology');

#ManuscriptHistory
INSERT INTO ManuscriptHistory VALUES ('001', 'Submitted', '2018/03/01');
INSERT INTO ManuscriptHistory VALUES ('001', 'Under Review', '2018/03/04');
INSERT INTO ManuscriptHistory VALUES ('001', 'Accepted', '2018/03/15');
INSERT INTO ManuscriptHistory VALUES ('001', 'Scheduled', '2018/04/03');
INSERT INTO ManuscriptHistory VALUES ('001', 'Published', '2018/05/19');

INSERT INTO ManuscriptHistory VALUES ('002', 'Submitted', '2018/03/01');
INSERT INTO ManuscriptHistory VALUES ('002', 'Under Review', '2018/03/06');
INSERT INTO ManuscriptHistory VALUES ('002', 'Rejected', '2018/03/10');

INSERT INTO ManuscriptHistory VALUES ('003', 'Submitted', '2018/03/04');
INSERT INTO ManuscriptHistory VALUES ('003', 'Under Review', '2018/03/05');

INSERT INTO ManuscriptHistory VALUES ('004', 'Submitted', '2018/03/04');
INSERT INTO ManuscriptHistory VALUES ('004', 'Under Review', '2018/03/06');
INSERT INTO ManuscriptHistory VALUES ('004', 'Accepted', '2018/03/16');

INSERT INTO ManuscriptHistory VALUES ('005', 'Submitted', '2018/03/07');
INSERT INTO ManuscriptHistory VALUES ('005', 'Under Review', '2018/03/08');
INSERT INTO ManuscriptHistory VALUES ('005', 'Accepted', '2018/03/15');
INSERT INTO ManuscriptHistory VALUES ('005', 'Scheduled', '2018/04/15');
INSERT INTO ManuscriptHistory VALUES ('005', 'Published', '2018/08/19');

INSERT INTO ManuscriptHistory VALUES ('006', 'Submitted', '2018/03/07');
INSERT INTO ManuscriptHistory VALUES ('006', 'Under Review', '2018/03/10');
INSERT INTO ManuscriptHistory VALUES ('006', 'Accepted', '2018/03/15');

INSERT INTO ManuscriptHistory VALUES ('007', 'Submitted', '2018/03/09');
INSERT INTO ManuscriptHistory VALUES ('007', 'Under Review', '2018/03/10');
INSERT INTO ManuscriptHistory VALUES ('007', 'Accepted', '2018/03/16');
INSERT INTO ManuscriptHistory VALUES ('007', 'Scheduled', '2018/04/15');

INSERT INTO ManuscriptHistory VALUES ('008', 'Submitted', '2018/03/09');
INSERT INTO ManuscriptHistory VALUES ('008', 'Returned', '2018/03/12');

#RejectedManuscript
INSERT INTO RejectedManuscript VALUES ('002', '2018/03/10');

#AcceptedManuscript
INSERT INTO AcceptedManuscript VALUES ('001', '010', 'Middle' , 35, 11, '2018/03/22');
INSERT INTO AcceptedManuscript VALUES ('004', '011', 'Beginning', 12, '2018/03/23');
INSERT INTO AcceptedManuscript VALUES ('005', '012', 'End', 53, 10, '2018/03/27');
INSERT INTO AcceptedManuscript VALUES ('006', '014', 'Middle', 31, 10, '2018/03/29');
INSERT INTO AcceptedManuscript VALUES ('007', '015', 'Beginning', 10, 06, '2018/03/39');

#Issue
INSERT INTO Issue VALUES ('010', 'Summer', '2018', '07', '2018/05/25');
INSERT INTO Issue VALUES ('011', 'Autumn', '2018', '10', '2018/09/03');
INSERT INTO Issue VALUES ('012', 'Winter', '2018', '15', '2018/12/05');
INSERT INTO Issue VALUES ('013', 'Winter', '2019', '16', '2019/01/09');
INSERT INTO Issue VALUES ('014', 'Spring', '2019', '18', '2019/03/22');
INSERT INTO Issue VALUES ('015', 'Spring', '2019', '20', '2019/04/15');

#Typeset
INSERT INTO Typeset VALUES ('001', '010', 'Arial', 14, 'Double', 'Research');
INSERT INTO Typeset VALUES ('004', '011', 'Cursive', 12, 'Single', 'Problem Solving');
INSERT INTO Typeset VALUES ('005', '012', 'Cursive', 12, 'Single', 'Research');
INSERT INTO Typeset VALUES ('006', '014', 'Calibri', 10, 'Double', 'Teaching');
INSERT INTO Typeset VALUES ('007', '015', 'Calibri', 16, 'Single', 'Teaching');

#Feedback
INSERT INTO Feedback VALUES ('001', '123', 08, 'Yes', '2018/03/05');
INSERT INTO Feedback VALUES ('001', '124', 08, 'Yes', '2018/03/05');
INSERT INTO Feedback VALUES ('001', '126', 07, 'Yes', '2018/03/08');
INSERT INTO Feedback VALUES ('001', '131', 08, 'Yes', '2018/03/13');

INSERT INTO Feedback VALUES ('002', '123', 03, 'No', '2018/03/08');
INSERT INTO Feedback VALUES ('002', '125', 04, 'No', '2018/03/09');
INSERT INTO Feedback VALUES ('002', '130', 06, 'Yes', '2018/03/11');

INSERT INTO Feedback VALUES ('003', '127', 07, 'Yes', '2018/03/08');
INSERT INTO Feedback VALUES ('003', '129', 05, 'No', '2018/03/09');
INSERT INTO Feedback VALUES ('003', '123', 08, 'Yes', '2018/03/10');
INSERT INTO Feedback VALUES ('003', '124', 07, 'Yes', '2018/03/11');

INSERT INTO Feedback VALUES ('004', '127', 10, 'Yes', '2018/03/09');
INSERT INTO Feedback VALUES ('004', '129', 08, 'Yes', '2018/03/10');
INSERT INTO Feedback VALUES ('004', '131', 09, 'Yes', '2018/03/10');
INSERT INTO Feedback VALUES ('004', '128', 09, 'Yes', '2018/03/12');

INSERT INTO Feedback VALUES ('005', '123', 08, 'Yes', '2018/03/10');
INSERT INTO Feedback VALUES ('005', '129', 09, 'Yes', '2018/03/12');
INSERT INTO Feedback VALUES ('005', '127', 08, 'Yes', '2018/03/12');
INSERT INTO Feedback VALUES ('005', '128', 08, 'Yes', '2018/03/14');
INSERT INTO Feedback VALUES ('005', '125', 07, 'Yes', '2018/03/15');

INSERT INTO Feedback VALUES ('006', '126', 07, 'Yes', '2018/03/13');
INSERT INTO Feedback VALUES ('006', '130', 06, 'No', '2018/03/15');
INSERT INTO Feedback VALUES ('006', '131', 08, 'Yes', '2018/03/15');
INSERT INTO Feedback VALUES ('006', '129', 08, 'Yes', '2018/03/17');

INSERT INTO Feedback VALUES ('007', '124', 09, 'Yes', '2018/03/16');
INSERT INTO Feedback VALUES ('007', '130', 09, 'Yes', '2018/03/16');
INSERT INTO Feedback VALUES ('007', '125', 08, 'Yes', '2018/03/17');
INSERT INTO Feedback VALUES ('007', '128', 10, 'Yes', '2018/03/20');
