-- Bảng Customers - khách hàng gồm customer_number (mã khách hàng), fullname (họ tên khách hàng), address (địa chỉ), email, phone (số điện thoại).
-- Bảng Accounts - tài khoản gồm account_number (số tài khoản), account_type (kiểu tài khoản), date (ngày mở tài khoản), balance (số dư).
-- Bảng Transactions - giao dịch gồm tran_number (mã giao dịch), account_number (số tài khoản giao dịch), date (thời gian giao dịch), amounts (số tiền giao dịch), descriptions (mô tả giao dịch). 

create database bank;
create table Customers(
	customer_number int not null primary key,
    fullname nvarchar(50) not null,
    address nvarchar(100),
    email nvarchar(50),
    phone nvarchar(10)
);
create table Accounts(
	customer_number int not null, 
	account_number int not null primary key,
    account_type nvarchar(20) not null,
    date_open date,
    balance double,
    foreign key (customer_number) references Customers(customer_number)
);
create table Transactions(
	tran_number int not null,
    account_number int not null,
    date_exchange date,
    amounts double,
    descriptions nvarchar(255),
    foreign key (account_number) references Accounts(account_number)
);