/*
20.	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, 
thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.
*/
use furama_management;

select id_nhan_vien as id, ho_ten_nhan_vien as ho_ten, email, sdt, ngay_sinh, dia_chi
from nhan_vien
union
select id_khach_hang as id, ho_ten, email, sdt, ngay_sinh, dia_chi
from khach_hang;
