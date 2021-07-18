create database tblsinhvien;

create table  tblSinhVien(
	sv_Maso int not null primary key,
    sv_Hodem nvarchar(30) not null,
    sv_Ten nvarchar(15) not null,
    sv_Ngaysinh date,
    sv_Lop int not null,
    sv_DiemTB double(4,1),
    sv_IDLop int not null,
    sv_IDKhoa int not null,
    foreign key (sv_IDLop) references tblLop (l_ID),
    foreign key (sv_IDKhoa) references tblKhoa(k_ID)
);

create table tblLop(
	l_ID int not null primary key,
    l_Ten nvarchar(20),
    l_Khoa int,
    l_IDKhoa int not null,
    foreign key (l_IDKhoa) references tblKhoa (k_ID)
);
create table tblKhoa(
	k_ID int not null primary key,
    k_Ten nvarchar(20) not null
);

-- c1 ---
select sv_Maso, sv_Hodem, sv_Ten, sv_Ngaysinh, sv_Lop sv_IDKhoa, l_Ten, k_Ten
from tblsinhvien.tblSinhVien full join tblsinhvien.tblLop, tblsinhvien.tblKhoa;
-- c2 ----
select sv_Hodem + sv_Ten as Ho_Ten
from tblsinhvien.tblSinhVien;
-- c3 --
select sv_Maso, sv_Hodem, sv_Ten, year(DATEDIFF(CURDATE(), sv_Ngaysinh) / 365, 0) as Tuoi
from tblsinhvien.tblSinhVien;

-- c4 --
select * from tblsinhvien.tblLop;
-- c5 -- 
select * from tblsinhvien.tblKhoa;
-- c6 --
select sv_Maso, sv_Hodem, sv_Ten, sv_Ngaysinh, sv_Lop sv_IDKhoa, l_Ten, k_Ten
from tblsinhvien.tblSinhVien full join tblsinhvien.tblLop, tblsinhvien.tblKhoa
where l_Khoa = "CNTT";

