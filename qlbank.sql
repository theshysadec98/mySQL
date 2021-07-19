
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