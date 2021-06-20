/*
7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu 
của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong quý 1 năm 2021 
nhưng chưa từng được Khách hàng đặt phòng trong quý 2 năm 2021
*/

use furama_management;

select dv.id_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv 
left join hop_dong hd on hd.id_dich_vu = dv.id_dich_vu
left join loai_dich_vu ldv on ldv.id_loai_dich_vu = dv.id_loai_dich_vu
where hd.ngay_lam_hop_dong between '2021-01-01' and '2021-03-31'
group by id_dich_vu;