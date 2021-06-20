/*
18.	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràngbuộc giữa các bảng).
*/
use furama_management;

create temporary table bang_tam_khach_hang (
	select kh.*, hd.ngay_lam_hop_dong, hd.id_hop_dong
	from khach_hang kh
	join hop_dong hd on kh.id_khach_hang = hd.id_khach_hang
	where hd.ngay_lam_hop_dong < '2021-01-01'
);

select * from bang_tam_khach_hang;

delete from hop_dong_chi_tiet hd_ct
where hd_ct.id_hop_dong in (
	select bt.id_hop_dong
    from bang_tam_khach_hang bt
);

delete from hop_dong hd
where hd.id_khach_hang in (
	select bt.id_khach_hang
    from bang_tam_khach_hang bt
);

delete from khach_hang kh
where kh.id_khach_hang in (
	select bt.id_khach_hang
    from bang_tam_khach_hang bt
);

drop table bang_tam_khach_hang;