/*
29.	Tạo user function thực hiện yêu cầu sau:
	a.	Tạo user function func_1: Đếm các dịch vụ đã được sử dụng với Tổng tiền là > 10 triệu VNĐ.
	b.	Tạo user function Func_2: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc kết thúc hợp đồng
mà Khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, 
không xét trên toàn bộ các lần làm hợp đồng). Mã của Khách hàng được truyền vào như là 1 tham số của function này.
*/

------ a.
create temporary table bang_tam_dich_vu (
	select dv.id_dich_vu, dv.ten_dich_vu, sum(dv.chi_phi_thue + hd_ct.so_luong*dv_dk.gia) as tong_tien
	from hop_dong hd
	join dich_vu dv on dv.id_dich_vu = hd.id_dich_vu
	join hop_dong_chi_tiet hd_ct on hd_ct.id_hop_dong = hd.id_hop_dong
	join dich_vu_di_kem dv_dk on dv_dk.id_dich_vu_di_kem = hd_ct.id_dich_vu_di_kem
	group by dv.id_dich_vu
);

select * from bang_tam_dich_vu;

delimiter //
create function dem_dich_vu () returns int
reads sql data
deterministic
begin
	select count(*) into @count
    from bang_tam_dich_vu
    where tong_tien > 10;
    return @count;
end;

select dem_dich_vu() as 'số dịch vụ';

drop function count_dich_vu;
drop table bang_tam_dich_vu;

------ b. 
create temporary table bang_tam_thoi_gian (
	select id_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, timestampdiff(day, ngay_lam_hop_dong, ngay_ket_thuc) as so_ngay_thue
	from hop_dong hd
	group by id_hop_dong
);

delimiter //
create function tinh_thoi_gian_thue () returns int
reads sql data
deterministic
begin
	set @thoi_gian = (select max(so_ngay_thue) from bang_tam_thoi_gian);
    return @thoi_gian;
end;

select tinh_thoi_gian_thue() as thoi_gian_dai_nhat;

drop table bang_tam_thoi_gian;
drop function tinh_thoi_gian_thue;


------ b. (cách khác)
delimiter //
create function tinh_thoi_gian_thue (id_hop_dong_in int) returns int
reads sql data
deterministic
begin
	select hd.ngay_lam_hop_dong into @ngay_lam_hop_dong
    from hop_dong hd
    where hd.id_hop_dong = id_hop_dong_in;
	select hd.ngay_ket_thuc into @ngay_ket_thuc
    from hop_dong hd
    where hd.id_hop_dong = id_hop_dong_in;
    set @thoi_gian = (select timestampdiff(day, @ngay_lam_hop_dong, @ngay_ket_thuc ));
    return @thoi_gian;
end;

create table bang_tam_thoi_gian (
	id int primary key auto_increment,
	num_day int
);

insert into bang_tam_thoi_gian (num_day)
values (tinh_thoi_gian_thue(1));
insert into bang_tam_thoi_gian (num_day)
values (tinh_thoi_gian_thue(2));
insert into bang_tam_thoi_gian (num_day)
values (tinh_thoi_gian_thue(3));
insert into bang_tam_thoi_gian (num_day)
values (tinh_thoi_gian_thue(4));
insert into bang_tam_thoi_gian (num_day)
values (tinh_thoi_gian_thue(5));
insert into bang_tam_thoi_gian (num_day)
values (tinh_thoi_gian_thue(6));
insert into bang_tam_thoi_gian (num_day)
values (tinh_thoi_gian_thue(7));

select max(num_day)
from bang_tam_thoi_gian;

drop table bang_tam_thoi_gian;
drop function tinh_thoi_gian_thue;


	