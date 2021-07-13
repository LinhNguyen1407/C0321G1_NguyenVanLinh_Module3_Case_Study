create database furama_db;
use furama_db;

create table position (
	position_id int primary key auto_increment,
    position_name varchar(45)
);

insert into position
values
(1, 'lễ tân'),
(2, 'phục vụ'),
(3, 'chuyên viên'),
(4, 'giám sát'),
(5, 'quản lý'),
(6, 'giám đốc');


create table education_degree (
	education_degree_id int primary key auto_increment,
    education_degree_name varchar(45)
);

insert into education_degree
values
(1, 'trung cấp'),
(2, 'cao đẳng'),
(3, 'đại học'),
(4, 'sau đại học');


create table division(
	division_id int primary key auto_increment,
    division_name varchar(45)
);

insert into division
values
(1, 'sale – marketing'),
(2, 'hành chính'),
(3, 'phục vụ'),
(4, 'quản lý');

create table employee(
	employee_id int primary key auto_increment,
    employee_name varchar(255),
	position_id int,
    education_degree_id int,
    division_id int,
    employee_birthday date,
    employee_id_card varchar(45),
    employee_salary int,
    employee_phone varchar(45),
    employee_email varchar(45),
    employee_address varchar(45),
    username varchar(45),
    foreign key(position_id) references position (position_id),
    foreign key(education_degree_id) references education_degree(education_degree_id),
    foreign key(division_id) references division(division_id),
    foreign key(username) references user(username)
);

insert into employee
values
(1, 'Trần Thị Ngọc', 1, 1, 3, '2000-12-10', '111 222 333', 8, '0977112233', 'ngoc@gmail.com', 'Đà Nẵng', 'ngoctt'),
(2, 'Nguyễn Thị An', 2, 1, 3, '2001-06-11', '123 345 333', 7, '0933112345', 'an@gmail.com', 'Đà Nẵng', 'annt'),
(3, 'Đỗ Thị Thu', 4, 3, 4, '1998-11-09', '253 345 111', 13, '0914456395', 'thu@gmail.com', 'Quảng Nam', 'thudt'),
(4, 'Trần Văn Khánh', 3, 3, 2, '1995-03-05', '257 345 789', 12, '0972456333', 'khanh@gmail.com', 'Quảng Nam', 'khanhtv'),
(5, 'Nguyễn Hùng', 5, 3, 4, '1994-03-05', '321 345 122', 16, '0988123333', 'hung@gmail.com', 'Huế', 'hungn'),
(6, 'Đỗ Hải', 6, 4, 4, '1990-03-05', '124 345 789', 20, '0944123789', 'hai@gmail.com', 'Quảng Ngãi', 'haid');


create table customer_type(
	customer_type_id int primary key auto_increment,
    customer_type_name varchar(45)
);

insert into customer_type
values
(1, 'Diamond'),
(2, 'Platinium'),
(3, 'Gold'),
(4, 'Silver'),
(5, 'Member');


create table customer(
	customer_id int primary key auto_increment,
    customer_code varchar(45),
    customer_type_id int,
    customer_name varchar(255),
    customer_birthday date,
    customer_gender bit(1),
    customer_id_card varchar(45),
    customer_phone varchar(45),
    customer_email varchar(45),
    customer_address varchar(45),
    foreign key(customer_type_id) references customer_type(customer_type_id)
);

insert into customer
values
(1, 'KH-0001', 1, 'Nguyễn Văn An', '2000-12-01', 1, '123 123 456', '0975123456', 'an@gmail.com', 'Đà Nẵng'),
(2, 'KH-0002', 2, 'Nguyễn Văn Bình', '2001-10-11', 1, '123 123 789', '0955123499', 'binh@gmail.com', 'Đà Nẵng'),
(3, 'KH-0003', 4, 'Nguyễn Văn Chi', '1970-06-01', 1, '111 123 456', '0965111156', 'chi@gmail.com', 'Quảng Trị'),
(4, 'KH-0004', 5, 'Nguyễn Thị Lan', '1990-12-06', 0, '123 333 456', '0988123999', 'lan@gmail.com', 'Quảng Trị'),
(5, 'KH-0005', 3, 'Nguyễn Đức', '1995-08-11', 1, '455 333 111', '0988123001', 'duc@gmail.com', 'Quảng Nam'),
(6, 'KH-0006', 1, 'Nguyễn Văn Nam', '1998-01-12', 1, '123 777 999', '0911444456', 'nam@gmail.com', 'Huế'),
(7, 'KH-0007', 1, 'Trần Văn Hải', '2002-08-21', 1, '123 123 666', '0967333456', 'hai@gmail.com', 'Quảng Ngãi'),
(8, 'KH-0008', 1, 'Đỗ Văn Hiếu', '1990-10-05', 1, '455 123 789', '0955123123', 'hieu@gmail.com', 'Vinh'),
(9, 'KH-0009', 2, 'Nguyễn Văn Ái', '1995-12-10', 1, '122 123 799', '0975123996', 'ai@gmail.com', 'Quảng Ngãi'),
(10, 'KH-0010', 2, 'Đỗ Thị Ánh', '2000-08-31', 0, '111 444 456', '0985012456', 'anh@gmail.com', 'Vinh');


