/*
27.	Tạo triggers có tên Tr_1 Xóa bản ghi trong bảng HopDong thì hiển thị 
tổng số lượng bản ghi còn lại có trong bảng HopDong ra giao diện console của database
*/
use furama_management;

delimiter //
create trigger Tr_1 after delete on hop_dong for each row
	begin
        set @temp = (select count(*) from hop_dong);
    end//
delimiter ;

delete from hop_dong
where id_hop_dong = 8;

select @temp as 'Số lượng bản ghi còn lại';

drop trigger Tr_1;