/*
19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 3 lần trong năm 2021 lên gấp đôi.
*/
use furama_management;

create temporary table bang_tam_dich_vu_di_kem (
	select dv_dk.*, count(hd_ct.id_hop_dong_chi_tiet) as so_lan_su_dung_dv_dk
	from dich_vu_di_kem dv_dk
	left join hop_dong_chi_tiet hd_ct on hd_ct.id_dich_vu_di_kem = dv_dk.id_dich_vu_di_kem
	group by dv_dk.id_dich_vu_di_kem
    having so_lan_su_dung_dv_dk >= 3
);

select * from bang_tam_dich_vu_di_kem;

update dich_vu_di_kem dv_dk
set gia = gia*2
where dv_dk.id_dich_vu_di_kem in (
	select bt.id_dich_vu_di_kem
    from bang_tam_dich_vu_di_kem bt
);

drop table bang_tam_dich_vu_di_kem;
