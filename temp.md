[Quay lại trang chủ](https://phamkhactuy.github.io/tuypk.github.io/index.html)

## Tôi đã tự động hóa việc đưa commit và push code lên như thế nào
# Bài toán
Ở công ty nơi tôi làm việc quy định mọi người thường xuyên phải đẩy (push) code lên hàng trên Gitlab, tuy nhiên việc này tôi thường quên, nói đúng hơn là lười.
=> Ý tưởng sẽ làm tự động hóa việc này cho nó tự động thay vì việc mình phải làm bằng tay.
# Đề xuất giải pháp
 Ta sẽ tạo một job tự động commit và push lên theo một chu kỳ thời gian nhất định nào đó.
 Hệ điều hành tôi đang sử dụng là window nên sẽ không tạo được kiểu crontab được mà sẽ phải làm theo 2 bước:
 B1: Tạo một file shell script .Bat chứa tập các tác vụ mình muốn thực hiện (dùng notepad)
 Đây là quy trình của tôi muốn job thực hiện như sau: Pull code mới nhất về -> Add toàn bộ file cần đưa lên -> Commit lên -> Push toàn bộ
 Nội dung file mà tôi sử dụng:

:: Di chuyển đến thư mục chứa code của chúng ta
cd "C:\Users\GITCODE" 
:: Set các giá trị về file git exe và nhánh cần làm việc
set GIT_PATH="C:\Program Files\Git\bin\git.exe"
set BRANCH = "origin"
:: Tiến hành pull toàn bộ code về
%GIT_PATH% pull %BRANCH%
:: Tiến hành add toàn bộ file thay đổi
%GIT_PATH% add -A
:: Commit lên
%GIT_PATH% commit -am "Auto-committed on %date%"
:: Push lên
%GIT_PATH% push %BRANCH%


 B2: Sử dụng Scheduler của windown để job thực hiện gọi đến cái file .bat ta vừa tạo ở trên
 Phần này các bạn chủ động google nhé, đã nhiều người hướng dẫn chi tiết lắm rồi. Mình thì đặt thời gian hàng ngày buổi sáng là 9h chạy khi mới công ty, đầu giờ chiều chạy một nháy lúc 13h và 17h trước khi về chạy nốt.
 Hoặc bạn có thể cho chạy mỗi tiếng 1 lần

# Hướng phát triển
Đây mới chỉ là sơ khai, việc tự động và nó thông minh hơn thì ta cần phải thêm các điều kiện hoặc ràng buộc hơn nữa:
- Buổi sáng đến thì ta luôn phải check code mới nhất về của các đồng nghiệp khác
- Tất nhiên lúc nào cần thiết thì ta vẫn thực hiện các thao tác này bằng câu lệnh bình thường
- Đưa ra black list các file hoặc thư mục không được phép đưa lên
- Gửi email nếu có lỗi trong quá trình pull về
- Ta có thể gắn một số cờ đặt biệt để khi có nó thì hệ thống mới tự động
- Kiểm tra code không lỗi thì mới tiến hành đưa code lên (cái này phải nghiên cứu cái CI)
-...

# Việc này giúp ta được những gì
- Tự động hóa các việc nhàm chán hàng ngày ta vẫn phải làm đi làm lại
- Việc đưa code liên tục lên sẽ giúp người quản lý nắm bắt được -> mặc dù ta vẫn lười cơ mà
- An toàn khi có điều gì đó xảy ra với code của ta như lỡ tay xóa đi chẳng hạn. :D


[Quay lại trang chủ](https://phamkhactuy.github.io/tuypk.github.io/index.html)
