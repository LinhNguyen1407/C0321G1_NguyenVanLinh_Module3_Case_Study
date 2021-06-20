/*
17.	Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond, 
chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 
là lớn hơn 10.000.000 VNĐ.
*/
use furama_management;

create temporary table bang_tam_khach_hang (
	select kh.id_khach_hang, kh.ho_ten, lk.id_loai_khach, lk.ten_loai_khach, sum(dv.chi_phi_thue + hd_ct.so_luong*dv_dk.gia) as tong_tien
	from khach_hang kh
	join loai_khach lk on kh.id_loai_khach = lk.id_loai_khach
	join hop_dong hd on kh.id_khach_hang = hd.id_khach_hang
	join dich_vu dv on dv.id_dich_vu = hd.id_dich_vu
	join hop_dong_chi_tiet hd_ct on hd_ct.id_hop_dong = hd.id_hop_dong
	join dich_vu_di_kem dv_dk on dv_dk.id_dich_vu_di_kem = hd_ct.id_dich_vu_di_kem
	where hd.ngay_lam_hop_dong between '2021-01-01' and '2021-12-31'
	group by kh.id_khach_hang
	having tong_tien > 10
);

select * from bang_tam_khach_hang;

update khach_hang kh
set kh.id_loai_khach = 1
where kh.id_khach_hang = (
	select bt.id_khach_hang
    from bang_tam_khach_hang bt
    where bt.id_loai_khach = 2
    );

drop table bang_tam_khach_hang;