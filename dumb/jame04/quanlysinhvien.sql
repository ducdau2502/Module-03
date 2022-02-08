CREATE DATABASE QuanLySinhVien;

USE QuanLySinhVien;

CREATE table class (
classId int PRIMARY KEY,
className varchar(30),
startDate DATE,
status int CHECK (status = 1 or status = 0)
);

create table student (
studentId int auto_increment primary key,
studentName varchar(50) not null,
address varchar(50) not null,
phone varchar(10),
status int not null default 1 check(status = 1 or status = 0),
classId int,
CONSTRAINT FK_classId FOREIGN KEY (classId) references class(classId)
);

create table subject (
subId int primary key,
subName varchar(50) not null,
credit int,
status int CHECK (status = 1 or status = 0)
);

create table mark (
markId int auto_increment primary key,
subId int,
studentId int,
mark DOUBLE check (Mark > 0 or Mark < 20),
examTimes int,
CONSTRAINT FK_subId FOREIGN KEY (subId) references subject(subId),
CONSTRAINT FK_studentId FOREIGN KEY (studentId) references student(studentId)
);

INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO Mark (SubId, StudentId, Mark, examTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
-- ---------------------------------------------------------- --

-- hiển thị tất cả học viên 
SELECT * FROM student;

-- Hiển thị danh sách các học viên đang theo học
SELECT * FROM student
WHERE status = 1;

-- Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ
SELECT * FROM subject 
WHERE Credit < 10;

-- Hiển thị danh sách học viên lớp A1
SELECT student.classId, student.studentName, class.className FROM student
join class on student.classId = class.classId
WHERE class.className = "A1";

-- Hiển thị điểm môn CF của các học viên
SELECT student.studentName, subject.subName, mark.mark FROM mark
join student on student.studentId = mark.studentId
join subject on subject.subId = mark.subId
WHERE subject.subName = "CF";

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
SELECT * FROM student
WHERE studentName like "h%";

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12
SELECT * FROM class
WHERE startDate like '%-12-%';

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
SELECT * FROM subject 
WHERE Credit >= 3 and Credit <= 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update student set classId = 2
WHERE studentName = "Hung";

-- Hiển thị các thông tin: StudentName, SubName, Mark. 
-- Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.

select student.studentName, subject.subName, mark.mark from student, subject, mark
WHERE student.studentId = mark.studentId AND subject.subId = mark.subId
ORDER BY mark.mark DESC, studentName ASC;
