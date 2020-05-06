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
          Manuscript_ID varchar(3) primary key,
Title varchar(15),
Manuscript_Final varchar(15),
Manuscript_Type varchar(30)
) ENGINE = INNODB; 
 
CREATE TABLE Being_Reviewed (
			Manuscript_ID varchar(3) primary key,
foreign key (Manuscript_ID) references Manuscript (Manuscript_ID)
) ENGINE = INNODB;

CREATE TABLE Author(
Author_ID varchar(15) primary key,
Author_Name varchar(15), 
Mail_Address varchar(30),
Email_Address varchar(20),
Affiliation varchar(25)
) ENGINE = INNODB; 

CREATE TABLE Issue (
			Issue_ID varchar(3) primary key,
publicationPeriod varchar(10),
publicationYear varchar(4),
volume varchar(2),
Issue_number varchar(3),
printDate date
) ENGINE = INNODB;

CREATE TABLE Reviewer (
	Reviewer_ID varchar(3) primary key,
Reviewer_Name varchar(15),
Reviewer_Affiliation varchar(25),
Reviewer_Email varchar(25)
) ENGINE = INNODB;


CREATE TABLE AreaOfInterest (
         Interest_ID varchar(6) primary key,
Description varchar(20)
) ENGINE = InnoDB;


CREATE TABLE AcceptedManuscript (
			Manuscript_ID varchar(3),
Issue_ID varchar(3),
orderWithinIssue varchar(15),
beginningPageNumber int,
numberofPages int,
AcceptedDate date,
primary key (Manuscript_ID, Issue_ID),
foreign key (Manuscript_ID) references Being_Reviewed (Manuscript_ID),
foreign key (Issue_ID) references Issue (Issue_ID)
) ENGINE = INNODB;

CREATE TABLE RejectedManuscript (
			Manuscript_ID varchar(3) primary key,
foreign key (Manuscript_ID) references Being_Reviewed (Manuscript_ID),
RejectedDate date
) ENGINE = INNODB;


CREATE TABLE ReviewerInterest (
			Reviewer_ID varchar(3),
			Interest_ID varchar(6),
primary key (Reviewer_ID, Interest_ID),
foreign key (Reviewer_ID) references Reviewer (Reviewer_ID),
foreign key (Interest_ID) references AreaOfInterest (Interest_ID)
) ENGINE = INNODB;

CREATE TABLE Submission (
			Manuscript_ID varchar(3),
			Author_ID varchar(15),
submitDate date,
AuthorOrder varchar(2),
Manu_Status varchar(20),
primary key (Manuscript_ID, Author_ID),
foreign key (Manuscript_ID) references Manuscript (Manuscript_ID),
foreign key (Author_ID) references Author (Author_ID)
) ENGINE = INNODB;


CREATE TABLE ReviewerAssignment (
			Manuscript_ID varchar(3),
			Reviewer_ID varchar(3),
dateSentToReviewer date, 
primary key (Manuscript_ID, Reviewer_ID),
foreign key (Manuscript_ID) references Being_Reviewed (Manuscript_ID),
foreign key (Reviewer_ID) references Reviewer (Reviewer_ID)
) ENGINE = INNODB;

CREATE TABLE Typeset (
			Manuscript_ID varchar(3),
			Issue_ID varchar(3),
Font varchar(10),
Font_Size int,
Line_Spacing varchar(10),
Justification varchar(20),
primary key (Manuscript_ID, Issue_ID),
foreign key (Manuscript_ID) references AcceptedManuscript (Manuscript_ID),
foreign key (Issue_ID) references AcceptedManuscript (Issue_ID)
) ENGINE = INNODB;

CREATE TABLE Manu_Returned (
			Manuscript_ID varchar(3) primary key,
Return_Status varchar(10),
Return_Date date,
foreign key (Manuscript_ID) references Manuscript (Manuscript_ID)
) ENGINE = INNODB;

CREATE TABLE ManuscriptHistory (
			Manuscript_ID varchar(3),
			ManuscriptHistStatus varchar(15),
ManuHistDate date,
primary key (Manuscript_ID, ManuscriptHistStatus),
foreign key (Manuscript_ID) references Manuscript (Manuscript_ID)
) ENGINE = INNODB; 

