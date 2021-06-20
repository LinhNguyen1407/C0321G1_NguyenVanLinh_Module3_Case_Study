/*
21.	Tạo khung nhìn có tên là V_NHANVIEN để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Huế” 
và đã từng lập hợp đồng cho 1 hoặc nhiều Khách hàng bất kỳ  với ngày lập hợp đồng là “2021-04-02”
*/
use furama_management;

create view V_NHANVIEN as
select nv.id_nhan_vien, nv.ho_ten_nhan_vien, nv.dia_chi, hd.id_hop_dong, hd.ngay_lam_hop_dong
from nhan_vien nv
join hop_dong hd on hd.id_nhan_vien = nv.id_nhan_vien
where nv.dia_chi = 'Huế' and hd.ngay_lam_hop_dong = '2021-04-02';

select * from V_NHANVIEN;

drop view V_NHANVIEN;


