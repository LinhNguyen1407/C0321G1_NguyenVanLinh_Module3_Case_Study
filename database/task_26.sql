/*
26.	Tạo Store procedure Sp_2 Dùng để thêm mới vào bảng HopDong với yêu cầu 
Sp_2 phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, 
với nguyên tắc không được trùng khóa chính và 
đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
*/

delimiter //
create procedure Sp_2(in id_hop_dong_in int, in id_nhan_vien_in int, in id_khach_hang_in int, in id_dich_vu_in int, 
in ngay_lam_hop_dong_in date, in ngay_ket_thuc_in date, in tien_dat_coc_in double, in tong_tien_in double)
begin
    if (id_hop_dong_in in (select id_hop_dong from hop_dong)) then
			signal sqlstate '45000' set message_text = 'Thông tin id hợp đồng trùng lặp';
		elseif (id_nhan_vien_in not in (select id_nhan_vien from nhan_vien)) then
			signal sqlstate '45000' set message_text = 'Thông tin id nhân viên không tồn tại';
		elseif (id_khach_hang_in not in (select id_khach_hang from khach_hang)) then
			signal sqlstate '45000' set message_text = 'Thông tin id khách hàng không tồn tại';
		elseif (id_dich_vu_in not in (select id_dich_vu from dich_vu)) then
			signal sqlstate '45000' set message_text = 'Thông tin id dịch vụ không tồn tại';
		else
			insert into hop_dong
			values
			(id_hop_dong_in, id_nhan_vien_in, id_khach_hang_in, id_dich_vu_in, ngay_lam_hop_dong_in, ngay_ket_thuc_in, tien_dat_coc_in, tong_tien_in);
    end if;
end//
delimiter ;

call Sp_2(1, 1, 1, 1, '2019-02-01', '2019-04-15', 7, null); --- Thông tin id hợp đồng trùng lặp

call Sp_2(8, 6, 1, 1, '2019-02-01', '2019-04-15', 7, null); --- Thông tin id nhân viên không tồn tại

call Sp_2(1, 1, 9, 1, '2019-02-01', '2019-04-15', 7, null); --- Thông tin id khách hàng không tồn tại

call Sp_2(1, 1, 1, 5, '2019-02-01', '2019-04-15', 7, null); --- Thông tin id dịch vụ không tồn tại

call Sp_2(8, 1, 1, 1, '2019-02-01', '2019-04-15', 7, null); --- Thêm thành công

drop procedure Sp_2;