CREATE TABLE Feedback (
			Manuscript_ID varchar(3),
			Reviewer_ID varchar(3),
Rating int,
Recommendation varchar(10),
dateReceieved date,
primary key (Manuscript_ID, Reviewer_ID),
foreign key (Reviewer_ID) references Reviewer (Reviewer_ID),
foreign key (Manuscript_ID) references Being_Reviewed (Manuscript_ID)
) ENGINE = INNODB;

	
#Manuscript
INSERT INTO Manuscript VALUES ('001', 'History', 'Published',  'Case Studies');
INSERT INTO Manuscript VALUES ('002', 'Computers', 'Rejected', 'Original Research');
INSERT INTO Manuscript VALUES ('003', 'Computers2', 'Accepted', 'Original Research');
INSERT INTO Manuscript VALUES ('004', 'Math', 'Under Review', 'Original Research');
INSERT INTO Manuscript VALUES ('005', 'Science', 'Published', 'Communication');
INSERT INTO Manuscript VALUES ('006', 'Biology', 'Scheduled', 'Communication');
INSERT INTO Manuscript VALUES ('007', 'Calculus', 'Returned', 'Original Research');
INSERT INTO Manuscript VALUES ('008', 'Phys Ed.', 'Returned', 'Original Research');
INSERT INTO Manuscript VALUES ('009', 'Chemistry', 'Rejected', 'Case Study');

#Authors
INSERT INTO Author VALUES ('111', 'John Mayer', '123 Harper St.', 'JMayer@gmail.com', 'High School');
INSERT INTO Author VALUES ('112', 'Alice Light', '156 Wallace Ave', 'ALight@yahoo.com', 'Comp Tech');
INSERT INTO Author VALUES ('113', 'Robert Lander', '535 Lamper St.', 'RLander@aol.com', 'Math Club');
INSERT INTO Author VALUES ('114', 'Forest Law', '004 Tecken St.', 'ForLaw3@hotmail.com', 'Hospital');
INSERT INTO Author VALUES ('115', 'Jessica Quest', '229 Alexandra Blvd', 'JQuest56@msn.com', 'Medical Center');

#Being_Reviewed
INSERT INTO Being_Reviewed VALUES ('001');
INSERT INTO Being_Reviewed VALUES ('002');
INSERT INTO Being_Reviewed VALUES ('003'); 
INSERT INTO Being_Reviewed VALUES ('004');
INSERT INTO Being_Reviewed VALUES ('005');
INSERT INTO Being_Reviewed VALUES ('006');
INSERT INTO Being_Reviewed VALUES ('009');

#Submission
INSERT INTO Submission Values ('001', '111', '2018/03/01', '01', 'Published');
INSERT INTO Submission Values ('001', '112', '2018/03/01', '02', 'Published');
INSERT INTO Submission Values ('001', '113', '2018/03/01', '03', 'Published');
INSERT INTO Submission Values ('002', '112', '2018/03/01', '01', 'Rejected');
INSERT INTO Submission Values ('002', '113', '2018/03/01', '02', 'Rejected');
INSERT INTO Submission Values ('002', '114', '2018/03/01', '03', 'Rejected');
INSERT INTO Submission Values ('003', '112', '2018/03/04','01', 'Accepted');
INSERT INTO Submission Values ('003', '113', '2018/03/04','02', 'Accepted');
INSERT INTO Submission Values ('004', '113', '2018/03/04', '01', 'Under Review');
INSERT INTO Submission Values ('004', '114', '2018/03/04', '02', 'Under Review');
INSERT INTO Submission Values ('004', '115', '2018/03/04', '03', 'Under Review');
INSERT INTO Submission Values ('005', '114', '2018/03/07', '01', 'Published');
INSERT INTO Submission Values ('005', '115', '2018/03/07', '02', 'Published');
INSERT INTO Submission Values ('005', '111', '2018/03/07', '03', 'Published');
INSERT INTO Submission Values ('006', '114', '2018/03/07', '01', 'Scheduled');
INSERT INTO Submission Values ('007', '113', '2018/03/09', '01', 'Returned');
INSERT INTO Submission Values ('007', '114', '2018/03/09', '02', 'Returned');
INSERT INTO Submission Values ('008', '115', '2018/03/09', '01', 'Returned');
INSERT INTO Submission Values ('009', '112', '2018/03/10', '01', 'Rejected');
INSERT INTO Submission Values ('009', '113', '2018/03/10', '02', 'Rejected');

#Manu_Returned
INSERT INTO Manu_Returned VALUES ('007', 'Returned', '2018/03/10');
INSERT INTO Manu_Returned VALUES ('008', 'Returned', '2018/03/11');

#Reviewer
INSERT INTO Reviewer VALUES('123', 'Lenny Jenkins', 'High School',  'LenJen@gmail.com');
INSERT INTO Reviewer VALUES('124', 'Wallace Menk', 'Medical Center', 'WallyMenk@yahoo.com');
INSERT INTO Reviewer VALUES('125', 'Jennifer Pret', 'Hospital', 'JPret@aol.com');
INSERT INTO Reviewer VALUES('126', 'Raul Ortiz', 'Music Club', 'ROrtiz@aol.com');
INSERT INTO Reviewer VALUES('127', 'Jacob Key', 'Math Club', 'JKey@hotmail.com');
INSERT INTO Reviewer VALUES('128', 'Emma Poppie', 'Medical Center', 'EmmiePop@gmail.com');
INSERT INTO Reviewer VALUES('129', 'Julia Makoto', 'Comp Tech', 'JMakoto@msn.com');
INSERT INTO Reviewer VALUES('130', 'Taylor Font', 'Biology Club', 'FontTay@msn.com');
INSERT INTO Reviewer VALUES('131', 'Robert Zen', 'High School', 'RZen@hotmail.com'); 

