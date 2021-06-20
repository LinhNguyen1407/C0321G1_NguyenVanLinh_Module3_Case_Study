/*
1.Thêm mới thông tin cho tất cả các bảng có trong CSDL
 để có thể thõa mãn các yêu cầu bên dưới
 */
create database furama_management;
use furama_management;

/* Vị trí sẽ lưu trữ các thông tin:
Lễ tân, phục vụ, chuyên viên, giám sát, quản lý, giám đốc
  */  
create table vi_tri(
	id_vi_tri int primary key auto_increment,
    ten_vi_tri varchar(45)
);

insert into vi_tri
values
(1, 'lễ tân'),
(2, 'phục vụ'),
(3, 'chuyên viên'),
(4, 'giám sát'),
(5, 'quản lý'),
(6, 'giám đốc');


/*Trình độ sẽ lưu trữ các thông tin:
Trung cấp, Cao đẳng, Đại học và sau đại học
  */
create table trinh_do(
	id_trinh_do int primary key auto_increment,
    trinh_do varchar(45)
);

insert into trinh_do
values
(1, 'trung cấp'),
(2, 'cao đẳng'),
(3, 'đại học'),
(4, 'sau đại học');


/*Mỗi Employee sẽ thuộc một bộ phận làm việc: 
Hiện tại resort bao gồm các bộ phận: Sale – Marketing, Hành Chính, Phục vụ, Quản lý
*/
create table bo_phan(
	id_bo_phan int primary key auto_increment,
    ten_bo_phan varchar(45)
);

insert into bo_phan
values
(1, 'sale – marketing'),
(2, 'hành chính'),
(3, 'phục vụ'),
(4, 'quản lý');

create table nhan_vien(
	id_nhan_vien int primary key auto_increment,
    ho_ten_nhan_vien varchar(255),
	id_vi_tri int,
    id_trinh_do int,
    id_bo_phan int,
    ngay_sinh date,
    so_cmtnd varchar(45),
    luong int,
    sdt varchar(45),
    email varchar(45),
    dia_chi varchar(45),
    foreign key(id_vi_tri) references vi_tri(id_vi_tri),
    foreign key(id_trinh_do) references trinh_do(id_trinh_do),
    foreign key(id_bo_phan) references bo_phan(id_bo_phan)
);

insert into nhan_vien
values
(1, 'Ngọc', 1, 1, 3, '2000-12-10', '111 222 333', 8, '0977112233', 'ngoc@gmail.com', 'Đà Nẵng'),
(2, 'An', 2, 1, 3, '2001-06-11', '123 345 333', 7, '0933112345', 'an@gmail.com', 'Đà Nẵng'),
(3, 'Thu', 4, 3, 4, '1998-11-09', '253 345 111', 13, '0914456395', 'thu@gmail.com', 'Quảng Nam'),
(4, 'Khánh', 3, 3, 2, '1995-03-05', '257 345 789', 12, '0972456333', 'khanh@gmail.com', 'Quảng Nam'),
(5, 'Hùng', 5, 3, 4, '1994-03-05', '321 345 122', 16, '0988123333', 'hung@gmail.com', 'Huế'),
(6, 'Hải', 6, 4, 4, '1990-03-05', '124 345 789', 16, '0944123789', 'hai@gmail.com', 'Quảng Ngãi');
 
update nhan_vien
set ho_ten_nhan_vien = 'Trần Thị Ngọc'
where id_nhan_vien = 1;

update nhan_vien
set ho_ten_nhan_vien = 'Nguyễn Thị An'
where id_nhan_vien = 2;

update nhan_vien
set ho_ten_nhan_vien = 'Đỗ Thị Thu'
where id_nhan_vien = 3;

update nhan_vien
set ho_ten_nhan_vien = 'Trần Văn Khánh'
where id_nhan_vien = 4;

update nhan_vien
set ho_ten_nhan_vien = 'Nguyễn Hùng'
where id_nhan_vien = 5;

update nhan_vien
set ho_ten_nhan_vien = 'Đỗ Hải'
where id_nhan_vien = 6;

/*Loại Customer bao gồm: Diamond, Platinium, Gold, Silver, Member */
create table loai_khach(
	id_loai_khach int primary key auto_increment,
    ten_loai_khach varchar(45)
);

insert into loai_khach
values
(1, 'Diamond'),
(2, 'Platinium'),
(3, 'Gold'),
(4, 'Silver'),
(5, 'Member');

/* Kiểu thuê bao gồm thuê theo năm, tháng, ngày, giờ */
create table kieu_thue(
	id_kieu_thue int primary key auto_increment,
    ten_kieu_thue varchar(45),
    gia int
);

insert into kieu_thue
values
(1, 'năm', 100),
(2, 'tháng', 10),
(3, 'ngày', 2),
(4, 'giờ', 1);

/*Loại dịch vụ gồm standard và vip */
create table loai_dich_vu(
	id_loai_dich_vu int primary key auto_increment,
    ten_loai_dich_vu varchar(45)
);

insert into loai_dich_vu
values
(1, 'vip'),
(2, 'standard');


create table khach_hang(
	id_khach_hang int primary key auto_increment,
    id_loai_khach int,
    ho_ten varchar(255),
    ngay_sinh date,
    so_cmtnd varchar(45),
    sdt varchar(45),
    email varchar(45),
    dia_chi varchar(45)
);

alter table khach_hang
add foreign key(id_loai_khach) references loai_khach(id_loai_khach);

