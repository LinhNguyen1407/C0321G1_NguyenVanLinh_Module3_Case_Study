/*
13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
(Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
*/
---- cách 1

select dv_dk.id_dich_vu_di_kem, dv_dk.ten_dich_vu_di_kem, count(hd_ct.id_hop_dong_chi_tiet) as so_lan_su_dung
from hop_dong_chi_tiet hd_ct
join dich_vu_di_kem dv_dk on dv_dk.id_dich_vu_di_kem = hd_ct.id_dich_vu_di_kem
group by hd_ct.id_dich_vu_di_kem
having so_lan_su_dung >= all (
	select count(hd_ct.id_hop_dong_chi_tiet)
    from hop_dong_chi_tiet hd_ct
    group by hd_ct.id_dich_vu_di_kem);


---- cách 2
create temporary table bang_tam_dich_vu_di_kem (select id_hop_dong_chi_tiet, count(hd_ct.id_dich_vu_di_kem) as so_lan_su_dung
				from hop_dong_chi_tiet hd_ct
                group by hd_ct.id_dich_vu_di_kem);
select * from bang_tam_dich_vu_di_kem;
				
select dv_dk.id_dich_vu_di_kem, dv_dk.ten_dich_vu_di_kem, max(bt.so_lan_su_dung)
from hop_dong_chi_tiet hd_ct
join dich_vu_di_kem dv_dk on dv_dk.id_dich_vu_di_kem = hd_ct.id_dich_vu_di_kem
join bang_tam_dich_vu_di_kem bt on hd_ct.id_hop_dong_chi_tiet = bt.id_hop_dong_chi_tiet;

drop table bang_tam_dich_vu_di_kem;