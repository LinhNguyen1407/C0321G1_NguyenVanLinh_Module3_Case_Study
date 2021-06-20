/*
22.	Thông qua khung nhìn V_NHANVIEN thực hiện cập nhật địa chỉ thành “TP Huế”
đối với tất cả các Nhân viên được nhìn thấy bởi khung nhìn này.
*/
use furama_management;

select * from V_NHANVIEN;

update V_NHANVIEN 
set dia_chi = 'TP Huế';

select * from nhan_vien;