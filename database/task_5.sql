/*
5. Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien
(Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) 
cho tất cả các Khách hàng đã từng đặt phỏng. 
(Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
*/
use furama_management;

select kh.id_khach_hang, kh.ho_ten, kh.id_loai_khach, hd.id_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, sum(dv.chi_phi_thue + hd_ct.so_luong*dv_dk.gia) as tong_tien
from khach_hang kh
left join loai_khach lk on kh.id_loai_khach = lk.id_loai_khach
left join hop_dong hd on kh.id_khach_hang = hd.id_khach_hang
left join dich_vu dv on dv.id_dich_vu = hd.id_dich_vu
left join hop_dong_chi_tiet hd_ct on hd_ct.id_hop_dong = hd.id_hop_dong
left join dich_vu_di_kem dv_dk on dv_dk.id_dich_vu_di_kem = hd_ct.id_dich_vu_di_kem
group by kh.id_khach_hang;

