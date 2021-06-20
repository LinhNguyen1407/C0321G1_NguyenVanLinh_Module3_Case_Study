/*
3.	Hiển thị thông tin của tất cả khách hàng 
có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
*/

use furama_management;

select *
from khach_hang
where year(now()) - year(ngay_sinh) between 18 and 50
and (dia_chi = 'Đà Nẵng' or dia_chi = 'Quảng Trị');
