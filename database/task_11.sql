/*
11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi 
những Khách hàng có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.
*/

use furama_management;

select kh.ho_ten, kh.dia_chi, lk.ten_loai_khach, dv_dk.ten_dich_vu_di_kem
from khach_hang kh
join loai_khach lk on lk.id_loai_khach = kh.id_loai_khach
join hop_dong hd on kh.id_khach_hang = hd.id_khach_hang
join hop_dong_chi_tiet hd_ct on hd.id_hop_dong = hd_ct.id_hop_dong
join dich_vu_di_kem dv_dk on hd_ct.id_dich_vu_di_kem = dv_dk.id_dich_vu_di_kem
where lk.ten_loai_khach = 'Diamond' and (kh.dia_chi = 'Quảng Ngãi' or kh.dia_chi = 'Vinh');

select kh.ho_ten, kh.dia_chi, lk.ten_loai_khach, dv_dk.ten_dich_vu_di_kem
from dich_vu_di_kem dv_dk
join hop_dong_chi_tiet hd_ct on hd_ct.id_dich_vu_di_kem = dv_dk.id_dich_vu_di_kem
join hop_dong hd on hd.id_hop_dong = hd_ct.id_hop_dong
join khach_hang kh on kh.id_khach_hang = hd.id_khach_hang
join loai_khach lk on lk.id_loai_khach = kh.id_loai_khach
where lk.ten_loai_khach = 'Diamond' and (kh.dia_chi = 'Quảng Ngãi' or kh.dia_chi = 'Vinh');
