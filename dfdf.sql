create database quanlytiendien;
create table KhachHang(
	maKH varchar(20) not null  primary key,
    tenKH nvarchar(50) not null,
    ngaySinh date ,
    diaChi nvarchar(255) not null,
    dienThoai varchar(10) not null,
    ghiChu nvarchar(255)
);

create table DongGia(
	MaLoai varchar(20) not null primary key,
    LoaiHo varchar(50),
    gia double
);

create table ChiSo(
	makh varchar(20) not null,
    chiSoDau double not null,
    chiSoCuoi double not null,
    maLoai varchar(20) not null,
    foreign key (makh) references KhachHang(MaKH),
    foreign key (maloai) references DongGia(MaLoai)
);
-- use quanlytiendien;
-- drop table ChiSo, DongGia, KhachHang;
insert into quanlytiendien.KhachHang value ( "1", "Trung", '1980-01-11', "Phuong 11", "0978444444", "Khong co");
insert into quanlytiendien.KhachHang value ( "2", "Tan", '1989-09-11', "Phuong 12", "0978444442", "Khong co");
insert into quanlytiendien.KhachHang value ( "3", "Phan", '1980-10-11', "Phuong 12", "0978444443", "Khong co");

insert into quanlytiendien.DongGia value ("15", "Gia Dinh", 15000);
insert into quanlytiendien.DongGia value ("16", "Gia Dinh", 15000);
insert into quanlytiendien.DongGia value ("17", "Gia Dinh", 15000);
insert into quanlytiendien.ChiSo value ("1", 15, 30, "15");
insert into quanlytiendien.ChiSo value ("2", 14, 31, "16");
insert into quanlytiendien.ChiSo value ("3", 13, 32, "17");
-- c1--
SELECT * FROM quanlytiendien.khachhang
where year(ngaySinh) = '1980';

-- c2 --
select tenKH, chiSoCuoi-chiSoDau as diffirences 
from quanlytiendien.KhachHang, quanlytiendien.ChiSo ;

-- c3 --
select * , chiSoCuoi-chiSoDau as diffirences from quanlytiendien.KhachHang, quanlytiendien.ChiSo, quanlytiendien.DongGia
where KhachHang.maKH = chiso.maKH ;

-- c4 --
select tenKH ,chiSoCuoi-chiSoDau as diffirences from quanlytiendien.KhachHang, quanlytiendien.ChiSo
where chiSoCuoi-chiSoDau > 0;

-- c5 --
select tenKH, LoaiHo, chiSoCuoi-chiSoDau as chi_so_tieu_thu, (chiSoCuoi-chiSoDau)*gia as so_tien_phai_tra
from quanlytiendien.KhachHang, quanlytiendien.ChiSo, quanlytiendien.DongGia
where chiSoCuoi-chiSoDau > 0;

-- c6 -- 

update quanlytiendien.DongGia set LoaiHo = "Gia Dinh"
where maLoai != "";

-- c7 --
select tenKH, chiSoCuoi-chiSoDau as chi_so_tieu_thu 
from quanlytiendien.KhachHang, quanlytiendien.ChiSo, quanlytiendien.DongGia
where chiSoCuoi-chiSoDau = 0;