CREATE DATABASE minitest01;

USE minitest01;

CREATE TABLE thanhpho (
idthanhpho int AUTO_INCREMENT PRIMARY KEY,
tenthanhpho VARCHAR(50) not NULL
);

CREATE TABLE diemden (
iddiemden INT AUTO_INCREMENT PRIMARY KEY,
tendiemden VARCHAR(50) NOT NULL,
mota varchar(255) not NULL,
giatrungbinh DOUBLE not NULL,
idthanhpho INT not NULL,
FOREIGN KEY (idthanhpho) REFERENCES thanhpho(idthanhpho)
);

CREATE TABLE khachhang (
idkhachhang INT AUTO_INCREMENT PRIMARY KEY,
tenkhachhang VARCHAR(50) not NULL,
socancuc VARCHAR(50) NOT NULL,
namsinh date not null,
idthanhpho INT not NULL,
FOREIGN KEY (idthanhpho) REFERENCES thanhpho(idthanhpho)
);

create table loaitour (
idloaitour int AUTO_INCREMENT PRIMARY key,
maloaitour int NOT null,
tenloaitour varchar(50)
);

create table tour (
idtour int AUTO_INCREMENT PRIMARY key,
matour int NOT null,
idloaitour int NOT null,
giadiemden DOUBLE not null,
ngaybatdau date not null,
ngayketthuc date not null,
FOREIGN KEY (idloaitour) REFERENCES loaitour(idloaitour)
);

create table hoadon (
idhoadon INT AUTO_INCREMENT PRIMARY key,
idtour int not null,
idkhachhang INT not null,
trangthai int default 1 check (trangthai = 1 or trangthai = 0),
FOREIGN KEY (idtour) REFERENCES tour(idtour),
FOREIGN KEY (idkhachhang) REFERENCES khachhang(idkhachhang)
);

ALTER TABLE tour
add iddiemden int,
add FOREIGN KEY (iddiemden) REFERENCES diemden(iddiemden);

-- thêm dữ liệu

INSERT INTO thanhpho (tenthanhpho) VALUE
('Hà Nội'),
('Hải Phòng'),
('Quảng Ninh'),
('Đà Năng'),
('Nha Trang');

INSERT INTO loaitour (maloaitour, tenloaitour) VALUE
(1, 'tour 2 ngày 3 đêm'),
(2, 'tour 1 ngày 2 đêm');

INSERT INTO diemden (tendiemden, mota, giatrungbinh, idthanhpho) VALUE
('bảo tàng','đẹp', 50000, 1),
('bãi biển','đẹp', 75000, 2),
('quảng trường','đẹp', 25000, 3),
('công viên','đẹp', 100000, 1),
('nhà hát','đẹp', 60000, 4);

INSERT INTO khachhang (tenkhachhang, socancuc, namsinh, idthanhpho) VALUE
('Hào', 111111111111, '1994-06-24', 1);

INSERT INTO khachhang (tenkhachhang, socancuc, namsinh, idthanhpho) VALUE
('Đức', 2222222222222, '1994-02-12', 2),
('Tiến', 3333333333333, '1993-01-17', 3),
('Quang', 444444444444, '1999-07-11', 4),
('Dương', 555555555555, '2003-04-07', 5),
('Hiếu', 666666666666, '1992-03-08', 2),
('Trí', 7777777777777, '1997-06-27', 3),
('Long', 8888888888888, '1995-02-18', 1),
('Huyền', 9999999999999, '1998-10-22', 4),
('Tú', 1000000000000, '1990-11-01', 4);

INSERT INTO tour (matour, idloaitour, giadiemden, ngaybatdau, ngayketthuc) VALUES
(1, 1, 3000000, '2021-11-02', '2021-11-04'),
(2, 2, 1500000, '2021-12-12', '2021-12-13'),
(3, 2, 1100000, '2021-01-14', '2021-01-15'),
(4, 1, 3300000, '2021-03-22', '2021-03-24'),
(5, 2, 1400000, '2021-04-02', '2021-04-04'),
(6, 1, 1500000, '2021-04-13', '2021-11-14'),
(7, 1, 2000000, '2021-06-21', '2021-06-22'),
(8, 2, 1700000, '2021-07-15', '2021-11-16'),
(9, 1, 2100000, '2021-02-11', '2021-02-13'),
(10, 1, 3800000, '2021-09-25', '2021-09-27'),
(11, 2, 2400000, '2021-01-22', '2021-01-23'),
(12, 1, 3000000, '2021-05-02', '2021-05-04'),
(13, 2, 1100000, '2021-03-11', '2021-03-12'),
(14, 2, 2500000, '2021-10-17', '2021-10-18'),
(15, 1, 2100000, '2021-03-17', '2021-03-19');

INSERT INTO hoadon (idtour, idkhachhang, trangthai) VALUES
(1, 6, 1),
(3, 2, 1),
(4, 5, 1),
(11, 7, 1),
(10, 8, 1),
(14, 1, 1),
(12, 10, 1),
(6, 4, 1),
(9, 6, 1),
(7, 1, 1);

-- Thống kê số lượng tour và thu nhập của các thành phố
SELECT thanhpho.tenthanhpho, count(tour.iddiemden) as sotour, sum(tour.giadiemden) as thunhap FROM tour
JOIN diemden on tour.iddiemden = diemden.iddiemden
JOIN thanhpho on thanhpho.idthanhpho = diemden.idthanhpho
JOIN hoadon ON hoadon.idtour = tour.idtour
GROUP BY thanhpho.tenthanhpho;

-- Tính số tour có ngày bắt đầu trong tháng 3 năm 2020
SELECT COUNT(month(ngaybatdau)) as soluong FROM tour
WHERE month(ngaybatdau) = 3 AND year(ngaybatdau) = 2021;

-- Tính số tour có ngày kết thúc trong tháng 4 năm 2020
SELECT COUNT(month(ngayketthuc)) as soluong FROM tour
WHERE month(ngayketthuc) = 4 AND year(ngaybatdau) = 2021;

-- Tổng thu nhập của các loại tour
SELECT tour.idloaitour, loaitour.tenloaitour, sum(giadiemden) as tongthunhap FROM tour
JOIN loaitour on  tour.idloaitour = loaitour.idloaitour
JOIN hoadon ON hoadon.idtour = tour.idtour
GROUP BY tour.idloaitour;
-- Khách hàng tham gia nhiều tour nhất
CREATE view solan as
SELECT khachhang.tenkhachhang, COUNT(hoadon.idkhachhang) as solandi FROM hoadon
JOIN khachhang on khachhang.idkhachhang = hoadon.idkhachhang
GROUP BY khachhang.tenkhachhang;

SELECT * FROM solan
WHERE solandi = (SELECT max(solandi) FROM solan);
-- Xóa khách hàng chưa tham gia tour nào
select * from khachhang kh
left join hoadon hd on hd.idkhachhang = kh.idkhachhang
where hd.idkhachhang is null;

delete from khachhang where not exists
(select * from hoadon where khachhang.idkhachhang = hoadon.idkhachhang);