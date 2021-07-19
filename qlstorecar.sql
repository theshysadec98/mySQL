create database store_car;
-- Thực thể customers có các thuộc tính.
-- customerNumber (Mã khách hàng): Thuộc tính để phân biệt giữa các khách hàng, có kiểu dữ liệu số nguyên, ràng buộc không được để trống.
-- customerName (Tên công ty khách hàng), có kiểu dữ liệu chuỗi – 50 ký tự, ràng buộc không được để trống.
-- contactLastName (Họ khách hàng) có kiểu dữ liệu chuỗi – 50 ký tự, ràng buộc không được để trống.
-- contactFirstName (Tên khách hàng) có kiểu dữ liệu chuỗi – 50 ký tự, ràng buộc không được để trống.
-- phone (Số điện thoại) có kiểu dữ liệu chuỗi – 50 ký tự, ràng buộc không được để trống.
-- addressLine1 (Địa chỉ 1) có kiểu dữ liệu chuỗi – 50 ký tự, ràng buộc không được để trống.
-- addressLine2 (Địa chỉ 2): Thuộc tính có thể có giá trị hoặc không có kiểu dữ liệu chuỗi – 50 ký tự, ràng buộc được để trống.
-- city (Thành phố) có kiểu dữ liệu chuỗi – 50 ký tự, ràng buộc không được để trống.
-- state (Bang/vùng) có kiểu dữ liệu chuỗi – 50 ký tự, ràng buộc không được để trống.
-- postalCode (Mã vùng) có kiểu dữ liệu chuỗi – 15 ký tự, ràng buộc không được để trống.
-- country (Quốc gia) có kiểu dữ liệu chuỗi – 50 ký tự, ràng buộc không được để trống.
-- creditLimit (Hạn mức tín dụng) có kiểu số thực, cho phép để trống.
create table customers(
	customerNumber int not null primary key,
    customerName nvarchar(50) not null,
    contactLastName nvarchar(50) not null,
    contactFirstName nvarchar(50) not null,
    phone nvarchar(50) not null,
    addressLine1 nvarchar(50) not null,
    addressLine2 nvarchar(50),
    city nvarchar(50) not null,
    state nvarchar(50) not null,
    postalCode nvarchar(15) not null,
    country nvarchar(50) not null,
    creditLimit double
);
-- Thực thể orders có các thuộc tính.
-- orderNumber (Mã hóa đơn): Thuộc tính mạnh để phân biệt giữa các hóa đơn, có kiểu số nguyên, không được để trống.
-- orderDate (Ngày mua) có kiểu ngày/tháng/năm, không được để trống.
-- requiredDate (Ngày yêu cầu giao sản phẩm) có kiểu ngày/tháng/năm, không được để trống.
-- shippedDate (Ngày ship thực tế) có kiểu ngày/tháng/năm, được để trống.
-- status (Trạng thái) có kiểu chuỗi – 15 ký tự, không được để trống.
-- comments (Ghi chú) có kiểu text, được để trống.
-- quantityOrdered (Số lượng đặt hàng) có kiểu số nguyên, không được để trống.
-- priceEach (Đơn giá) có kiểu số thực, không được để trống.
create table orders(
	customerNumber int not null, 
	orderNumber int not null,
    orderDate date not null,
    requiredDate date not null,
    shippedDate date,
    status_order nvarchar(15) not null,
    comments text,
    quantityOrdered int not null,
    priceEach double not null,
    foreign key (customerNumber) references customers(customerNumber)
);
-- Thực thể payments có các thuộc tính
-- customerNumber (Mã khách hàng) thuộc tính tạo liên kết, có kiểu số nguyên, không được để trống.
-- checkNumber (Mã kiểm tra) có kiểu chuỗi – 50 ký tự, không được để trống.
-- paymentDate (Ngày thanh toán) có kiểu ngày/tháng/năm, không được để trống.
-- amount (Số tiền) có kiểu số thực, không được để trống.
create table payments(
	customerNumber int not null,
    checkNumber nvarchar(50) not null,
    paymentDate date not null,
    amount double not null,
    foreign key (customerNumber) references customers(customerNumber)
);
-- Thực thể products có các thuộc tính.
-- productCode (Mã sản phẩm): Thuộc tính để phân biệt giữa các sản phẩm, có kiểu chuỗi – 15 ký tự, không được để trống.
-- productName (Tên sản phẩm) có kiểu chuỗi – 70 ký tự, không được để trống.
-- productScale (Tỉ lệ/phạm vi sản phẩm) có kiểu chuỗi – 10 ký tự, không được để trống.
-- productVendor (Nhà cung cấp) có kiểu chuỗi – 50 ký tự, không được để trống.
-- productDescription (Mô tả sản phẩm) có kiểu text – văn bản, không được để trống.
-- quantityInStock (Số lượng trong kho) có kiểu số nguyên, không được để trống.
-- buyPrice (Giá nhập) có kiểu số thực, không được để trống.
-- MSRP (Giá bán lẻ) có kiểu số thực, không được để trống.
create table products(
	productCode int not null,
    productName nvarchar(50) not null,
    productScale nvarchar(10) not null,
    productVendor nvarchar(50) not null,
    productDescription text not null,
    quantityInStock int not null,
    buyPrice double not null,
    MSRP double not null
);
-- Thực thể productlines có các thuộc tính.
-- productLine (Mã loại sản phẩm): Thuộc tính để phân biệt giữa các loại sản phẩm, có kiểu chuỗi – 50 ký tự, không được để trống.
-- textDescription (Mô tả) có kiểu chuỗi – văn bản, được phép để trống.
-- image (Ảnh) có kiểu chuỗi, được phép để trống.
create table productlines(
	productLine nvarchar(50) not null,
    textDescription text not null,
    image nvarchar(255)
);
-- Thực thể employees có các thuộc tính.
-- employeeNumber (Mã nhân viên): Thuộc tính để phân biệt giữa các nhân viên, có kiểu số nguyên, không được để trống.
-- lastName (Họ) có kiểu chuỗi – 50 ký tự, không được để trống.
-- firstName (Tên) có kiểu chuỗi – 50 ký tự, không được để trống.
-- email (Địa chỉ email) có kiểu chuỗi – 100 ký tự, không được để trống.
-- jobTitle (Tên công việc) có kiểu chuỗi – 50 ký tự, không được để trống.
create table employees(
	employeeNumber int not null,
    lastName nvarchar(50) not null,
    firstName nvarchar(50) not null,
    email nvarchar(50) not null,
    jobTitle nvarchar(100) not null
);