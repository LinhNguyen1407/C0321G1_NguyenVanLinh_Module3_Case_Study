/*
24.	Tạo Non-Clustered Index có tên là IX_SoDT_DiaChi trên các cột SODIENTHOAI và DIACHI 
trên bảng KHACH HANG và kiểm tra tính hiệu quả tìm kiếm sau khi tạo Index.
*/
use furama_management;

SELECT * FROM khach_hang WHERE sdt = '0965111156' or dia_chi = 'Quảng Trị';
EXPLAIN SELECT * FROM khach_hang WHERE sdt = '0965111156' or dia_chi = 'Quảng Trị';

ALTER TABLE khach_hang ADD INDEX IX_SoDT_DiaChi(sdt, dia_chi);
EXPLAIN SELECT * FROM khach_hang WHERE sdt = '0965111156' or dia_chi = 'Quảng Trị';