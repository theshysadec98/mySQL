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

