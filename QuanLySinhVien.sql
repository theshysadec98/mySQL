create database quanlysinhvien;

create table student(
	student_id int(4) not null primary key,
    student_name nvarchar(50) not null,
    age  int(4) not null,
    email nvarchar(100)
);
create table subjects(
	subject_id int(4) not null primary key,
    subject_name nvarchar(50) not null
);
create table classes(
	class_id int(4) not null primary key,
    class_name nvarchar(50) not null
);
create table marks(
	mark int(4) not null,
    subject_id int(4) not null,
    student_id int(4) not null,
    foreign key (subject_id) references subjects(subject_id),
    foreign key (student_id) references student(student_id)
);
use quanlysinhvien;
create table classtudent(
	student_id int(4) not null,
    class_id int(4) not null,
    foreign key (student_id) references student(student_id),
	foreign key (class_id) references classes(class_id) 
);
-- c1  Hien thi danh sach tat ca cac hoc vien 
use quanlysinhvien;
select student_id, student_name 
from quanlysinhvien.student;

-- c2  Hien thi danh sach tat ca cac mon hoc
use quanlysinhvien;
select subject_name from subjects;

-- c3  Tinh diem trung binh 
use quanlysinhvien;
select avg(mark) as 'diem trung binh'
from marks;

-- c4  Hien thi mon hoc nao co hoc sinh thi duoc diem cao nhat
use quanlysinhvien;
select subject_name, max(mark)
from subjects join marks on subjects.subject_id = marks.subject_id;

-- c5  Danh so thu tu cua diem theo chieu giam
use quanlysinhvien;
select mark
from marks
order by mark desc;

-- c6  Thay doi kieu du lieu cua cot SubjectName trong bang Subjects thanh nvarchar(max)
use quanlysinhvien;
alter table subjects modify subject_name nvarchar(65532);
-- c7  Cap nhat them dong chu « Day la mon hoc «  vao truoc cac ban ghi tren cot SubjectName trong bang Subjects
use quanlysinhvien;
select subject_name as 'day la mon hoc'
from subjects;

-- c8  Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50
use quanlysinhvien;
alter table student
add constraint age check (age >15 and age <50); 

-- c9  Loai bo tat ca quan he giua cac bang
use quanlysinhvien;
alter table student drop constraint student_id;
alter table subjects drop constraint subject_id;
alter table classes drop constraint class_id;
alter table classtudent drop constraint class_id;
alter table classtudent drop constraint student_id;
alter table marks drop constraint student_id;
alter table marks drop constraint subject_id;

-- c10 Xoa hoc vien co StudentID la 1
use quanlysinhvien;
delete from student 
where student_id = 1;

-- c11 Trong bang Student them mot column Status co kieu du lieu la Bit va co gia tri Default la 1
use quanlysinhvien;
ALTER TABLE student
ADD status int NOT NULL DEFAULT(1);

-- c12 Cap nhap gia tri Status trong bang Student thanh 0
use quanlysinhvien;
ALTER TABLE student
ADD status int NOT NULL DEFAULT(1);