create table contract(
	contract_id int primary key auto_increment,
    employee_id int,
    customer_id int,
    service_id int,
    contract_start_date date,
    contract_end_date date,
    contract_deposit double,
    contract_total_money double,
    foreign key(employee_id) references employee(employee_id),
    foreign key(customer_id) references customer(customer_id),
    foreign key(service_id) references service(service_id)
);

insert into contract
values
(1, 1, 1, 1, '2021-02-11', '2021-02-20', 3000000, null),
(2, 2, 2, 2, '2021-03-01', '2021-04-07', 2000000, null),
(3, 3, 6, 3, '2021-05-01', '2021-05-30', 1000000, null),
(4, 5, 1, 1, '2021-04-02', '2021-05-20', 2000000, null),
(5, 1, 2, 2, '2021-02-15', '2021-03-14', 2000000, null),
(6, 1, 7, 2, '2021-06-10', '2021-07-03', 1500000, null),
(7, 3, 8, 3, '2021-06-04', '2021-06-30', 1000000, null),
(8, 1, 1, 1, '2020-12-30', '2021-06-29', 2000000, null);


create table service_type(
	service_type_id int primary key auto_increment,
    service_type_name varchar(45)
);

insert into service_type
values
(1, 'vip'),
(2, 'standard');


create table rent_type(
	rent_type_id int primary key auto_increment,
    rent_type_name varchar(45),
    rent_type_cost double
);

insert into rent_type
values
(1, 'năm', 20000000),
(2, 'tháng', 4000000),
(3, 'ngày', 200000),
(4, 'giờ', 50000);


create table service(
	service_id int primary key auto_increment,
    service_code varchar(45),
    service_name varchar(45),
    service_area int,
    number_of_floors int,
    service_max_people int,
    service_cost double,
    rent_type_id int,
    service_type_id int,
    standard_room varchar(45),
    decs_other_convenience varchar(45),
    poor_area double,
    foreign key(rent_type_id) references rent_type(rent_type_id),
	foreign key(service_type_id) references service_type(service_type_id)
);

insert into service
values
(1, 'DV-0001', 'Villa01', 300, 2, 15, 15000000, 3, 1, 'vip', 'sang trọng', 55),
(2, 'DV-0002', 'House01', 100, 2, 6, 5000000, 2, 2, 'standard', 'rộng rãi' , null),
(3, 'DV-0003', 'Room01', 35, 1, 3, 1500000, 2, 2, 'standard', 'thoáng mát' , null ),
(4, 'DV-0004', 'Villa02', 500, 2, 20, 20000000, 3, 1, 'vip', 'sang trọng', 65),
(5, 'DV-0005', 'House02', 200, 3, 6, 7000000, 3, 1, 'vip', 'gần khu vui chơi', 40),
(6, 'DV-0006', 'Room02', 45, 1, 4, 2000000, 4, 1, 'vip', 'view đẹp' , null);


create table attach_service(
	attach_service_id int primary key auto_increment,
    attach_service_name varchar(45),
    attach_service_cost double,
    attach_service_unit int,
    attach_service_status varchar(45)
);

insert into attach_service
values
(1, 'massage', 100000, 1, 'còn'),
(2, 'karaoke', 150000, 1, 'còn'),
(3, 'food', 30000, 1, 'còn'),
(4, 'drink', 15000, 1, 'còn'),
(5, 'car', 100000, 1, 'còn');


create table contract_detail(
	contract_detail_id int primary key auto_increment,
    contract_id int,
    attach_service_id int,
    quantity int,
    foreign key(contract_id) references contract(contract_id),
    foreign key(attach_service_id) references attach_service(attach_service_id)
);

insert into contract_detail
values
(1, 1, 1, 5),
(2, 3, 3, 10),
(3, 4, 4, 10),
(4, 2, 2, 3),
(5, 1, 3, 5),
(6, 5, 4, 3),
(7, 6, 3, 2),
(8, 7, 5, 2),
(9, 8, 3, 5);


create table role(
	role_id int primary key auto_increment,
    role_name varchar(255)
);

insert into role
values
(1, 'read'),
(2, 'create'),
(3, 'update'),
(4, 'delete');


create table user(
	username varchar(255) primary key,
    `password` varchar(255)
);

insert into user
values
('ngoctt', '123456'),
('annt', '123456'),
('thudt', '123456'),
('khanhtv', '123456'),
('hungn', '123456'),
('haid', '123456');


create table user_role(
	role_id int,
    username varchar(255),
    primary key(role_id, username),
	foreign key (role_id) references role(role_id),
    foreign key (username) references user(username)
);

insert into user_role
values
(1, 'ngoctt'),
(1, 'annt'),
(1, 'thudt'),
(1, 'khanhtv'),
(1, 'hungn'),
(1, 'haid'),
(2, 'khanhtv'),
(2, 'hungn'),
(2, 'haid'),
(3, 'hungn'),
(3, 'haid'),
(4, 'haid');

delimiter //
create procedure get_customers ()
begin
select cm.customer_id, cm.customer_name, ct.contract_id, sv.service_name, ctdt.contract_detail_id, atsv.attach_service_name
from customer cm
join contract ct on ct.customer_id = cm.customer_id
join service sv on sv.service_id = ct.service_id
join contract_detail ctdt on ctdt.contract_id = ct.contract_id
join attach_service atsv on atsv.attach_service_id = ctdt.attach_service_id
order by cm.customer_id;
end//
delimiter ;

call get_customers();