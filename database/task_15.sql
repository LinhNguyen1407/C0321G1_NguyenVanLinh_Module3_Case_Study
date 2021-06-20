/*
15.	Hiển thi thông tin của tất cả nhân viên bao gồm 
IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi 
mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021
*/
use furama_management;

select nv.id_nhan_vien, nv.ho_ten_nhan_vien, td.trinh_do, bp.ten_bo_phan, nv.sdt, nv.dia_chi, count(hd.id_hop_dong) as so_luong_hop_dong
from nhan_vien nv
join trinh_do td on td.id_trinh_do = nv.id_trinh_do
join bo_phan bp on bp.id_bo_phan = nv.id_bo_phan
left join hop_dong hd on hd.id_nhan_vien = nv.id_nhan_vien
where hd.ngay_lam_hop_dong between '2020-01-01' and '2021-12-31'
group by nv.id_nhan_vien
having so_luong_hop_dong <=3



