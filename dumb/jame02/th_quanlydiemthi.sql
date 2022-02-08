create database QuanLyDiemThi;

USE QuanLyDiemThi;

create table hocsinh (
maHS varchar(20) primary key,
tenHS varchar(50),
ngaysinh DATETIME,
lop VARCHAR(20),
gt VARCHAR(20)
);

CREATE TABLE monhoc (
    maMH VARCHAR(20) PRIMARY KEY,
    tenMH VARCHAR(50)
);

create table bangdiem (
maHS varchar(20),
maMH varchar(20),
diemthi int,
ngaythi DATETIME,
PRIMARY KEY(maHS, maMH),
FOREIGN KEY (maHS) REFERENCES hocsinh (maHS),
FOREIGN KEY (maMH) REFERENCES monhoc (maMH)
);

CREATE TABLE giaovien (
    maGV VARCHAR(20) PRIMARY KEY,
    tenGV VARCHAR(20),
    sdt VARCHAR(10)
);

ALTER TABLE monhoc
ADD maGV VARCHAR(20),
add CONSTRAINT FK_MaGV FOREIGN KEY (maGV) REFERENCES giaovien (maGV);