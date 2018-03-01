## Note file
[Quay lại trang chủ](https://phamkhactuy.github.io/tuypk.github.io/index.html)

[Hello](https://phamkhactuy.github.io/tuypk.github.io/hello.html)

[Temp](https://phamkhactuy.github.io/tuypk.github.io/temp.html)



### Tải các chương trình cài đặt không được

Chuyển sang công ty mới cũng lắm nhiêu khê, ngay công tác cài đặt máy móc thì mình hoàn toàn không phải táy máy gì cả. Có đội kỹ thuật làm hết.
* Toàn bộ hệ thống đã đều được join domain và đăng nhập hoàn thoàn thông qua email.
* Có thư mục share nhiều phần mềm cần thiết (tất nhiên là không đủ)
* Riêng với tài khoản của mới của mình, để tải thêm 1 số phần mềm có đuôi trực tiếp là exe thì đều bị block và không không cho tải xuống.
* Việc cài đặt phần mềm với tài khoản không được, phải yêu cầu tới admin cho phép hoặc phải được set tài khoản có quyền admin thì mới cài đặt được
* Do nhu cầu chạy Pentaho nên phải có jdk 8, có 2 phương án:
- Tải jdk8 trực tiếp về để cài đặt:
Lấy từ trang chủ Oracle nhưng bị chặn, đi tìm file đã được nén trên mạng thì không thấy có. Tình cờ vào được trang này: http://jdk.java.net/8/  thì tải được về và chạy OK (chuối cái là file exe trên oracle bị chặn nhưng file exe ở đây thì không bị chặn)
- Tải netbean về cài để có jdk được tích hợp sẵn trong đó
Đã thử và đã bị chặn không thể tài được, tìm ngược xuôi bộ cài netbean đã được nén thì không thấy có.

=> Bài học kinh nghiệm: chịu khó tìm phương án giải quyết.

### Lỗi kết nối từ client tới DB Oracle
Để tiến hành chạy được Pentaho 7.1 yêu cầu phải có JDK 8 trở lên nhưng hiện máy mình chỉ có JDK 7 nên phải hì hục đi cài JDK 8, cũng lắm nhiêu khê do mạng công ty lại chặn việc tải các phần mềm JDK và Netbean về.

Qua việc vận lộn với việc cài đặt để có thể sử dụng Pentaho trên win 10, có nhiều phương án nhưng đều không OK, cách tốt nhất để chạy được thì với win 10 64bit thì ta cài JDK8 64bit là OK thôi.

OK, quay lại việc chính, do hôm trước vận lộn mình đã cài đặt và thiết lập lại biến môi trường bị sai, hôm sau khi cần log vào DB để nghiên cứu query thì không tài nào vào được. 
- Đối với SQLPLUS thì khi login bị báo lỗi 12154, lỗi này được thông báo do việc cài đặt và thiết lập biến môi trường bị lỗi.
- Đối với DBFORGE thì ứng dụng bị stop luôn :(

Để giải quyết vấn đề ta chỉ đơn giản là thiết lập lại biến môi trường ORACLE_HOME đúng đường dẫn là được: ORACLE_HOME=C:\app\Administrator\product\11.2.0\client_1   (Logout và login lại windown).

=> Bài học: Ban đầu suy nghĩ hay là do DB nhưng không phải, ta cần cẩn thận khi tiến hành cài đặt hay sửa đổi các biến môi trường, thư mục... vì có thể ảnh hưởng tới các phần mềm khác, luôn trong trạng thái lỗi là do mình do client chứ k phải lỗi từ Server.

### Cải tiến công việc

- Làm tools để thao tác các công việc phát sinh update trực tiếp vào DB mà thường xuyên phải làm
- Sử dụng pentaho quản lý các công việc như trích xuất data

You can use the [editor on GitHub](https://github.com/phamkhactuy/tuypk.github.io/edit/master/index.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/phamkhactuy/tuypk.github.io/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://help.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.
