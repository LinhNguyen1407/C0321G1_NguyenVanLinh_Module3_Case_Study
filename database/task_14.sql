/*
14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.
*/

select hd.id_hop_dong, ldv.ten_loai_dich_vu, dv_dk.ten_dich_vu_di_kem, count(hd_ct.id_hop_dong_chi_tiet) as so_lan_su_dung
from hop_dong hd
join hop_dong_chi_tiet hd_ct on hd_ct.id_hop_dong = hd.id_hop_dong
join dich_vu dv on dv.id_dich_vu = hd.id_dich_vu
join loai_dich_vu ldv on ldv.id_loai_dich_vu = dv.id_loai_dich_vu
join dich_vu_di_kem dv_dk on dv_dk.id_dich_vu_di_kem = hd_ct.id_dich_vu_di_kem
group by hd_ct.id_dich_vu_di_kem
having so_lan_su_dung = 1;

