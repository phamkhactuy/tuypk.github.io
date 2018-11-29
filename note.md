[Quay lại trang chủ](https://phamkhactuy.github.io/tuypk.github.io/index.html)

# Nước sông Tô Lịch quá ô nhiễm, giải pháp nào cho vấn đề này nhỉ?

# Đi tàu hỏa lại tháng 5/2018: vệ sinh được cải thiện, còn tàu thì vẫn cũ như vậy.

# Suy nghĩ về việc kết nạp Đảng và mong muốn trở thành Đảng viên hiện nay


### Ứng dụng K-MEAN: Phân lớp đối tượng khách hàng theo: độ tuổi..., thời gian gia hạn, thời gian lắp đặt...

### Viết về các hệ thống đã được trải nghiệm
- Icab của VTVCab
- Hệ thống nhắn tin SMS
- Hệ thống API
- Hệ thống báo cáo thời gian thực
- Hệ thống tích điểm của KTV
- Hệ thống khách hàng thân thiết
### Giới thiệu những phần mềm hữu ích mà tôi đang dùng
- Visual Studio: Code C# thì buộc phải dùng cái này, chắc không cần phải giới thiệu nữa. Mình code một số tools dùng ASP.NET.
- Sniping Tool: Chụp ảnh màn hình máy tính nhanh và tiện. Tool mặc định của Windown
- Snagit: 1 Tool trả phí nhưng mình dùng chui. Cũng chụp ảnh màn hình nhưng có khả năng vẽ vời, add text, tô màu... rất tiện khi làm hướng dẫn.
- Notepad++: Là 1 text editer đa năng, hỗ trợ rất nhiều ngôn ngữ lập trình mà lại nhẹ.
- 
### Dữ liệu giờ đây mới là nguồn tài nguyên quý giá nhất chứ không phải dầu mỏ
###
@tanthegioi: Cậu làm tớ nhớ lại cựu TTK Liên hợp quốc Kofi Annan và vợ thăm Văn Miếu dịp tháng5/2006: Ghi lại cảm tưởng trong cuốn sổ lưu niệm của Quốc Tử Giám, ông Annan viết: "Very severe and peaceful. A great place for students". (Tạm dịch là: Rất giản dị và thanh bình. Một nơi tuyệt vời cho sinh viên). Vợ ông, bà Nane Annan viết thêm: "We remain students". (Chúng ta vẫn là sinh viên).
https://www.vinhphuc.gov.vn/ct/cms/t...spx?ItemID=503
### Viết về việc chăm sóc khách hàng cho những người dùng fb để kinh doanh

### Viết một bài hồi tưởng trải nghiệm ở Cô tô, Cát bà, Quảng Bình, Huế, sapa
- Cô Tô
Tối hôm trước ăn quá nhiều hải sản bị đau bụng, đúng hôm bão. Hôm sau có Lăng và sếp Phúc rất quan tâm.

- Cát Bà


### Nói chuyện với anh Bùi Duy Hùng 08/2018
- Thiền: gạt bỏ những điều không cần thiết, đó có thể coi là buông bỏ
=> Phần này mình cũng đúng, có quá nhiều thứ thì làm sao mà thu nhận nổi. Trí óc mỗi người là có hạn, gạt bỏ sân si cũng như là Phật giáo đã dạy
=> 
- Về marketing online
- Nói về facebook với quảng cáo

### Tôi đã tự động hóa các công việc nhàm chán hàng ngày như thế nào
- Build birt-report để xuất các file excel-pdf cho kế toán
- Build tool xử lý các step query chọc trực tiếp vào database
- 




### Kích thích KH xác minh số điện thoại cho thuê bao
Sử dụng chương trình khuyến mại: nhắn tin dự đoán tỉ số bàn thắng để nhận vé xem Bóng đá

---
### Khả năng sáng tạo là vô bờ
Lang thang các blog, tình cờ thấy được
App nhắc ngày thắp hương hàng tháng vào ngày 1 và ngày rằm
https://www.facebook.com/thaphuonghangthang/


### Nhà mặt đất hay chung cư
### Oracle thông báo về trạng thái các TABLESPACE
### Oracle thông báo về các Procedure, PACKAGE được sửa trong ngày

SELECT owner,
         object_name,
         object_type,
         last_ddl_time,
         status
    FROM dba_objects
   WHERE     object_name IN
                (SELECT A.REFERENCED_NAME
                   FROM DBA_DEPENDENCIES a
                  WHERE object_type IN ('PROCEDURE', 'PACKAGE BODY', 'PACKAGE'))
         AND last_ddl_time >= TRUNC(SYSDATE - 1)
ORDER BY last_ddl_time DESC; 


### Oracle chuyển hàng thành cột dữ liệu
Trong việc làm báo cáo ta thường xuyên gặp các tình huống thống kê từ raw data phải chuyển dữ liệu từ hàng sang cột. Ta có thể sử dụng Excel để xử lý nhưng từ Oracle 10i thì có hỗ trợ câu lệnh PIVOT để xử lý.
Ta có thể test thử hàm này với giả dữ liệu như sau:
+ Chuẩn bị bảng và data:
----create table
CREATE TABLE vn_temp_test_pivote (
         C_MONTH    VARCHAR2(15) NULL,
         C_CORIG       VARCHAR2(15) NULL,
         C_VOLUME     NUMBER(5) NULL);

----test data
insert into vn_temp_test_pivote 
values('201801','A',123);
insert into vn_temp_test_pivote 
values('201801','B',121);
insert into vn_temp_test_pivote 

values('201801','C',122);
insert into vn_temp_test_pivote 
values('201802','A',1);
insert into vn_temp_test_pivote 
values('201802','B',2);
insert into vn_temp_test_pivote 
values('201802','C',3);

insert into vn_temp_test_pivote 
values('201803','A',10);
insert into vn_temp_test_pivote 
values('201803','B',20);
insert into vn_temp_test_pivote 
values('201803','C',30);

Đây ví dụ ta có số lượng view(C_VOLUME) của từng C_CORIG trong từng tháng(C_MONTH).
Dữ liệu được trình bày:
C_MONTH C_CORIG C_VOLUME
201801	A	123
201801	B	121
201801	C	122
201802	A	1
201802	B	2
201802	C	3
201803	A	10
201803	B	20
201803	C	30

+ Ta cần nhìn xem số lượng view của các tháng theo từng loại C_CORIG, ta sử dụng hàm PIVOTE như sau:
SELECT *
 FROM vn_temp_test_pivote PIVOT (SUM(C_volume)
                  FOR C_MONTH
                  IN ('201801' AS p_201801,
                      '201802' AS p_201802,
                      '201803' AS p_201803));
C_CORIG p_201801 p_201802 p_201803
A	123	1	10
B   121	2	20
C	122	3	30	  
+ Như ta thấy ở ví dụ trên, nhược điểm của PIVOTE là ta phải liệt kê từng dữ liệu của cột cần chuyển sang hàng, nhưng ta có thể lấy tự động các tháng phát sinh không?
Oracle có hỗ trợ việc này nhưng PIVOTE chỉ có thể hiển thị data nằm trong XML:

SELECT *
  FROM vn_temp_test_pivote PIVOT XML (SUM (C_VOLUME)
                  FOR C_MONTH
                  IN (SELECT DISTINCT C_MONTH FROM vn_temp_test_pivote));

C_CORIG XML
A	<XML>
B   <XML>
C	<XML>
				  
Để lấy dữ liệu ra để trình bày ta phải đọc chuỗi XML theo khuôn dạng để trình bày ra.

SELECT C_CORIG,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[1]/column[2]') p1,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[2]/column[2]') p2,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[3]/column[2]') p3,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[4]/column[2]') p4,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[5]/column[2]') p5,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[6]/column[2]') p6,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[7]/column[2]') p7,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[8]/column[2]') p8,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[9]/column[2]') p9,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[10]/column[2]') p10,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[11]/column[2]') p11,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[12]/column[2]') p12,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[13]/column[2]') p13,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[14]/column[2]') p14,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[15]/column[2]') p15,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[16]/column[2]') p16,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[17]/column[2]') p17,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[18]/column[2]') p18,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[19]/column[2]') p19,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[20]/column[2]') p20,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[21]/column[2]') p21,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[22]/column[2]') p22,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[23]/column[2]') p23,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[24]/column[2]') p24,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[25]/column[2]') p25,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[26]/column[2]') p26,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[27]/column[2]') p27,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[28]/column[2]') p28,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[29]/column[2]') p29,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[30]/column[2]') p30
  FROM (
SELECT *
  FROM vn_temp_test_pivote PIVOT XML (SUM (C_VOLUME)
                  FOR C_MONTH
                  IN (SELECT DISTINCT C_MONTH FROM vn_temp_test_pivote))
                 
)				  ;
Kết quả:

