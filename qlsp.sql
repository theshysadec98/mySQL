create database qlsp;

create table custumer(
	hoten nvarchar(50) not null,
    id int not null primary key,
    diachi nvarchar(100) not null
);

create table sanpham(
	tensp nvarchar(50) not null,
    id int not null primary key primary key,
    gia double not null,
    xuatxu nvarchar(50) not null
);

create table hoadon(
	id int not null primary key,
    ngay date not null,
    tonggia double not null,
	id_kh int not null,
    foreign key (id_kh) references custumer(id)
    
);

create table hoadonct(
	id_sp int not null,
    id_hd int not null,
	soluong_hoadon int not null, 
    foreign key (id_sp) references sanpham(id),
    foreign key (id_hd) references hoadon(id)
);


-- c6
use qlsp;
select soluong_hoadon, tonggia
from hoadon 
inner join hoadonct on  hoadon.id = hoadonct.id_hd
where ngay between '2006-06-19' and '2006-06-21';


-- c7 
use qlsp;
select soluong_hoadon, tonggia, ngay
from hoadon 
inner join hoadonct on  hoadon.id = hoadonct.id_hd
where ngay between '2006-06-01' and '2006-07-01'
order by tonggia desc, ngay asc;


-- c8
use qlsp;
select custumer.id, custumer.hoten
from custumer
inner join hoadon on custumer.id = hoadon.id_kh
where ngay = '2007-06-19';


-- c10
use qlsp;
select sanpham.id, sanpham.tensp
from sanpham
inner join hoadonct on sanpham.id = hoadonct.id_sp
inner join hoadon on hoadonct.id_hd = hoadon.id
inner join custumer on hoadon.id_kh = custumer.id
where (custumer.hoten like '%Nguyen Van A%') and (ngay between '2006-10-01' and '2006-11-01');


-- c11
use qlsp;
select hoadon.ngay, hoadon.id
from hoadon
inner join hoadonct on hoadon.id = hoadonct.id_hd
inner join sanpham on hoadonct.id_sp = sanpham.id
where tensp like '%Máy giặt%' or '%Tủ lạnh%';


-- c12 Tìm các số hóa đơn đã mua sản phẩm “Máy giặt” hoặc “Tủ lạnh”, mỗi sản phẩm muavới số lượng từ 10 đến 20
use qlsp;
select hoadon.id
from hoadon
inner join hoadonct on hoadon.id = hoadonct.id_hd
inner join sanpham on hoadonct.id_sp = sanpham.id
where tensp like '%Máy giặt%' or '%Tủ lạnh%'
having soluong_hoadon between 10 and 20;


-- c13 Tìm các số hóa đơn mua cùng lúc 2 sản phẩm “Máy giặt” và “Tủ lạnh”, mỗi sản phẩmmua với số lượng từ 10 đến 20
use qlsp;
select distinct (select hoadon.id
from hoadon
inner join hoadonct on hoadon.id = hoadonct.id_hd
inner join sanpham on hoadonct.id_sp = sanpham.id
where tensp like '%Máy giặt%'
having soluong_hoadon between 10 and 20) as hd_maygiat,
(select hoadon.id
from hoadon
inner join hoadonct on hoadon.id = hoadonct.id_hd
inner join sanpham on hoadonct.id_sp = sanpham.id
where tensp like '%Tủ lạnh%'
having soluong_hoadon between 10 and 20) as hd_tulanh
from hoadon
inner join hoadonct on hoadon.id = hoadonct.id_hd
inner join sanpham on hoadonct.id_sp = sanpham.id;


-- c15  In ra danh sách các sản phẩm (MASP,TENSP) không bán được
use qlsp;
select sanpham.id, sanpham.tensp
from sanpham
inner join hoadonct on sanpham.id = hoadonct.id_sp
inner join hoadon on hoadonct.id_hd = hoadon.id
inner join custumer on hoadon.id_kh = custumer.id
where soluong_hoadon = 0;


-- c16 In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006
use qlsp;
select sanpham.id, sanpham.tensp
from sanpham
inner join hoadonct on sanpham.id = hoadonct.id_sp
inner join hoadon on hoadonct.id_hd = hoadon.id
inner join custumer on hoadon.id_kh = custumer.id
where soluong_hoadon = 0 and hoadon.ngay between '2006-01-01' and '2007-01-01';

