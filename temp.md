[Quay lại trang chủ](https://phamkhactuy.github.io/tuypk.github.io/index.html)

Cài đặt ChatterBot trên Windown 10

ChatterBot là gì?
ChatterBot là một công cụ tạo ra một chat bot tự động dựa trên cơ sở học máy (machine learning) bằng ngôn ngữ Python. ChatterBot chính là một freamwork cho ChatAI (Chatbot AI) để tạo ra những con bot thông minh để bạn có thể tích hợp vào những công cụ chat như Facebook, Skype hoặc chính là là những nền tảng chat do các bạn tự tạo ra. ChatterBot được thiết kế dựa trên Python là một ngôn ngữ xử lý ngôn ngữ hàng đầu cho phép ChatterBot có để đào tạo bất kỳ ngôn ngữ nào. Kể cả ngôn ngữ Tiếng Việt.
Đặc biệt do ChatterBot là dự án mã nguồn mở nên bạn hoàn toàn của thể nghiên cứu phát triển và kiểm soát được toàn bộ mã nguồn cũng như cơ sở dữ liệu. Điều này làm bảo mật toàn bộ thông tin con bot mà bạn phát triển không phải phụ thuộc vào bất kỳ nền tảng do một bên thứ 3 nào như Wit.AI....

Bạn có thể tham khảo dự án tại Github: https://github.com/gunthercox/ChatterBot
Tài liệu cho ChatterBot: https://chatterbot.readthedocs.io/en/stable/index.html

Cài đặt ChatterBot trên Windown 10

B1: Đầu tiên bạn cần cài đặt git trước để có thể dễ dàng tải mã nguồn và cập nhật mã nguồn từ ChatterBot. (Cái này các bạn tự google nhé, mình đang sử dụng: Git-2.16.2-64-bit)
Sau khi cài đặt xong bạn có thể kiểm tra version git, như ảnh sau là ok:
[ChatterBot01]
B2: Vì ChatterBot được code bằng Python nên để phát triển bạn bắt buộc phải cài Python, hiện tại tôi đang sử dụng Python 2.7, hiện tại ChatterBot cũng đang khuyến cáo nên sử dụng phiên bản này.
Cái này các bạn cũng tự tìm về cài nhé, cứ mặc định mà cài, đây là kết quả check sau khi đã cài xong:
[ChatterBot02]
B3: Khi cài Python thì mặc định đã được tích hợp sẵn công cụ pip để tiến hành build ChatterBot
[ChatterBit03]
B4: Clone bản ChatterBot mới nhất từ mã nguồn trên Github: https://github.com/gunthercox/ChatterBot.git
Ta tạo một thư mục mới (ở bất kỳ chỗ nào cũng được) để chứa mã nguồn.
Sau đó di chuyển command line đến thư mục này (hoặc mở thư mục này ra, nhấn Shift + chuột phải chọn: Open command windown here)
Dùng lệnh: clone https://github.com/gunthercox/ChatterBot.git để tải mã nguồn về.
Chờ một lát ta sẽ có kết quả :
[ChatterBit04]
B5: Tiến hành build và cài đặt ChatterBot sử dụng lệnh: pip install ./ChatterBot
Chờ đợi một lát để pip lấy thêm các thư viện cần thiết và cài đặt. Kết quả:
[ChatterBit05]
B6: Xong, ta đã cài đặt thành công ChatterBot trên windown 10, ta có thể kiểm tra phiên bản hiện tại ta vừa cài đặt bằng lệnh: python -m chatterbot --version
[ChatterBit06]

Đến bước này là ta đã hoàn thành việc cài đặt ChatterBot, bài tiếp theo ta có thể tạo thử một con bot để cho nó học và thử hỏi nó.






#Bài toán
Ở công ty nơi tôi làm việc quy định mọi người thường xuyên phải đẩy (push) code hàng ngày trên Gitlab, tuy nhiên việc này tôi thường quên, nói đúng hơn là lười.
=> Ý tưởng sẽ làm tự động hóa việc này cho nó tự động thay vì việc mình phải làm bằng tay.

 #Đề xuất giải pháp
Ta sẽ tạo một job tự động commit và push lên theo một chu kỳ thời gian nhất định nào đó.
Hệ điều hành tôi đang sử dụng là window nên sẽ không tạo được kiểu crontab được mà sẽ phải làm theo 2 bước:
**B1:** Tạo một file *shell script .Bat* chứa tập các tác vụ mình muốn thực hiện (dùng notepad)
Đây là quy trình của tôi muốn job thực hiện như sau: **Pull code mới nhất về -> Add toàn bộ file cần đưa lên -> Commit lên -> Push toàn bộ**
Nội dung file mà tôi sử dụng:

```auto_commit.bat
:: Di chuyển đến thư mục chứa code của chúng ta
cd “C:\Users\GITCODE” 
:: Set các giá trị về file git exe và nhánh cần làm việc
set GIT_PATH=”C:\Program Files\Git\bin\git.exe”
set BRANCH = “origin”
:: Tiến hành pull toàn bộ code về
%GIT_PATH% pull %BRANCH%
:: Tiến hành add toàn bộ file thay đổi
%GIT_PATH% add -A
:: Commit lên
%GIT_PATH% commit -am “Auto-committed on %date%”
:: Push lên
%GIT_PATH% push %BRANCH%
```

**B2:** Sử dụng Scheduler của windown để job thực hiện gọi đến cái file .bat ta vừa tạo ở trên
Phần này các bạn chủ động google nhé, đã nhiều người hướng dẫn chi tiết lắm rồi. Mình thì đặt thời gian hàng ngày buổi sáng là 9h chạy khi mới công ty, đầu giờ chiều chạy một nháy lúc 13h và 17h trước khi về chạy nốt. Hoặc bạn có thể cho chạy mỗi tiếng 1 lần

#Hướng phát triển
Đây mới chỉ là sơ khai, việc tự động và nó thông minh hơn thì ta cần phải thêm các điều kiện hoặc ràng buộc hơn nữa:
Buổi sáng đến thì ta luôn phải check code mới nhất về của các đồng nghiệp khác
Tất nhiên lúc nào cần thiết thì ta vẫn thực hiện các thao tác này bằng câu lệnh bình thường
Đưa ra black list các file hoặc thư mục không được phép đưa lên
Gửi email nếu có lỗi trong quá trình pull về
Ta có thể gắn một số cờ đặt biệt để khi có nó thì hệ thống mới tự động
Kiểm tra code không lỗi thì mới tiến hành đưa code lên (cái này phải nghiên cứu cái CI)
…

#Việc này giúp ta được những gì
Tự động hóa các việc nhàm chán hàng ngày ta vẫn phải làm đi làm lại
Việc đưa code liên tục lên sẽ giúp người quản lý nắm bắt được -> mặc dù ta vẫn lười cơ mà
An toàn khi có điều gì đó xảy ra với code của ta như lỡ tay xóa đi chẳng hạn. 😀

Bài này được dẫn trực tiếp từ blog của tôi: [Link](http://tukyonline.com/posts/2018/03/15/tu-dong-hoa-viec-commit-va-push-code-len-server/)

[Quay lại trang chủ](https://phamkhactuy.github.io/tuypk.github.io/index.html)


