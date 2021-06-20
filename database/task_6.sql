/*
6. Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu 
của tất cả các loại Dịch vụ chưa từng được Khách hàng 
thực hiện đặt từ quý 2 của năm 2021 (Quý 2 là tháng 4, 5, 6).
*/

use furama_management;

select dv.id_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv 
left join hop_dong hd on hd.id_dich_vu = dv.id_dich_vu
left join loai_dich_vu ldv on ldv.id_loai_dich_vu = dv.id_loai_dich_vu
where hd.ngay_lam_hop_dong < '2021-04-01' or hd.ngay_lam_hop_dong is null
group by id_dich_vu;
