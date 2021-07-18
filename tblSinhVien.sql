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
    sv_IDLop int not null,
    sv_IDKhoa int not null,
    foreign key (sv_IDLop) references qlsv.tblLop (l_ID),
    foreign key (sv_IDKhoa) references qlsv.tblKhoa(k_ID)
);
insert into qlsv.tblkhoa value (1, "CNTT");
insert into qlsv.tbllop value (16, "muoi mot", 1);
insert into qlsv.tblsinhvien value (1,"Phan ", "Trung", '1994/11/11', 12, 88.5, 16, 1);

-- c1 ---
select sv_Maso, sv_Hodem, sv_Ten, sv_Ngaysinh, sv_Lop, sv_IDKhoa, l_Ten, k_Ten
from qlsv.tblSinhVien 
inner join qlsv.tblLop on tblSinhVien.sv_IDLop = tbllop.l_ID 
inner join qlsv.tblKhoa on tblSinhVien.sv_IDLop = tblKhoa.k_ID;
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
use qlsv;
select tblSinhVien.sv_Maso, tblSinhVien.sv_Hodem, tblSinhVien.sv_Ten, tblSinhVien.sv_Ngaysinh, tblSinhVien.sv_Lop, tblSinhVien.sv_IDKhoa, tbllop.l_Ten, tblKhoa.k_Ten
from qlsv.tblSinhVien 
inner join qlsv.tblLop on tblSinhVien.sv_IDLop = tbllop.l_ID 
inner join qlsv.tblKhoa on tblSinhVien.sv_IDLop = tblKhoa.k_ID
where l_Khoa  like "%CNTT%";

