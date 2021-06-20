/*
25.	Tạo Store procedure Sp_1 Dùng để xóa thông tin của một Khách hàng nào đó với 
Id Khách hàng được truyền vào như là 1 tham số của Sp_1
*/
use furama_management;

delimiter //
create procedure Sp_1(in id_khach_hang_in int)
begin
	delete from khach_hang
	where id_khach_hang = id_khach_hang_in;
end//    
delimiter ;

call Sp_1(10);

