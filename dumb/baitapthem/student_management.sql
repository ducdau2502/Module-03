create database student_management;
create table students (
id int auto_increment primary key,
name varchar(50) not null,
address varchar(50) not null,
sex int not null default 1 check(sex = 1 or sex = 0),
age int not null check(18 <= age and age <= 25),
email varchar(50) not null unique,
phone varchar(10) not null
);

create table classes (
id int auto_increment primary key,
name varchar(50) not null unique
);

alter table students 
add classid int,
add foreign key (classid) references classes(id);

insert into classes (name) value ("C09");
insert into classes (name) value ("C10");
insert into classes (name) value ("C11");
insert into classes (name) value ("C12");

insert into students (name, address, sex, age, email, phone, classid) value ("Hào", "Hà Nội", 0, 22, "hao@gmail.com", "0987654321", 1);

insert into students (name, address, sex, age, email, phone, classid) value
("Đức", "Đà Nẵng", 1, 18, "duc@gmail.com", "0987654321", 2),
("Tú", "Hồ Chí Minh", 1, 19, "tu@gmail.com", "0987654321", 1),
("Long", "Hà Nội", 1, 20, "long@gmail.com", "0987654321", 2),
("Dương", "Hà Nội", 1, 21, "duong@gmail.com", "0987654321", 3),
("Tiến", "Hồ Chí Minh", 1, 23, "tien@gmail.com", "0987654321", 2),
("Quang", "Hồ Chí Minh", 1, 18, "quang@gmail.com", "0987654321", 3),
("Trí", "Hồ Chí Minh", 1, 19, "tri@gmail.com", "0987654321", 4),
("Quan",  "Đà Nẵng", 1, 24, "quan@gmail.com", "0987654321", 1),
("Huyen",  "Đà Nẵng", 0, 25, "huyen@gmail.com", "0987654321", 2),
("Hà", "Hà Nội", 0, 20, "ha@gmail.com", "0987654321", 3);

-- insert into students (name, address, sex, age, email, phone, classid) value ("abc", "Hà Nội", 0, 15, "abc@gmail.com", "0987654321", 3);

update students set sex = 0
where id = 5;

select *from students;

select *from students
where sex = 1;

select *from students
where age <= 20;

select *from students
where address = "Hà Nội" or address = "Đà Nẵng" ;

select *from students
where not address = "Hà Nội";

select id, name, age from students
where name like "h%";

select *from students
where name = "Long";

select *from students
join classes
on students.classid = classes.id
where classes.name = "C10";