#ReviewerAssignment
INSERT INTO ReviewerAssignment VALUES ('001', '123', '2018/03/04');
INSERT INTO ReviewerAssignment VALUES ('001', '124', '2018/03/04');
INSERT INTO ReviewerAssignment VALUES ('001', '126', '2018/03/04');
INSERT INTO ReviewerAssignment VALUES ('001', '131', '2018/03/05');

INSERT INTO ReviewerAssignment VALUES ('002', '123', '2018/03/06');
INSERT INTO ReviewerAssignment VALUES ('002', '125', '2018/03/06');
INSERT INTO ReviewerAssignment VALUES ('002', '130', '2018/03/06');

INSERT INTO ReviewerAssignment VALUES ('003', '127', '2018/03/05');
INSERT INTO ReviewerAssignment VALUES ('003', '129', '2018/03/05');
INSERT INTO ReviewerAssignment VALUES ('003', '123', '2018/03/05');
INSERT INTO ReviewerAssignment VALUES ('003', '124', '2018/03/08');

INSERT INTO ReviewerAssignment VALUES ('004', '127', '2018/03/06');
INSERT INTO ReviewerAssignment VALUES ('004', '129', '2018/03/06');
INSERT INTO ReviewerAssignment VALUES ('004', '131', '2018/03/07');
INSERT INTO ReviewerAssignment VALUES ('004', '128', '2018/03/07');

INSERT INTO ReviewerAssignment VALUES ('005', '123', '2018/03/08');
INSERT INTO ReviewerAssignment VALUES ('005', '129', '2018/03/08');
INSERT INTO ReviewerAssignment VALUES ('005', '127', '2018/03/09');
INSERT INTO ReviewerAssignment VALUES ('005', '128', '2018/03/09');
INSERT INTO ReviewerAssignment VALUES ('005', '125', '2018/03/09');

INSERT INTO ReviewerAssignment VALUES ('006', '126', '2018/03/10');
INSERT INTO ReviewerAssignment VALUES ('006', '130', '2018/03/10');
INSERT INTO ReviewerAssignment VALUES ('006', '131', '2018/03/11');
INSERT INTO ReviewerAssignment VALUES ('006', '129', '2018/03/11');

INSERT INTO ReviewerAssignment VALUES ('009', '124', '2018/03/10');
INSERT INTO ReviewerAssignment VALUES ('009', '130', '2018/03/10');
INSERT INTO ReviewerAssignment VALUES ('009', '125', '2018/03/12');
INSERT INTO ReviewerAssignment VALUES ('009', '128', '2018/03/12');


#Issue
INSERT INTO Issue VALUES ('010', 'Summer', '2018', 05, '07', '2018/05/25');
INSERT INTO Issue VALUES ('011', 'Autumn', '2018', 03, '10', '2018/09/03');
INSERT INTO Issue VALUES ('012', 'Winter', '2018', 10, '15', '2018/12/05');
INSERT INTO Issue VALUES ('013', 'Winter', '2019', 07, '16', '2019/01/09');
INSERT INTO Issue VALUES ('014', 'Spring', '2019', 12, '18', '2019/03/22');
INSERT INTO Issue VALUES ('015', 'Spring', '2019', 02, '20', '2019/04/15');


#AreaOfInterest
INSERT INTO AreaOfInterest VALUES ('900', 'School Basics');
INSERT INTO AreaOfInterest VALUES ('901', 'Medical Information');
INSERT INTO AreaOfInterest VALUES ('903', 'Musical Theory');
INSERT INTO AreaOfInterest VALUES ('904', 'Mathematics');
INSERT INTO AreaOfInterest VALUES ('906', 'Computer Technology');

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
INSERT INTO ManuscriptHistory VALUES ('007', 'Returned', '2018/03/10');

INSERT INTO ManuscriptHistory VALUES ('008', 'Submitted', '2018/03/09');
INSERT INTO ManuscriptHistory VALUES ('008', 'Returned', '2018/03/12');

INSERT INTO ManuscriptHistory VALUES ('009', 'Submitted', '2018/03/10');
INSERT INTO ManuscriptHistory VALUES ('009', 'Under Review', '2018/03/12');
INSERT INTO ManuscriptHistory VALUES ('009', 'Rejected', '2018/03/20');

