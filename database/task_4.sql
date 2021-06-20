/*
4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
*/

use furama_management;

select kh.ho_ten, count(hd.id_khach_hang) as so_lan_dat_phong, lk.ten_loai_khach
from khach_hang kh
join hop_dong hd on kh.id_khach_hang = hd.id_khach_hang
join loai_khach lk on lk.id_loai_khach = kh.id_loai_khach
group by kh.ho_ten
having lk.ten_loai_khach = 'Diamond'
order by so_lan_dat_phong;
