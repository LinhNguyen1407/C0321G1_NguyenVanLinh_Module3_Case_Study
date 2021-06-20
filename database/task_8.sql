/*
8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, 
với yêu cầu HoTenKhachHang không trùng nhau.
Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
*/

use furama_management;

select ho_ten
from khach_hang
group by ho_ten;

select distinct ho_ten
from khach_hang;

select ho_ten
from khach_hang
union
select ho_ten
from khach_hang;


