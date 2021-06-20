/*
9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 
thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
*/

use furama_management;

select month(ngay_lam_hop_dong) as thang, count(month(ngay_lam_hop_dong)) as doanh_thu_thang, year(ngay_lam_hop_dong) as `year`
from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by thang;