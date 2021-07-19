create database qlsv;
create table qlsv.tblKhoa(
	k_ID int not null primary key,
    k_Ten nvarchar(20) not null
);

create table qlsv.tblLop(
	l_ID int not null primary key,
    l_Ten nvarchar(20),
    l_Khoa int not null,
    foreign key (l_Khoa) references qlsv.tblKhoa (k_ID)
);

create table  qlsv.tblSinhVien(
	sv_Maso int not null primary key,
    sv_Hodem nvarchar(30) not null,
    sv_Ten nvarchar(15) not null,
    sv_Ngaysinh date,
    sv_Lop int not null,
    sv_DiemTB double(4,1),
    foreign key (sv_Lop) references qlsv.tblLop (l_ID)
);

-- c1 ---
select *from qlsv.tblSinhVien ;
-- c2 ----
select concat(sv_Hodem, " ", sv_Ten ) as Ho_Ten
from qlsv.tblSinhVien;
-- c3 --
select sv_Maso, sv_Hodem, sv_Ten, year(curdate()) - year(sv_Ngaysinh)  as Tuoi
from qlsv.tblSinhVien;
-- c4 --
select * from qlsv.tblLop;
-- c5 -- 
select * from qlsv.tblKhoa;
-- c6 --
select tblSinhVien.sv_Maso, tblSinhVien.sv_Hodem, tblSinhVien.sv_Ten, tblSinhVien.sv_Ngaysinh, tblSinhVien.sv_Lop, tblSinhVien.sv_IDKhoa, tbllop.l_Ten, tblKhoa.k_Ten
from qlsv.tblSinhVien 
inner join qlsv.tblLop on tblSinhVien.sv_IDLop = tbllop.l_ID 
inner join qlsv.tblKhoa on tbllop.l_Khoa = tblKhoa.k_ID
where l_Khoa  = "CNTT";
-- c7 --
select distinct (select count( tblSinhVien.sv_DiemTB)
		from qlsv.tblSinhVien
        where (sv_DiemTB >= 8.0 and sv_DiemTB < 10.0)) as gioi ,
		(select count(tblSinhVien.sv_DiemTB)
		from qlsv.tblSinhVien
        where (sv_DiemTB < 8 and sv_DiemTB >=6.5)) as kha ,
        (select count(tblSinhVien.sv_DiemTB)
		from qlsv.tblSinhVien
        where (sv_DiemTB < 6.5 and sv_DiemTB >=5.0)) as trungbinh
from qlsv.tblSinhVien;

-- c8 --


-- 7 Số lượng sinh viên loại giỏi, loại khá, loại trung bình (trong cùng 1 query)
-- 8 Số lượng sinh viên loại giỏi, khá, trung bình của từng lớp (trong cùng 1 query)
-- 9 Tên lớp, danh sách các sinh viên của lớp sắp xếp theo điểm trung bình giảm dần
-- 10 Tên lớp, tổng số sinh viên của lớp
-- 11 Tên khoa, tổng số sinh viên của khoa
-- 12 Tên khoa, tên lớp, điểm trung bình của sinh viên (chú ý: liệt kê tất cả các khoa và lớp, kể cả khoa và lớp chưa có sinh viên)
-- 13 Tên khoa, tên lớp, họ tên, ngày sinh, điểm trung bình của sinh viên có điểm trung bình cao nhất lớp 
-- 14 Tên khoa, Họ tên, ngày sinh, điểm trung bình của sinh viên có điểm trung bình cao nhất khoa

