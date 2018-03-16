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



ChatterBot là một công cụ tạo hộp thoại thảo luận dựa trên cơ sở máy học được xây dựng bằng Python làm cho nó có thể tạo ra các phản hồi dựa trên các tập hợp các cuộc trò chuyện đã biết. Ngôn ngữ thiết kế độc lập của ChatterBot cho phép nó được đào tạo để nói bất kỳ ngôn ngữ.


[Quay lại trang chủ](https://phamkhactuy.github.io/tuypk.github.io/index.html)