insert into khach_hang
values
(1, 1, 'Nguyễn Văn An', '2000-12-01', '123 123 456', '0975123456', 'an@gmail.com', 'Đà Nẵng'),
(2, 2, 'Nguyễn Văn Bình', '2001-10-11', '123 123 789', '0955123499', 'binh@gmail.com', 'Đà Nẵng'),
(3, 4, 'Nguyễn Văn Chi', '1970-06-01', '111 123 456', '0965111156', 'chi@gmail.com', 'Quảng Trị'),
(4, 5, 'Nguyễn Thị Lan', '1990-12-06', '123 333 456', '0988123999', 'lan@gmail.com', 'Quảng Trị'),
(5, 3, 'Nguyễn Đức', '1995-08-11', '455 333 111', '0988123001', 'duc@gmail.com', 'Quảng Nam'),
(6, 1, 'Nguyễn Văn Nam', '1998-01-12', '123 777 999', '0911444456', 'nam@gmail.com', 'Huế');

insert into khach_hang
values
(7, 1, 'Trần Văn Hải', '2002-08-21', '123 123 666', '0967333456', 'hai@gmail.com', 'Quảng Ngãi'),
(8, 1, 'Đỗ Văn Hiếu', '1990-10-05', '455 123 789', '0955123123', 'hieu@gmail.com', 'Vinh'),
(9, 2, 'Nguyễn Văn Ái', '1995-12-10', '122 123 799', '0975123996', 'ai@gmail.com', 'Quảng Ngãi'),
(10, 2, 'Đỗ Thị Ánh', '2000-08-31', '111 444 456', '0985012456', 'anh@gmail.com', 'Vinh');

/*Tất cả các dịch vụ này sẽ bao có các thông tin: 
Tên dịch vụ, Diện tích sử dụng, Chi phí thuê, Số lượng người tối đa, Kiểu thuê
 */
create table dich_vu(
	id_dich_vu int primary key auto_increment,
    ten_dich_vu varchar(45),
    dien_tich double,
    so_tang int,
    so_nguoi_toi_da int,
    chi_phi_thue double,
    id_kieu_thue int,
    id_loai_dich_vu int,
    trang_thai varchar(45),
    foreign key(id_kieu_thue) references kieu_thue(id_kieu_thue),
	foreign key(id_loai_dich_vu) references loai_dich_vu(id_loai_dich_vu)
);

insert into dich_vu
values
(1, 'Villa', 150, 2, 15, 20, 2, 1, 'còn'),
(2, 'House', 100, 3, 7, 8, 3, 2, 'còn'),
(3, 'Room', 45, 1, 4, 3, 1, 2, 'còn');

insert into dich_vu
values
(4, 'Villa01', 200, 2, 20, 25, 3, 1, 'còn');

create table hop_dong(
	id_hop_dong int primary key auto_increment,
    id_nhan_vien int,
    id_khach_hang int,
    id_dich_vu int,
    ngay_lam_hop_dong date,
    ngay_ket_thuc date,
    tien_dat_coc double,
    tong_tien double,
    foreign key(id_nhan_vien) references nhan_vien(id_nhan_vien),
    foreign key(id_khach_hang) references khach_hang(id_khach_hang),
    foreign key(id_dich_vu) references dich_vu(id_dich_vu)
);

insert into hop_dong
values
(1, 1, 1, 1, '2021-02-11', '2021-02-20', 10, null),
(2, 2, 2, 2, '2021-03-01', '2021-04-07', 3, null),
(3, 3, 6, 3, '2021-05-01', '2021-05-30', 1, null),
(4, 5, 1, 1, '2021-04-02', '2021-05-20', 5, null);

insert into hop_dong
values
(5, 1, 2, 2, '2021-02-15', '2021-03-14', 5, null);

insert into hop_dong
values
(6, 1, 7, 2, '2021-06-10', '2021-07-03', 2, null),
(7, 3, 8, 3, '2021-06-04', '2021-06-30', 1, null);

insert into hop_dong
values
(8, 1, 1, 1, '2020-12-30', '2021-06-29', 5, null);

/*
Resort còn cung cấp các dịch vụ đi kèm như 
massage, karaoke, thức ăn, nước uống, thuê xe di chuyển tham quan resort.
Dịch vụ đi kèm sẽ bao gồm các thông tin: Tên dịch vụ đi kèm, Đơn vị, Giá tiền
*/
create table dich_vu_di_kem(
	id_dich_vu_di_kem int primary key auto_increment,
    ten_dich_vu_di_kem varchar(45),
    gia double,
    don_vi int,
    trang_thai_kha_dung varchar(45)
);

insert into dich_vu_di_kem
values
(1, 'massage', 0.2, 1, 'còn'),
(2, 'karaoke', 0.5, 1, 'còn'),
(3, 'food', 0.02, 1, 'còn'),
(4, 'drink', 0.02, 1, 'còn'),
(5, 'car', 0.1, 1, 'còn');

update dich_vu_di_kem
set ten_dich_vu_di_kem = 'food', gia = 0.02
where id_dich_vu_di_kem = 2;

update dich_vu_di_kem
set ten_dich_vu_di_kem = 'karaoke', gia = 0.5
where id_dich_vu_di_kem = 3;


create table hop_dong_chi_tiet(
	id_hop_dong_chi_tiet int primary key auto_increment,
    id_hop_dong int,
    id_dich_vu_di_kem int,
    so_luong int,
    foreign key(id_hop_dong) references hop_dong(id_hop_dong),
    foreign key(id_dich_vu_di_kem) references dich_vu_di_kem(id_dich_vu_di_kem)
);

insert into hop_dong_chi_tiet
values
(1, 1, 1, 5),
(2, 3, 2, 10),
(3, 4, 4, 10),
(4, 2, 5, 3);

insert into hop_dong_chi_tiet
values
(5, 1, 2, 5),
(6, 5, 4, 3);

insert into hop_dong_chi_tiet
values
(7, 6, 2, 2),
(8, 7, 5, 2),
(9, 8, 2, 5);
