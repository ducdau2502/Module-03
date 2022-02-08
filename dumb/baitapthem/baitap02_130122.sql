create table `baitap02_130122`.`students` (
id int auto_increment primary key,
name varchar(50) not null,
address varchar(50) not null,
sex int not null default 1 check(sex = 1 or sex = 0),
age int not null check(18 <= age and age <= 25),
email varchar(50) not null unique,
phone varchar(10) not null
);

create table `baitap02_130122`.`classes` (
id int auto_increment primary key,
name varchar(50) not null unique
);

use baitap02_130122;

alter table `baitap02_130122`.`students` 
add classid int,
add foreign key (classid) references `baitap02_130122`.`classes`(id);

insert into `baitap02_130122`.`classes` (name) value 
("C08"),
("C09"),
("C10"),
("C11"),
("C12");

insert into `baitap02_130122`.`students` (name, address, sex, age, email, phone, classid) value
("Đức", "HN", 1, 24, "duc@gmail.com", "0943475999", 5),
("Tú", "Hồ Chí Minh", 1, 19, "tu@gmail.com", "0987654321", 1),
("Long", "Hà Nội", 1, 20, "long@gmail.com", "0987654321", 2),
("Dương", "Hà Nội", 1, 21, "duong@gmail.com", "0987654321", 3),
("Tiến", "Hồ Chí Minh", 1, 23, "tien@gmail.com", "0987654321", 2),
("Quang", "Hồ Chí Minh", 1, 18, "quang@gmail.com", "0987654321", 3),
("Trí", "Hồ Chí Minh", 1, 19, "tri@gmail.com", "0987654321", 4),
("Quân",  "Đà Nẵng", 1, 24, "quan@gmail.com", "0987654321", 1),
("Huyền",  "Đà Nẵng", 0, 25, "huyen@gmail.com", "0987654321", 2),
("Hà", "Hà Nội", 0, 20, "ha@gmail.com", "0987654321", 3),
("Hào", "Hà Nội", 0, 22, "hao@gmail.com", "0987654321", 1);


-- 7. tên giảm dần
select *from `baitap02_130122`.`students`
order by name DESC;

-- 8. tuổi tăng dần 
select *from `baitap02_130122`.`students`
order by age ASC;

-- 9. tổng học sinh
SELECT classid, classes.name, COUNT(classid) as Tong from students
join classes
on students.classid = classes.id
GROUP BY classid;

select classid, count(classid) as Tong from `baitap02_130122`.`students`
group by classid;

-- 12. thông kế hv theo địa chỉ
SELECT address, COUNT(address) as Tong from students
GROUP BY address;

-- 13. Hiện thị lớp có hv > 2
SELECT classid, classes.name, count(classid) as Tong from students
join classes
on students.classid = classes.id
GROUP BY classid
having Tong > 2;

-- 14. Hiển thị thành phố có hv > 2
Select address, count(address) from students
GROUP BY address
having count(address) > 2;

-- 15. HV có tuổi lớn nhất
SELECT name, age from students
where age = (SELECT max(age) from students);

-- 19. HV tuổi lớn thứ 2
SELECT name, age from students
where age = (SELECT max(age) from students
WHERE age < (SELECT max(age) from students));






