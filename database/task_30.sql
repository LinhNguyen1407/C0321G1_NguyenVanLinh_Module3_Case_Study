/*
30.	Tạo Stored procedure Sp_3 để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room” 
trong năm 2021 để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng DichVu) 
và xóa những HopDong sử dụng dịch vụ liên quan (tức là phải xóa những bản gi trong bảng HopDong) và những bản liên quan khác.
*/
use furama_management;

delimiter //
create procedure Sp_3 (in ten_dich_vu_in varchar(50), in ngay_lam_hop_dong_in date, in ngay_ket_thuc_in date)
begin
	create temporary table bang_tam_dich_vu (
	select dv.id_dich_vu, dv.ten_dich_vu, hd.id_hop_dong, hd_ct.id_hop_dong_chi_tiet, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc
	from dich_vu dv
	join hop_dong hd on hd.id_dich_vu = dv.id_dich_vu
    join hop_dong_chi_tiet hd_ct on hd_ct.id_hop_dong = hd.id_hop_dong
	where dv.ten_dich_vu = ten_dich_vu_in and hd.ngay_lam_hop_dong >= ngay_lam_hop_dong_in and hd.ngay_ket_thuc <= ngay_ket_thuc_in
	);
	set @count = (select count(*) from bang_tam_dich_vu);
    if @count = 0 then 
			drop temporary table bang_tam_dich_vu;
			signal sqlstate '45000' set message_text = 'Dịch vụ không tìm thấy';
        else
			delete from hop_dong_chi_tiet hd_ct
			where hd_ct.id_hop_dong_chi_tiet in 
				(select bt.id_hop_dong_chi_tiet
				 from bang_tam_dich_vu bt);

			delete from hop_dong hd
			where hd.id_hop_dong in 
				(select bt.id_hop_dong
				 from bang_tam_dich_vu bt);

			delete from dich_vu dv
			where dv.id_dich_vu in 
				(select bt.id_dich_vu
				 from bang_tam_dich_vu bt);
	end if;
    drop temporary table bang_tam_dich_vu;
end//
delimiter ;

call Sp_3('Room1', '2021-01-01', '2021-12-31'); --- lỗi
call Sp_3('Room', '2021-07-01', '2021-12-31'); --- lỗi
call Sp_3('Room', '2021-01-01', '2021-03-31'); --- lỗi

call Sp_3('Room', '2021-01-01', '2021-12-31'); --- tìm được và xóa thành công

drop procedure Sp_3;


