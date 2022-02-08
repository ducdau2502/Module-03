create database QuanLyBanHang;

use quanlybanhang;

create table customer (
cID int primary key,
name varchar(50),
cAge tinyint
);

create table order1 (
oID int primary key,
cID int,
oDate datetime,
oTotalPrice int default null,
CONSTRAINT FK_cID FOREIGN KEY (cID) references customer(cID)
);

create table Product (
pID int primary key,
pName varchar(25),
pPrice int
);

create table OrderDetail (
id int auto_increment primary key,
oID int,
pID int,
odQTY int,
CONSTRAINT FK_oID FOREIGN KEY (oID) references order1(oID),
CONSTRAINT FK_pID FOREIGN KEY (pID) references Product(pID)
);

insert into customer
values (1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

insert into order1 (oID, cID, oDate)
values (1, 1, '2006/3/21'),
(2, 2, '2006/3/23'),
(3, 1, '2006/3/16');

insert into product
values (1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

insert into orderdetail (oID, pID, odQTY)
values (1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

-- ---------------------------------------------------------- --

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o.oID, o.oDate, (od.odQTY * p.pPrice) as oToTalPrice from order1 o
join orderdetail od on o.oID = od.oID
join product p on od.pID = p.pID;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select * from customer c
join order1 o on c.cID = o.cID
join orderdetail od on od.oID = o.oID
join product p on p.pID = od.pID;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select * from customer c
left join order1 o on c.cID = o.cID
where o.cID is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng
-- tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select o.oID, o.oDate, sum(od.odQTY * p.pPrice) as oToTalPrice from order1 o
join orderdetail od on o.oID = od.oID
join product p on od.pID = p.pID
group by o.oID;