#RejectedManuscript
INSERT INTO RejectedManuscript VALUES ('002', '2018/03/10');
INSERT INTO RejectedManuscript VALUES ('009', '2018/03/20');

#AcceptedManuscript
INSERT INTO AcceptedManuscript VALUES ('001', '010', 'Middle' , 35, 11, '2018/03/22');
INSERT INTO AcceptedManuscript VALUES ('004', '011', 'Beginning', 05, 12, '2018/03/23');
INSERT INTO AcceptedManuscript VALUES ('005', '012', 'End', 53, 10, '2018/03/27');
INSERT INTO AcceptedManuscript VALUES ('006', '014', 'Middle', 31, 10, '2018/03/29');

#Typeset
INSERT INTO Typeset VALUES ('001', '010', 'Arial', 14, 'Double', 'Research');
INSERT INTO Typeset VALUES ('004', '011', 'Cursive', 12, 'Single', 'Problem Solving');
INSERT INTO Typeset VALUES ('005', '012', 'Cursive', 12, 'Single', 'Research');
INSERT INTO Typeset VALUES ('006', '014', 'Calibri', 10, 'Double', 'Teaching');

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

INSERT INTO Feedback VALUES ('009', '124', 04, 'No', '2018/03/16');
INSERT INTO Feedback VALUES ('009', '130', 05, 'Yes', '2018/03/16');
INSERT INTO Feedback VALUES ('009','125', 03, 'No', '2018/03/17');
INSERT INTO Feedback VALUES ('009','128', 04, 'No', '2018/03/20');



#Find the number of accepted manuscripts
SELECT COUNT(*) AS Accepted
FROM ManuscriptHistory
WHERE ManuscriptHistStatus = 'Accepted';

#Find the name of Author 112
SELECT Author_Name
FROM Author
WHERE Author_ID = '112';

#List the details of all reviewers
SELECT *
FROM Reviewer, AreaOfInterest, ReviewerInterest
WHERE AreaOfInterest.Interest_ID = ReviewerInterest.Interest_ID
AND Reviewer.Reviewer_ID = ReviewerInterest.Reviewer_ID;

#List the number of reviewers interested in Medical Information
SELECT Reviewer_Name
FROM Reviewer, ReviewerInterest, AreaOfInterest
WHERE AreaOfInterest.Interest_ID = ReviewerInterest.Interest_ID
AND Reviewer.Reviewer_ID = ReviewerInterest.Reviewer_ID
AND description = 'Medical Information';

#Find the information of rejected manuscripts
SELECT RejectedManuscript.Manuscript_ID, RejectedDate, Title
FROM RejectedManuscript, Manuscript, Being_Reviewed
WHERE Manuscript.Manuscript_ID = Being_Reviewed.Manuscript_ID
AND Being_Reviewed.Manuscript_ID= RejectedManuscript.Manuscript_ID;

#List the Authors with Manuscript Type Communication OR Original Research
SELECT DISTINCT Author.Author_Name, Author.Author_ID, Manuscript.Manuscript_Type
FROM Author, Manuscript, Submission
WHERE Author.Author_ID = Submission.Author_ID
AND Submission.Manuscript_ID = Manuscript.Manuscript_ID
AND (Manuscript_Type = 'Communication'
OR Manuscript_Type = 'Original Research');

#Find the Manuscript Numbers that have font size greater than 10
SELECT Typeset.Manuscript_ID, Typeset.Font_Size
FROM Typeset, AcceptedManuscript
WHERE Typeset.Manuscript_ID = AcceptedManuscript.Manuscript_ID
AND Typeset.Font_Size > 10
ORDER BY Font_Size ASC; 

#Print the feedback that have a rating above the average rating
SELECT *
FROM Feedback
WHERE Rating > (SELECT AVG(Rating) FROM Feedback);

#List Issues that are dated to release in 2019
SELECT Issue.Issue_ID, Issue.printDate
FROM Issue
WHERE Issue.publicationYear = '2019';


#Add a new reviewer
INSERT INTO Reviewer (Reviewer_ID, Reviewer_Name, Reviewer_Affiliation, Reviewer_Email)
VALUES ('132', 'Jerry Smith', 'High School', 'JSmith@yahoo.com');

#Add a new author
INSERT INTO Author (Author_ID, Author_Name, Mail_Address, Author_Email, Author_Affiliation) 
VALUES ('116', 'Phoenix Wright', '234 Law Drive', 'PWright@gmail.com', 'Law Office');

#Change the Title of Manuscript 004 to Calculus
UPDATE Manuscript
SET Title = 'Calculus'
WHERE Manuscript_ID = '004';

#Delete all Authors affilated with High School
DELETE FROM Author
WHERE Affiliation = 'High School';



