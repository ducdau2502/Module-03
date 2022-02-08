create database BT_SQL_Co_ban;

use BT_SQL_Co_ban;

CREATE TABLE KHACHHANG (
maKhachHang int AUTO_INCREMENT PRIMARY KEY,
tenCongTy varchar(50),
tenGiaoDich varchar(20),
diaChi VARCHAR(50),
email VARCHAR(30),
dienThoai VARCHAR(10),
fax VARCHAR(10)
);

CREATE TABLE NHANVIEN (
maNhanVien int AUTO_INCREMENT PRIMARY KEY,
ho VARCHAR(20),
ten VARCHAR(20),
ngaySinh DATE,
ngayLamViec DATE,
diaChi VARCHAR(50),
dienThoai VARCHAR(10),
luongCoBan DOUBLE,
phuCap DOUBLE
);

CREATE TABLE NHACUNGCAP (
maCongTy int AUTO_INCREMENT PRIMARY KEY,
tenCongTy varchar(50),
tenGiaoDich varchar(20),
diaChi VARCHAR(50),
email VARCHAR(30),
dienThoai VARCHAR(10),
fax VARCHAR(10)
);

CREATE TABLE LOAIHANG (
maLoaiHang int AUTO_INCREMENT PRIMARY KEY,
tenLoaiHang varchar(50)
);

CREATE TABLE MATHANG (
maHang int AUTO_INCREMENT PRIMARY KEY,
tenHang VARCHAR(50),
maCongTy int,
maLoaiHang int,
soLuong int,
donViTinh VARCHAR(50),
giaHang DOUBLE,
CONSTRAINT FK_maCongTy FOREIGN KEY (maCongTy) REFERENCES NHACUNGCAP(maCongTy),
CONSTRAINT FK_maLoaiHang FOREIGN KEY (maLoaiHang) REFERENCES LOAIHANG(maLoaiHang)
);

CREATE TABLE DONDATHANG (
soHoaDon int AUTO_INCREMENT PRIMARY KEY,
maKhachHang int,
maNhanVien int,
ngayDatHang DATE,
ngayGiaoHang date,
ngayChuyenHang DATE,
noiGiaoHang VARCHAR(50),
CONSTRAINT FK_maKhachHang FOREIGN KEY (maKhachHang) REFERENCES KHACHHANG(maKhachHang),
CONSTRAINT FK_maNhanVien FOREIGN KEY (maNhanVien) REFERENCES NHANVIEN(maNhanVien)
);

create table CHITIETDONHANG (
soHoaDon int,
maHang int,
giaBan DOUBLE,
soLuong int,
mucGiamGia DOUBLE,
PRIMARY KEY (soHoaDon, maHang),
CONSTRAINT FK_soHoaDon FOREIGN KEY (soHoaDon) REFERENCES DONDATHANG(soHoaDon),
CONSTRAINT FK_maHang FOREIGN KEY (maHang) REFERENCES MATHANG(maHang)
);


INSERT INTO KHACHHANG (tenCongTy, tenGiaoDich, diaChi, email, dienThoai, fax) VALUES
('ABC', 'abc', 'HN', 'abc@gmail.com', 0987654321, 0987654321);

INSERT INTO KHACHHANG (tenCongTy, tenGiaoDich, diaChi, email, dienThoai, fax) VALUES
('DEF', 'def', 'ĐN', 'def@gmail.com', 0912345678, 0912345678),
('GHI', 'ghi', 'HN', 'ghi@gmail.com', 0981726354, 0981726354),
('JKL', 'jkl', 'HCM', 'jkl@gmail.com', 0945362718, 0945362718);

INSERT INTO NHANVIEN (ho, ten, ngaySinh, ngayLamViec, diaChi, dienThoai, luongCoBan, phuCap) VALUE
('Trần', 'Hào', '1994-05-14', '2022-01-14', 'NA', 0988888888, 1000000, 500000),
('Hoang', 'Dương', '1999-05-14', '2022-01-13', 'ĐP', 0977777777, 1500000, 100000),
('Nguyễn', 'Quang', '2003-05-14', '2022-01-16', 'PT', 0966666666, 1200000, 200000),
('Minh', 'Tiến', '2000-05-14', '2022-01-15', 'HN', 0555555555, 2000000, 0);

INSERT INTO NHACUNGCAP (tenCongTy, tenGiaoDich, diaChi, email, dienThoai, fax) VALUE
('MNO', 'mno', 'HT', 'mno@gmail.com', 0944444444, 0944444444),
('QRS', 'qrs', 'QN', 'qrs@gmail.com', 0933333333, 0933333333),
('TUV', 'tuv', 'HP', 'tuv@gmail.com', 0922222222, 0922222222),
('WXY', 'wxy', 'ĐB', 'wxy@gmail.com', 0911111111, 0911111111);

INSERT INTO LOAIHANG (tenLoaiHang) VALUE
('Quần áo'),
('Giầy dép'),
('Sách vở'),
('Bút thước');

INSERT INTO LOAIHANG (tenLoaiHang) VALUE ('Mũ');

