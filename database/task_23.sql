/*
23.	Tạo Clustered Index có tên là IX_KHACHHANG trên bảng Khách hàng.
Giải thích lý do và thực hiện kiểm tra tính hiệu quả của việc sử dụng INDEX
*/
use furama_management;

SELECT * FROM khach_hang WHERE ho_ten = 'Nguyễn Văn An';
EXPLAIN SELECT * FROM khach_hang WHERE ho_ten = 'Nguyễn Văn An';

ALTER TABLE khach_hang ADD INDEX IX_KHACHHANG(ho_ten);
EXPLAIN SELECT * FROM khach_hang WHERE ho_ten = 'Nguyễn Văn An';