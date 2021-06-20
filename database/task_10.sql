/*
10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. 
Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem 
(được tính dựa trên việc count các IDHopDongChiTiet ).
*/

use furama_management;

select hd.id_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, count(hd_ct.id_hop_dong_chi_tiet) as so_luong_dv_di_kem
from hop_dong hd
join dich_vu dv on dv.id_dich_vu = hd.id_dich_vu
left join hop_dong_chi_tiet hd_ct on hd_ct.id_hop_dong = hd.id_hop_dong
group by hd.id_hop_dong;

