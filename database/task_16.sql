/*
16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2021.
*/
use furama_management;

create temporary table bang_tam_nhan_vien (
select *
from nhan_vien nv
where nv.id_nhan_vien not in (
	select nv.id_nhan_vien
	from nhan_vien nv
	join hop_dong hd on hd.id_nhan_vien = nv.id_nhan_vien
	where hd.ngay_lam_hop_dong between '2017-01-01' and '2021-12-31'
	group by nv.id_nhan_vien )
);
select * from bang_tam_nhan_vien;

delete from nhan_vien nv
where nv.id_nhan_vien in (
	select bt.id_nhan_vien
    from bang_tam_nhan_vien bt
);

drop table bang_tam_nhan_vien;