INSERT INTO MATHANG (tenHang, maCongTy, maLoaiHang, soLuong, donViTinh, giaHang) VALUE
('áo len', 1, 1, 20, 'Chiếc', 10000),
('áo khoác', 2, 1, 30, 'Chiếc', 25000),
('áo phông', 2, 1, 40, 'Chiếc', 20000),
('áo sơ-mi', 3, 1, 25, 'Chiếc', 15000),
('giầy', 2, 2, 10, 'Chiếc', 50000),
('dép', 2, 2, 50, 'Chiếc', 45000),
('sách', 3, 3, 60, 'Chiếc', 15000),
('thước', 3, 4, 70, 'Chiếc', 5000);

INSERT INTO DONDATHANG (maKhachHang, maNhanVien, ngayDatHang, ngayGiaoHang, ngayChuyenHang, noiGiaoHang) VALUE
(1, 3, '2021-05-15', '2021-05-20', '2021-05-16', 'HN'),
(2, 1, '2021-06-06', '2021-06-15', '2021-06-07', 'ĐN'),
(3, 2, '2022-01-20', '2022-01-29', '2022-01-21', 'HCM'),
(1, 1, '2021-10-21', '2021-11-21', '2021-10-22', 'HN');

INSERT INTO CHITIETDONHANG (soHoaDon, maHang, soLuong, mucGiamGia) VALUE
(1, 2, 10, 0),
(2, 4, 20, 0),
(3, 1, 30, 0),
(4, 7, 15, 0);

-- ------------------------------------------------------------------- --
-- 1. Họ tên, địa chỉ và năm bắt đầu làm việc của các nhân viên trong cty
select nv.Ho, nv.Ten, nv.DiaChi, year(nv.NgayLamViec) as NamBatDau from nhanvien nv;

-- 2. Mã và tên của các mặt hàng có giá trị lớn hơn 100000 và số lượng hiện có ít hơn 50
select M.MaHang, M.TenHang from mathang M
where M.GiaHang * M.soLuong > 100000 and M.SoLuong < 50;

-- 3. Cho biết mỗi mặt hàng trong công ty do ai cung cấp
select * from mathang m
join nhacungcap n on m.MaCongTy = n.MaCongTy;

-- 4. Hãy cho biết số tiền lương mà công ty phải trả cho mỗi nhân viên là bao nhiêu (Lương = Lương CB + Phụ cấp)
select MaNhanVien, Ho, Ten, NgaySinh, (LuongCoBan + PhuCap) as Luong from nhanvien;

-- 5. Tăng lương lên gấp rưỡi cho những nhân viên bán được số lượng hàng nhiều hơn 30 trong năm 2021.
CREATE VIEW soluong as
select nv.maNhanVien, nv.ho, nv.ten, sum(c.soLuong) as tongSoLuong from DONDATHANG d
join NHANVIEN nv on nv.MaNhanVien = d.MaNhanVien
join CHITIETDONHANG c on d.SoHoaDon = c.SoHoaDon
WHERE YEAR(d.ngayDatHang) = 2021
GROUP BY nv.maNhanVien;

update nhanvien set luongCoBan = luongCoBan * 1.5 
WHERE maNhanVien = (select maNhanVien FROM soluong WHERE tongSoLuong > 30);

select * from  soluong;

-- 6. Trong năm 2021 những mặt hàng nào đặt mua đúng một lần
select m.TenHang, count(*) as soLan from mathang m
join chitietdonhang c on c.MaHang = m.MaHang
join dondathang d on d.SoHoaDon = c.SoHoaDon
where year(d.NgayDatHang) = 2021
group by m.TenHang
having count(*) = 1;

-- 7. Xoá khỏi bảng KHACHHANG những khách hàng hiện không có bất kỳ đơn đặt hàng nào cho công ty
select kh.maKhachHang from khachhang kh
left join dondathang d on d.MaKhachHang = kh.MaKhachHang
where d.MaKhachHang is null;

delete from khachhang kh where not exists
(select * from dondathang d where kh.MaKhachHang = d.MaKhachHang);

-- 8. Nhân viên nào của công ty bán được số lượng hàng nhiều nhất và
-- số lượng hàng bán được của những nhân viên này là bao nhiêu
SELECT * FROM soluong
WHERE maNhanVien = (select maNhanVien FROM soluong WHERE tongSoLuong = (select max(tongSoLuong) FROM soluong));

-- 9. Tăng phụ cấp lên bằng 50% lương cho những nhân viên bán được hàng nhiều nhất
UPDATE nhanvien set phuCap = phuCap * 1.5 
WHERE maNhanVien = (select maNhanVien FROM soluong WHERE tongSoLuong = (select max(tongSoLuong) FROM soluong ));


select * from NHANVIEN;
-- 10. Thống kê trong năm 2006 mỗi một mặt hàng trong mỗi tháng và trong cả năm bán được với số lượng bao nhiêu 
-- Yêu cầu kết quả hiển thị dưới dạng bảng, hai cột đầu là mã hàng, tên hàng, các cột còn lại tương ứng từ tháng 1 đến tháng 12 và cả năm.
-- Như vậy mỗi dòng trong kết quả cho biết số lượng hàng bán được mỗi tháng và trong cả năm của mỗi mặt hàng

