/*
12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, 
TenDichVu, SoLuongDichVuDikem (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc 
của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng quý 2 năm 2021 
nhưng chưa từng được khách hàng đặt vào 3 tháng đầu năm 2021.
*/

use furama_management;

select hd.id_hop_dong, nv.ho_ten_nhan_vien, kh.ho_ten, kh.sdt, dv.ten_dich_vu, hd.ngay_lam_hop_dong,
count(hd_ct.id_hop_dong_chi_tiet) as so_luong_dv_di_kem, hd.tien_dat_coc
from hop_dong hd 
join nhan_vien nv on nv.id_nhan_vien = hd.id_nhan_vien
join khach_hang kh on kh.id_khach_hang = hd.id_khach_hang
join dich_vu dv on dv.id_dich_vu = hd.id_dich_vu
join hop_dong_chi_tiet hd_ct on hd_ct.id_hop_dong = hd.id_hop_dong
where (hd.ngay_lam_hop_dong between '2021-04-01' and '2021-06-30') and 
hd.id_dich_vu not in (
		select hop_dong.id_dich_vu
        from hop_dong
        where hop_dong.ngay_lam_hop_dong between '2021-01-01' and '2021-03-31')
group by hd.id_hop_dong;

