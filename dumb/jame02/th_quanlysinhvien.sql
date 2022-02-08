CREATE DATABASE QuanLySinhVien;

Use QuanLySinhVien;

CREATE TABLE class (
classID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
className VARCHAR(60) not null,
startDate DATETIME not null,
status BIT
);

create table student (
studentID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
studentName varchar(30) NOT null,
address VARCHAR(50),
phone VARCHAR(20),
status bit,
classID int not null
);

create table subject (
subID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
subName VARCHAR(30) not null,
credit tinyint not null DEFAULT 1 check (credit >=1),
status bit DEFAULT 1
);

create table mark (
markID int not null AUTO_INCREMENT PRIMARY key,
subID int NOT NULL unique,
studentID int not null unique,
mark float DEFAULT 0 check( mark >= 0 and mark <= 100),
examTimes TINYINT DEFAULT 1
);

ALTER table student
add CONSTRAINT FK_classID FOREIGN KEY (classID) REFERENCES class (classID);

alter table mark
add constraint FK_subID FOREIGN KEY (subID) REFERENCES subject (subID),
add CONSTRAINT FK_studentID FOREIGN KEY (studentID) REFERENCES student (studentID);