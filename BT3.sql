create database VanTai;
create table LoTrinh(
	malotrinh nvarchar(50) not null primary key,
    tenlotrinh nvarchar(50) not null,
    dongia double,
    thoigianqd int
);
create table TrongTai(
	matrongtai  nvarchar(50) not null primary key,
    trongtaiqd int not null
);
create table ChiTietVanTai(
	mavt int not null,
    soxe nvarchar(50),
    matrongtai nvarchar(50),
    malotrinh nvarchar(50),
    soluongvt int,
    ngaydi date,
    ngayden date,
    foreign key (malotrinh) references LoTrinh (malotrinh),
    foreign key (matrongtai) references TrongTai(matrongtai)
);

-- c2
create view cau2 as
select chitietvantai.soxe, chitietvantai.malotrinh, chitietvantai.soluongvt, chitietvantai.ngayden, chitietvantai.ngaydi , 
(case when  datediff(chitietvantai.ngayden, chitietvantai.ngaydi) = 0 then 1  else datediff(vt.ngayden, vt.ngaydi) end) as thoigian, 
(chitietvantai.soluongvt*chitietvantai.dongia*(105/100)) as cuocphi, (cuocphi*(5/100)) as tienthuong
from LoTrinh join chitietvantai on LoTrinh.malotrinh = chitietvantai.malotrinh;