C_CORIG p1 p2 p3 p4 p5 p6...
A	123	1	10 null null
B   121	2	20 null null
C	122	3	30 null null


Phần này ta có thể liệt kê dài ra hoặc có thể check trước sau đó gen câu lệnh rồi ghép vào với nhau nếu muốn đẹp.
Được như thế này rồi nhưng ta vẫn chỉ là định nghĩa cột khi viết thôi, để map lại cột tự động(p1,p2...) với data(201801,201802...) ta sử dụng lấy dữ liệu ở cột 1 và chỉ lấy 1 dòng (vì tất cả các dòng là như nhau) sau đó UNION ALL lại là được:


SELECT '1_Code Origin' Code_Origin,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[1]/column[1]') A1,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[2]/column[1]') A2,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[3]/column[1]') A3,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[4]/column[1]') A4,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[5]/column[1]') A5,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[6]/column[1]') A6,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[7]/column[1]') A7,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[8]/column[1]') A8,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[9]/column[1]') A9,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[10]/column[1]') A10,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[11]/column[1]') A11,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[12]/column[1]') A12,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[13]/column[1]') A13,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[14]/column[1]') A14,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[15]/column[1]') A15,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[16]/column[1]') A16,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[17]/column[1]') A17,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[18]/column[1]') A18,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[19]/column[1]') A19,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[20]/column[1]') A20,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[21]/column[1]') A21,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[22]/column[1]') A22,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[23]/column[1]') A23,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[24]/column[1]') A24,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[25]/column[1]') A25,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[26]/column[1]') A26,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[27]/column[1]') A27,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[28]/column[1]') A28,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[29]/column[1]') A29,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[30]/column[1]') A30
  FROM (
SELECT *
  FROM vn_temp_test_pivote PIVOT XML (SUM (C_VOLUME)
                  FOR C_MONTH
                  IN (SELECT DISTINCT C_MONTH FROM vn_temp_test_pivote))
                 
) where rownum=1
UNION
SELECT C_CORIG,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[1]/column[2]') p1,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[2]/column[2]') p2,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[3]/column[2]') p3,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[4]/column[2]') p4,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[5]/column[2]') p5,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[6]/column[2]') p6,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[7]/column[2]') p7,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[8]/column[2]') p8,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[9]/column[2]') p9,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[10]/column[2]') p10,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[11]/column[2]') p11,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[12]/column[2]') p12,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[13]/column[2]') p13,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[14]/column[2]') p14,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[15]/column[2]') p15,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[16]/column[2]') p16,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[17]/column[2]') p17,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[18]/column[2]') p18,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[19]/column[2]') p19,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[20]/column[2]') p20,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[21]/column[2]') p21,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[22]/column[2]') p22,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[23]/column[2]') p23,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[24]/column[2]') p24,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[25]/column[2]') p25,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[26]/column[2]') p26,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[27]/column[2]') p27,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[28]/column[2]') p28,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[29]/column[2]') p29,
       EXTRACTVALUE (C_MONTH_XML, '/PivotSet/item[30]/column[2]') p30
  FROM (
SELECT *
  FROM vn_temp_test_pivote PIVOT XML (SUM (C_VOLUME)
                  FOR C_MONTH
                  IN (SELECT DISTINCT C_MONTH FROM vn_temp_test_pivote))
                 
);

Kết quả:
C_CORIG p1 p2 p3 p4 p5 p6...
C_CORIG 201801 201802 201803...
A	123	1	10 null null
B   121	2	20 null null
C	122	3	30 null null



----Viết về một số thứ hay ho về cộng đồng
+ Xã hội chủ nghĩa
----Suy nghĩ về người giàu người nghèo

[Quay lại trang chủ](https://phamkhactuy.github.io/tuypk.github.io/index.html)

Thanks for your help!
Do you know the cause of  this issue ?
make it yours: biến nó thành của bạn
dreams come true: giấc mơ trở thành sự thật
Free of change: Miễn phí

------------
DROP DATABASE LINK DBL_APEXDEV2;

CREATE DATABASE LINK DBL_APEXDEV
 CONNECT TO INTRANET
 IDENTIFIED BY 'intranet'
 USING 'APEX_DEV2';
