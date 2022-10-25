CREATE DATABASE SQL_NHOM_8
GO

USE SQL_NHOM_8
GO

-- -------------------------bảng Users-------------------------------
CREATE TABLE Users (
  id_users INT NOT NULL PRIMARY KEY,
  tenkhachhang NVARCHAR(200) NOT NULL,
  email NVARCHAR(100) NOT NULL,
  diachi NVARCHAR(200) NOT NULL,
  matkhau VARCHAR(100) NOT NULL,
  dienthoai VARCHAR(20) NOT NULL
)
GO

-- --------------------------bảng Cart------------------------------
CREATE TABLE Cart (
  id_cart INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
  id_sanpham INT NOT NULL,
  tensanpham NVARCHAR(255) NOT NULL,
  masp VARCHAR(10) NOT NULL,
  giasp VARCHAR(50) NOT NULL,
  soluong INT NOT NULL,
  hinhanh NVARCHAR(255) NOT NULL,
  tomtat NTEXT NOT NULL,
  tinhtrang INT NOT NULL,
  id_danhmuc INT NOT NULL,
  tongtien INT
)
GO

-- -------------------------bảng DanhMuc-------------------------------
CREATE TABLE DanhMuc (
  id_danhmuc INT NOT NULL PRIMARY KEY,
  tendanhmuc NVARCHAR(100) NOT NULL
)
GO
-- --------------------------bảng SanPham------------------------------
CREATE TABLE SanPham (
  id_sanpham INT NOT NULL PRIMARY KEY,
  tensanpham NVARCHAR(255) NOT NULL,
  masp VARCHAR(10) NOT NULL,
  giasp VARCHAR(50) NOT NULL,
  soluong INT NOT NULL,
  hinhanh NVARCHAR(255) NOT NULL,
  tomtat NTEXT NOT NULL,
  tinhtrang INT NOT NULL,
  id_danhmuc INT NOT NULL,
  CONSTRAINT PC_id_danhmuc FOREIGN KEY(id_danhmuc)
	REFERENCES DanhMuc(id_danhmuc)
)
GO
    
--------------------------bảng đơn hàng -----------------------------
CREATE TABLE Orders (
id_order INT NOT NULL PRIMARY KEY,
tenkhachhang NVARCHAR(200)  ,
dienthoai VARCHAR(20) ,
diachi NVARCHAR(200) ,
tensanpham NVARCHAR(255),
soluongmua INT ,
trangthai NVARCHAR (20) ,
giasp VARCHAR(50),
hinhanh NVARCHAR(255),
tongtien INT,
phuongthucthanhtoan NVARCHAR(255)
 )
GO

--------------------------bảng trang chủ-----------------------------
CREATE TABLE TrangChu (
id_trangchu INT NOT NULL PRIMARY KEY,
tensanpham NVARCHAR(255) NOT NULL,
masp VARCHAR(10) NOT NULL,
giasp VARCHAR(50) NOT NULL,
soluong INT NOT NULL,
hinhanh NVARCHAR(255) NOT NULL,
tomtat NTEXT NOT NULL,
tinhtrang INT NOT NULL
)
GO

----------------------------CHÈN DL------------------------------

INSERT INTO Users (id_users, tenkhachhang, email, diachi, matkhau, dienthoai) 
VALUES(1, N'Trần Thị Thảo Nguyên', 'thaonguyen@gmail.com', N'Quảng Nam', '123', '0394756284')
INSERT INTO Users (id_users, tenkhachhang, email, diachi, matkhau, dienthoai) 
VALUES(2, N'Phạm Thị Như Thủy', 'thuypham@gmail.com', N'Quảng Nam', '1234', '0339475274')
INSERT INTO Users (id_users, tenkhachhang, email, diachi, matkhau, dienthoai) 
VALUES(3, N'Biền Xuân Thắng', 'Xuanthang73qt@gmail.com', N'Đà Nẵng', '12345', '0912545138')
INSERT INTO Users (id_users, tenkhachhang, email, diachi, matkhau, dienthoai) 
VALUES(4, N'Doãn Văn Nam', 'doannam@gmail.com', N'Đà Nẵng', '123456', '0374839463')
INSERT INTO Users (id_users, tenkhachhang, email, diachi, matkhau, dienthoai) 
VALUES(5, N'Nguyễn Thị Hoàng Anh', 'hoanganh@gmail.com', N'Quảng Trị', '1234567', '0352946385')
SELECT * FROM Users

INSERT INTO DanhMuc (id_danhmuc, tendanhmuc) 
VALUES(1, N'Phụ kiện trang trí điện thoại')
INSERT INTO DanhMuc (id_danhmuc, tendanhmuc) 
VALUES(2, N'Kính cường lực')
INSERT INTO DanhMuc (id_danhmuc, tendanhmuc) 
VALUES(3, N'Màn hình điện thoại')
INSERT INTO DanhMuc (id_danhmuc, tendanhmuc) 
VALUES(4, N'Ốp lưng')
INSERT INTO DanhMuc (id_danhmuc, tendanhmuc) 
VALUES(5, N'Tai nghe')
INSERT INTO DanhMuc(id_danhmuc, tendanhmuc)
VALUES(6, N'Sạc điện thoại')
INSERT INTO DanhMuc(id_danhmuc, tendanhmuc)
VALUES(7, N'Túi đựng điện thoại chống nước')
INSERT INTO DanhMuc(id_danhmuc, tendanhmuc)
VALUES(8, N'Pin điện thoại')
SELECT * FROM DanhMuc

INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(1, N'Phụ kiện trang trí thủ công', '001', '69000', 20, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQAELyCwkcpP_D13-15-_RYZRLUQu2lQ4CSrQtVPc1_rxruCSB33Sy12r5s4xB-pLWJ930DWYwRa-85sa_RE7p0z_eLsibBZpgpYnGjVSE&usqp=CAc.jpg', N'Chất liệu: nhựa resin thân thiện với môi trường, không độc hại, nhẹ và mịn, bền và chắc chắn
Tự làm bất kỳ đồ thủ công DIY nào như kẹp tóc, dây buộc tóc, điện thoại di động, hộp văn phòng phẩm, khung ảnh.
Các hạt có nhiều hình dạng, màu sắc và phần phẳng tinh tế, phù hợp với đồ thủ công của bạn, chẳng hạn như kẹp tóc, móc chìa khóa, v.v.
Sử dụng phụ kiện làm những mặt dây chuyền này để chơi với con bạn và tạo ra những món đồ thủ công yêu thích. Những hạt này là một món quà tuyệt vời cho bạn bè hoặc gia đình.', 10, 1)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(2, N'Tai nghe Bluetooth không dây Airpods chính hãng ', '001', '499000', 10, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSSkYiGhHmPpTGUbIM2Uy0-kkz_heHWuCRIpoV2Lu-mNTt-nqL87nANa-_at8oFUrRVqfwb4DWs-X0&usqp=CAc.jpg', N'Tai nghe Bluetooth AirPods Wireless là dòng tai nghe với hình thức thiết kế tương tu tai nghe EarPods, điểm khác biệt đó là tai nghe AirPods đã loại bỏ Jack cắm 3.5 mm, trở thành dòng tai nghe không dây kết nối bluetooth, mang lại sự tiện lợi cho người dùng', 7, 5)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(3, N'Kính cường lực Oppo A3s Full 5D ', '001', '50000', 10, 'https://p-vn.ipricegroup.com/247307e0d16e337337db6004475f30b45b755253_0.jpg?position=5.jpg', N'Kính cải tiến hẳn so với các dòng kính cũ  (mẫu đang sốt trên thị trường)
Miếng dán kính full màn hình với mặt dán hoàn toàn là kính chịu lực, độ sáng và bóng y làm cho điện thoại bạn đã xịn nay càng xịn hơn!
Kính dán lên giống hệt như màn hình máy, ko có mép, ko nhìn thấy viền mép dán.
Đặc biệt: Siêu phẩm có độ cứng gấp 3 lần so với kính full cũ đang bán ngoài thị trường, khắc phục tình trạng mẻ viền, mẻ góc .
', 8, 2)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(4, N'Tai nghe Sony WI-C400', '002', '350000', 3, 'https://p-vn.ipricegroup.com/uploaded_b7132b5655bb6dfaacc6f6053baaf940.jpg?position=5.jpg', N'Khả năng kết nối BLUETOOTH® dễ dàng với NFC một chạm
Thời gian sử dụng pin lên đến 20 giờ
Màng loa neodymium 9 mm mang đến âm thanh sống động
Kiểu tai nghe sau cổ tiện lợi, thoải mái với hệ thống thu gọn cáp
Rung để thông báo cuộc gọi đến', 1, 5)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(5, N'Phụ kiện trang trí', '002', '59000', 10, 'https://ae01.alicdn.com/kf/HTB1.yORSXzqK1RjSZFvq6AB7VXaT/T-L-m-p-i-n-Tho-i-Ph-Ki-n-Trang-Tr-Kim-C-ng.jpg_q50.jpg', N'Vật liệu hỗn hợp',4, 1)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(6, N'Ốp lưng Oppo A5s', '001', '25000', 3, 'https://cdn.tgdd.vn/Products/Images/60/206022/op-lung-oppo-a5s-deo-solid-ii-jm-19e069-meo-ngo-1-600x600.jpg', N'Kiểu dáng thời trang và đẹp mắt
Thiết kế vừa vặn và ôm sát thân máy
Dễ dàng tháo/lắp ốp vào máy',1, 4)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(7, N'Dây ngọc bội hoa sen', '003', '99000', 30, 'https://cf.shopee.vn/file/922ad6a50bfbe31dd4b9df1601eecb77', N'Kích thước nhỏ gọn, yêu, đường nét tinh tế.
 Kết hợp với ngọc bội hoa sen là tua rua 2 màu xanh, đỏ', 0, 1)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(8, N'Màn hình iphone', '001', '700000', 15, 'https://fonesmart.com.vn/images/repairs/2019/07/04/resized/thay-kinh-iphone-xi_1562206706.png', N'Gồm 3 lớp chính là : Mặt kính, cảm ứng và phần LCD hiển thị. Hiện tại với màn hình iPhone 11 Pro Max ta có thể thay thế mặt kính hoặc mặt kính cảm ứng.', 10, 3)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(9, N'Màn hình Samsung Galaxy A30s', '002', '550000', 12, 'https://dienthoaivui.com.vn/wp-content/uploads/2019/11/a30.png', N'Màn hình Galaxy A30 chính hãng được thay tại shop cam kết hàng chính hãng thương hiệu Samsung 100%, được nhập trực tiếp tại hãng Samsung đã qua kiểm định về chất lượng màn hình', 5, 3)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(10, N'Màn hình Oppo F17', '003', '450000', 20, 'https://fonesmart.com.vn/images/repairs/2020/11/19/original/thay-man-hinh-oppo-f17-pro-chinh-hang_1605755777.png', N'Linh kiện màn hình Oppo F17, F17 Pro được nhập khẩu chính hãng',11, 3)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(11, N'Tai nghe có dây M60', '003', '100000', 25, 'https://salt.tikicdn.com/ts/product/fd/a6/0d/b4f42317bc57dfb8063d9ec1fa40d532.PNG', N'M60 Tai nghe phổ âm hoàn hảo với mic cáp TPE đàn hồi cao Tai nghe có dây 1,2m với mic thiết kế nhẹ trong tai thân thiện với người dùng 1. Loa: 10 mm. 2. Chiều dài đường dây: 1,2m, trọng lượng: 13g. 3. Cắm âm thanh: Ø3,5mm. 4. Cáp tai nghe: Dây bện cao TPE với dây tráng men. 5. Micrô: bộ điều khiển có mic. 6. Điều khiển dây: hoạt động một nút chức năng, được điều chỉnh để kiểm soát Apple và Android. Tặng kèm 3 Dây Bọc Cáp Sạc, bọc Dây Tai Nghe Lò Xo',14, 5)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(12, N'Tai nghe Airpods', '004', '1500000', 22, 'https://cdn.tgdd.vn/Products/Images/54/236025/airpods-2-wireless-charge-apple-mrxj2-ava-600x600.jpg', N'Đặc điểm nổi bật
Thiết kế đơn giản, thời trang và nhỏ gọn.
Trang bị chip H1 hoàn toàn mới, cho tốc độ kết nối, chuyển đổi giữa các thiết bị nhanh chóng.
Kích hoạt nhanh trợ lý ảo Siri bằng cách nói "Hey, Siri".
Có thể sử dụng nghe nhạc lên đến 5 giờ (âm lượng 50%) cho mỗi một lần sạc đầy.
Tích hợp công nghệ sạc nhanh hiện đại. Sạc nhanh 15 phút có thể nghe nhạc 3 giờ (âm lượng 50%).
Hỗ trợ sạc không dây chuẩn Qi tiện lợi.
Sử dụng song song với hộp sạc có thể dùng được lên đến 24 giờ.
Tính năng nhận cuộc gọi, kích hoạt Siri, nghe hoặc tạm dừng đoạn nhạc đang phát.
Sản phẩm chính hãng Apple, nguyên seal 100%.', 5, 5)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(13, N'Ốp lưng iphone 12 Pro Max', '002', '55000', 22, 'https://cdn.tgdd.vn/Products/Images/60/237539/op-lung-iphone-12-pro-max-da-apple-mhkm3-den-ava-600x600.jpg', N'Đặc điểm nổi bật
Vỏ ốp lưng phủ sắc đen thanh lịch, thiết kế ôm sát iPhone 12 Pro Max.
Làm từ da thuộc mềm nhẹ, bền đẹp, cầm nắm dễ chịu. 
Các chi tiết được làm tinh xảo, bảo vệ tốt điện thoại, hạn chế trầy xước.
Có nam châm tích hợp cố định tiếp xúc giữa ốp và phần lưng điện thoại, sạc không dây dễ dàng.
Ốp lưng chính hãng Apple 100%.', 12, 4)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(14, N'Ốp lưng Samsung A2 LTE', '003', '40000', 16, 'https://cdn.tgdd.vn/Products/Images/60/243078/op-lung-galaxy-a22-lte-deo-soft-clear-samsung-1-600x600.jpg', N'Đặc điểm nổi bật
Kiểu dáng gọn nhẹ, thiết kế trong suốt mọi mặt góp phần làm tăng nét sang trọng cho Galaxy A22.
Được sản xuất hoàn thiện đến từng chi tiết nhỏ, camera, cổng sạc, nút bấm trải nghiệm thoải mái.
Đảm bảo an toàn cho mặt lưng và cạnh hông nhờ thiết kế ôm sát, vừa khít.
Vật liệu nhựa dẻo cho bề mặt mịn màng, chịu lực tác động tốt, tháo rời và lắp vào máy đơn giản.', 0, 4)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(15, N'Kính cường lực iphone 11 Pro Max', '002', '90000', 30, 'https://shopmrhi.com/uploads/source/danmanhinh/gor/11/ava.png', N'Nhận dạng khuôn mặt : cho phép nhận dạng khuôn mặt liền mạch và đảm bảo chất lượng nhanh và nhạy. Độ dày chỉ 0,2mm, bộ bảo vệ màn hình này duy trì độ nhạy cảm ứng cao .
Kính cường lực bảo vệ gấp 3 lần : Với 6 giờ nung trong nhiệt độ cao, Kính bảo vệ Kính cường lực GOR bảo vệ mạnh mẽ chống lại các vết nứt, và bền hơn nhiều so với các Kính bảo vệ Kính cường lực thông thường khác. Công nghệ chống vỡ tốt hơn để bảo vệ màn hình hiệu quả hơn.
Chống trầy xước: Kính cường lực cao cấp bảo vệ màn hình của bạn khỏi các vết trầy xước không mong muốn bởi các hạt bụi hoặc vật cứng khác do xếp hạng độ cứng 9H, chống lại các thiệt hại do rơi và bảo vệ màn hình một cách hiệu quả.
Chống vân tay: Lớp phobic oleo mạ nano tăng cường có thể ngăn ngừa hiệu quả dư lượng dấu vân tay trong một thời gian dài. Cảm giác bề mặt mịn màng và không thấm nước với đặc tính kỵ khí oleo tốt, những giọt nước có thể dễ dàng lau từ màn hình.
Sử dụng dễ dàng : Với bộ tự dán GOR, bạn chỉ cần đặt bộ bảo vệ màn hình lên trên khi đã làm sạch bụi. Sau đó, miếng dán sẽ tự kết dính hoàn hảo mà không có hạt, bong bóng và bụi bẩn.
Độ trong : Kính có độ trong suốt cao đến 99%, bảo vệ chất lượng hiển thị gốc của iPhone.', 5, 2)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc)
VALUES(16, N'Phụ kiện trang trí', '004', '30000', 50, N'https://cf.shopee.vn/file/b0b5927f2b0b7da071483d667f52adf7_tn', N'Phụ kiện trang trí điện thoại, laptop, tủ lạnh, ti vi, vv hoạt hình hot (kèm keo dính đa năng dán được nhiều bề mặt)
Sản phẩm có thể sử dụng để:
- Miếng dán trang trí điện thoại, lap top, tủ lạnh, tivi
- Miếng dán cửa để tránh trầy xước tường
- Miếng dán bàn để tránh va chạm và tiếng ồn
', 10, 1)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES (17, N'Ốp lưng điện thoại phổ biến', '004', '150000', 30, N'https://cdn.tgdd.vn/hoi-dap/1294468/Thumbnail/cac-loai-op-lung-bao-da-smartphone-thuong-gap-thumbs.jpg', N'Bảo vệ smartphone an toàn, chống trầy xước, giảm nguy cơ smartphone bị tổn hại đến khi vô tình làm rơi.
Nhiều mẫu ốp lưng đi kèm các tính năng cho smartphone như: Chống sốc, ốp lưng đi kèm sạc dự phòng, kèm sạc không dây, tích hợp máy chơi game, ốp lưng kiêm loa,...
Có thể tự do thể hiện cá tính, gu thẩm mỹ từng cá nhân.
Giúp giữ điện thoại chắc chắn trên tay.', 20, 4)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES (18, N'Kính cường lực iphone 11', '003', 24000, 40, N'https://salt.tikicdn.com/ts/tmp/bc/27/ee/418a5f5cd7862dbb7442a57fe9018700.jpg', N'Với thiết kế đặc biệt, kính cường lực điện thoại cho Iphone 11 có thể phủ đến tận viền của màn hình. Vừa có thể đảm bảo được tính thẩm mỹ nhưng vẫn giữ được độ an toàn cho thiết bị của bạn. Ngoài ra, việc kính phủ ra tận viền màn hình, sẽ giúp cho khả năng bảo vệ màn hình điện thoại tốt hơn so với cường lực thường.', 10, 2);
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES (19, N'Mặt kính điện thoại', '001', 150000, 50, N'https://thaymanhinhdanang.com/wp-content/uploads/2017/06/thay-mat-kinh-dien-thoai-da-nang.jpg', N'Kính chống xước là loại kính được thiết kế nhằm giảm bớt phần nào những vết xước hoặc cấn nhẹ trong quá trình sử dụng điện thoại gây ra.
Loại kính này được đánh giá có chất lượng nhỉnh hơn so với kính thường, tuy nhiên về độ bền cũng như chắc chắn chịu lực thì vẫn còn nhiều khuyết điểm. Do đó tương tự như kính thường, kính chống xước hiện nay cũng chỉ được sử dụng trên một số dòng smartphone giá rẻ.', 10, 3);
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES (20, N'Kính cường lực', '004', 70000, 50, N'https://cdn.tgdd.vn/Files/2017/12/30/1054384/cac-loai-mat-kinh-cam-ung-hien-nay-10-1.jpg', N'Kính cường lực là lớp kính bao phủ màn hình điện thoại hoặc mặt lưng, nhằm bảo vệ phần bên trong máy tốt hơn, hạn chế được hư hỏng do va chạm hoặc cấn vật cứng gây ra.', 10, 2);
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES (21, N'Kính cường lực Gorilla Glass của Corning', '005', 120000, 40, N'https://cdn.tgdd.vn/Files/2017/12/30/1054384/cac-loai-mat-kinh-cam-ung-hien-nay-12.jpg', N'Corning lấy hình ảnh chú tinh tinh Gorilla làm biểu tượng cho mặt kính. Về lịch sử công ty này, vốn ban đầu là công ty chuyên về gốm sứ. Cho đến năm 2006, Corning mới bắt đầu nhận những đơn thiết kế mặt kính từ các công ty để sản xuất một dòng kính mới có chất lượng mỏng nhẹ hơn, mà vẫn chắc chắn và tương thích được với các thiết bị điện tử.
Và thương hiệu kính cường lực Corning Gorilla Glass nổi tiếng bắt đầu ra đời từ đây.', 20, 2)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES (22, N'Ốp lưng điện thoại hình dao phay', '005', 110000, 100, N'https://amansaigon.com/wp-content/uploads/2020/08/%E1%BB%91p-l%C6%B0ng-%C4%91i%E1%BB%87n-tho%E1%BA%A1i-h%C3%ACnh-dao-phay-10.jpg', N'Thiết kế lạ mắt, độc đáo
Phong cách độc lạ, cool ngầu
Trọng lượng nhẹ
Chất liệu nhựa TPU cao cấp an toàn cho người sử dụng, thân thiện với môi trường.
Chất liệu đàn hồi tốt, co giãn cao và đặc biệt rất mềm dẻo, không thấm nước.', 10, 4)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES (23, N'Tai nghe có dây choàng đầu có mic i.value T-138 ', '005', 500000, 110, N'https://fptshop.com.vn/Uploads/Thumbs/2019/12/17/637121962243047319_HASP-Tainghe-ivalue-t138-00630781(2).jpg', N'Đặc điểm nổi bật
Chỉ với mức giá thành hết sức phải chăng, bạn đã có thể trở thành chủ nhân của i.value T-138 – chiếc tai nghe ưu việt với thiết kế hiện đại trẻ trung có khả năng đem tới trải nghiệm âm thanh khiến bạn hài lòng.', 20, 5);
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES (24, N'Tai nghe dây nhét tai i.value M-13', '006', 199000, 30, N'https://fptshop.com.vn/Uploads/Thumbs/2020/4/14/637224565723879911_IVALUE-M13-BLACK-2.jpg', N'Với thiết kế nhỏ gọn, màu đen sang trọng, chiếc tai nghe đưa đến cho bạn những trải nghiệm thú vị, giúp bạn thư giãn sau những giờ làm việc mệt mỏi mà không phải nghe thêm những tiếng ồn khác từ bên ngoài', 10, 5)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES (25, N'Tai nghe bluetooth choàng đầu có mic i.value A8', '007', 550000, 100, N'https://fptshop.com.vn/Uploads/Thumbs/2019/9/25/637050170631026636_HASP-Tainghe-iValue-A8-00602556-3.jpg', N'Đặc điểm nổi bật
Với thiết kế hiện đại, khả năng mang tới trải nghiệm âm thanh tốt và mức giá bán ra phải chăng, chiếc tai nghe bluetooth choàng đầu i.value A8 cho thấy mình là sự lựa chọn sáng giá đối với người tiêu dùng Việt. Phong cách trẻ trung và hiện đại của tai nghe bluetooth A8
Tai nghe A8 được i.value thiết kế hướng tới phân khúc người dùng trẻ tuổi năng động với nhu cầu trải nghiệm âm nhạc mọi lúc mọi nơi.
Việc sử dụng công nghệ tương tác không dây bluetooth giúp sản phẩm có kích cỡ nhỏ gọn linh hoạt, hai màu sắc hiện đại là đen và gold tạo nên diện mạo trẻ trung chuyên nghiệp. Mỗi đường nét trên tai nghe đều thể hiện sự sắc sảo và độ hoàn thiện cao từ nhà sản xuất.', 30, 5);
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES (26, N'Tai nghe Beats X', '008', 2250000, 70, N'https://antien.vn/uploaded/Beats%20X/tai-nghe-beats-x.jpg', N'Đặc điểm nổi bật của Tai nghe Beats X
Thiết kế nhỏ gọn, trang nhã phù hợp với các hoạt động ngoài trời, thể thao, vận động mạnh
Tai nghe inear sử dụng chip bluetooth Apple W1 mới nhất, cùng chip với Solo 3 wireless, Powerbeats 3 Wireless và Airpods.
Thời lượng nghe nhạc lên đến 8 giờ liên tục
Công nghệ sạc nhanh 5 phút nghe nhạc 2 giờ
Tương tích tốt cho các dòng Iphone, Ipod, Ipad, Mac Apple Watch và cả hầu hết các dòng smartphone hỗ trợ bluetooth hiện nay
Chất âm mạnh mẽ, giàu năng lượng, bass mạnh vs căng đét phù hợp với nhiều dòng nhạc pop, dance, hihop,...
Hỗ trợ đàm thoại với mic khi được tích hợp chức năng ControlTalk có nghĩa tai nghe sẽ tự động phát nhạc khi có cuộc gọi đến và tiếp tục phát nhạc khi cuộc gọi kết thúc.
', 20, 5);
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES (27, N'Tai Nghe Razer Kraken Kitty Black', '009', 4890000, 55, N'https://product.hstatic.net/1000129940/product/tai-nghe-razer-kraken-kitty-black-05_d8fdbb7f63d34dafb5cb1640eb2be32d_large.jpg', N'Tai nghe Razer Kraken Kitty Black
Hãy tạo nên phong cách chơi game của riêng bạn với kiểu dáng tai nghe Killer Kitty dễ thương. Thể hiện cá tính và niềm đam mê cũng như nét độc đáo của riêng bạn với Razer Kraken Kitty Black Edition. Chiếc tai nghe Razer Kraken Kitty Black dễ thương với đèn nền Razer Chroma RGB 16.8 triệu màu và các hiệu ứng có thể hiệu chỉnh để phù hợp với phong cách của riêng bạn.', 0, 5)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc)
VALUES (28, N'Tai nghe Gaming cao cấp Each G7000 (7.1) (Có mic)', '010', 990000, 100, N'http://tech4you.vn/Image/_thumbs/Picture/Each/tai-nghe-gaming-cao-cap-each-g7000-7_1.jpg', N'Tai nghe Gaming cao cấp Each G7000 7.1 Virtual Surround Sound USB Game Headset  -  BLUE 
with Mic / Volume Control / Breathing LED Light
– Thiết kế rất ngầu dành riêng cho gamer, có LED 1 màu trên vành tai.
– Tai nghe bọc nhung cao cấp, tạo cảm giác êm tai khi đeo thời gian dài, ôm sát tai giúp cách âm cực tốt
–  Gọng tai nghe nhựa dẻo chống gãy
– Dây dù dày, chống nhiễu, giao tiếp USB (sound card)
– Chế độ rung theo bass, có thế tắt mở.
– Âm thanh 7.1 siêu thực giúp tận hưởng các bộ film HD 1 cách sống động nhất.
– Mic siêu nhỏ lọc âm, giảm tiếng ồn, giúp Voice chat trở nên hoàn hảo.
– Bộ chỉnh âm thanh lớn nhỏ + on/off chế độ rung.
– Có 1 màu: xanh.', 11, 5);
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES (29, N'Tai nghe Gaming EACH G2000 (Đen/Cam)', '011', 350000, 120, N'http://tech4you.vn/Image/_thumbs/Picture/Each/tai-nghe-gaming-each-g2000.jpg', N'Tai nghe gaming cao cấp Each G2000 (có mic)
- Tai nghe gaming Each G2000 được thiết kế rất ngầu, dành riêng cho gamer, có LED trên vành tai và trên mic
- Tai nghe bọc nhung cao cấp, tạo cảm giác êm tai khi đeo thời gian dài, ôm sát tai giúp cách âm cực tốt 
- G2000 có gọng tai nghe nhựa dẻo chống gãy, bọc mút dày
- Dây dù dày, chống nhiễu, giao tiếp USB (lấy nguồn led) + 3.5mm
- Mic lọc âm, giảm tiếng ồn, giúp Voice chat trở nên hoàn hảo
- G2000 có bộ chỉnh âm thanh lớn nhỏ
- Tai nghe gaming Each G2000 có 3 màu: Trắng/xanh, Đen/xanh, Đen/cam', 15, 5);
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES (30, N'Tai nghe Gaming EACH G3100 (Trắng/Xanh)', '012', 450000, 78, N'http://tech4you.vn/Image/_thumbs/Picture/Each/tai-nghe-gaming-each-G3100-trang-xanh_1.jpg', N'Tai nghe gaming Each G3100 (có mic) + Vibration
- Thiết kế rất ngầu, vành tai hình transfomer dành riêng cho gamer, có LED trên vành tai.
- Tai nghe bọc nhung cao cấp, tạo cảm giác êm tai khi đeo thời gian dài, ôm sát tai giúp cách âm cực tốt 
- Gọng tai nghe dạng khung mỏng, nhựa dẻo chống gãy
- Dây cao su dày, chống nhiễu, giao tiếp USB (lấy nguồn led + rung) + 3.5mm.
- Chế độ rung theo bass, có thế tắt mở.
- Mic siêu nhỏ lọc âm, giảm tiếng ồn, giúp Voice chat trở nên hoàn hảo.
- Bộ chỉnh âm thanh lớn nhỏ + on/off chế độ rung.
- Có 3 màu: Trắng/xanh, Đen/xanh, Đen/đỏ
Tai nghe gaming EACH G3100 ngoài khả năng gaming tốt còn được đánh giá cao bởi khả năng nghe nhạc rất tốt, đã được thử nghiệm bằng đĩa test của Harman Kardon cho chất lượng âm thanh khi nghe nhạc không thua kém gì tai nghe chuyên để nghe nhạc.
Ngoài ra tai nghe gaming EACH G3100 còn có khả năng giả lập âm thanh vòm cho âm thanh sống động và trung thực. Nút điều chỉnh âm lượng , rung đều được đưa lên tai nghe để tiện cho game thủ điều chỉnh khi chơi. Ngoài ra dây của Each G3100 còn được bọc trong ống nhựa gia cố thêm độ bền.', 20, 5);
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES (31, N'Tai nghe Gaming EACH G2100 (Đỏ/Đen)', '013', 420000, 50, N'http://tech4you.vn/Image/_thumbs/Picture/Each/tai-nghe-gaming-each-G3100-den-do_1.jpg', N'Tai nghe cao cấp gaming Each G2100 (có mic) + Vibration.
- Thiết kế rất ngầu, dành riêng cho gamer, có LED trên vành tai và trên mic.
- Tai nghe bọc nhung cao cấp, tạo cảm giác êm tai khi đeo thời gian dài, ôm sát tai giúp cách âm cực tốt 
- Gọng tai nghe nhựa dẻo chống gãy, bọc mút dày
- Dây dù dày, chống nhiễu, giao tiếp USB (lấy nguồn led + rung) + 3.5mm.
- Chế độ rung theo bass, có thế tắt mở.
- Mic lọc âm, giảm tiếng ồn, giúp Voice chat trở nên hoàn hảo.
- Bộ chỉnh âm thanh lớn nhỏ + on/off chế độ rung.
Tai nghe gaming EACH G2100 được sản xuất bởi hãng chuyên gia công OEM/ODM về tai nghe. EACH G2100 được thiết kế hướng tới game thủ với các tính năng rung theo tiếng bass, dây nối được bọc bảo vệ rất tốt và đèn led cá tính.Vỏ hộp thiết kế đẹp, khá bắt mắt. Mặt sau có in thông số kỹ thuật và xuất xứ của tai nghe. Tai nghe kèm hướng dẫn sử dụng, không có tiếng Anh. Dây dẫn được bọc vải dù, cầm trên tay rất chắc chắn và mềm, dài hơn 2m, thoải mái cho game thủ. Cụm volume và nút bấm bật tắt chức năng rung theo tiếng bass. Jack cắm cho ngõ phone và mic, cổng usb cấp nguồn cho chức năng rung và led. Phần gọng được làm bằng kim loại không rỉ. Có thể kéo ra thu vào, phù hợp với mọi nhu cầu sử dụng. Tai nghe phát sáng khi được cấp nguồn qua cổng usb. ', 20, 5);
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES (32, N'Tai nghe Gaming EACH G5200 (Đen/Xanh)', '014', 850000, 100, N'http://tech4you.vn/Image/_thumbs/Picture/Each/tai-nghe-gaming-each-G5200-den-xanh_1.jpg', N'Tai nghe cao cấp gaming Each G2100 (có mic) + Vibration.
- Thiết kế rất ngầu, dành riêng cho gamer, có LED trên vành tai và trên mic.
- Tai nghe bọc nhung cao cấp, tạo cảm giác êm tai khi đeo thời gian dài, ôm sát tai giúp cách âm cực tốt 
- Gọng tai nghe nhựa dẻo chống gãy, bọc mút dày
- Dây dù dày, chống nhiễu, giao tiếp USB (lấy nguồn led + rung) + 3.5mm.
- Chế độ rung theo bass, có thế tắt mở.
- Mic lọc âm, giảm tiếng ồn, giúp Voice chat trở nên hoàn hảo.
- Bộ chỉnh âm thanh lớn nhỏ + on/off chế độ rung.
Tai nghe gaming EACH G2100 được sản xuất bởi hãng chuyên gia công OEM/ODM về tai nghe. EACH G2100 được thiết kế hướng tới game thủ với các tính năng rung theo tiếng bass, dây nối được bọc bảo vệ rất tốt và đèn led cá tính.Vỏ hộp thiết kế đẹp, khá bắt mắt. Mặt sau có in thông số kỹ thuật và xuất xứ của tai nghe. Tai nghe kèm hướng dẫn sử dụng, không có tiếng Anh. Dây dẫn được bọc vải dù, cầm trên tay rất chắc chắn và mềm, dài hơn 2m, thoải mái cho game thủ. Cụm volume và nút bấm bật tắt chức năng rung theo tiếng bass. Jack cắm cho ngõ phone và mic, cổng usb cấp nguồn cho chức năng rung và led. Phần gọng được làm bằng kim loại không rỉ. Có thể kéo ra thu vào, phù hợp với mọi nhu cầu sử dụng. Tai nghe phát sáng khi được cấp nguồn qua cổng usb. ', 20, 5);
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES (33, N'Phụ kiện gắn ốp điện thoại hình chữ độc đáo', '005', 13000, 40, N'https://chomongcai.com/uploads/shops/2015_10/phu-kien-trang-tri-dien-thoai/phu-kien-trang-tri-op-dien-thoai-chu-chomongcaionline-7.jpg', N'Phụ kiện đính đá luôn luôn có sức hấp dẫn khó chối từ, bởi vẻ đẹp sang trọng toát ra từ từng viên đá lấp lánh sắc màu được gia công chế tác tinh xảo từ đôi tay tài hoa của các nghệ nhân. Nếu bạn là người phá cách, ưa thích sự sáng tạo, bạn muốn tự tay trang trí cho mình những chiếc ốp lưng điện thoại mang đậm dấu ấn cá nhân,thì giờ đây, vô cùng đơn giản, chỉ cần một chiếc ốp trơn và các loại phụ kiện trang trí điện thoại như đề can, đá gắn trang trí... là bạn hoàn toàn có thể thực hiện được.
Phụ kiện gắn ốp điện thoại hình chữ độc đáo
Phụ kiện gắn ốp điện thoại kiểu dáng chữ dễ thương, nhiều màu sắc, được chế tác gia công tỉ mỉ trong từng đường nét với điểm nhấn tinh tế là những viên đá gắn lấp lánh sắc màu. Chất lượng đá gắn cao cấp, đảm bảo độ sáng bóng, không bị xỉn màu, ô xy hóa và được gắn bằng keo chuyên dụng vô cùng chắc chắn.
Bạn có thể tự do thoải mái sáng tạo bằng cách ghép chữ theo tên mình, tên người thân và gắn trang trí trên ốp để làm quà tặng cho bạn bè, người thân rất ý nghĩa. ', 20, 1);
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES (34, N'Combo 30 bông hoa chanel hoa nhựa pha lê các cỡ', '006', 39000, 40, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/261/731/products/hoa-nhu-a2.jpg?v=1632278969647', N'Combo 30 bông Hoa Chanel Hoa Nhựa pha lê các cỡ
Ứng dụng: dùng gắn trang trí lên ốp lưng, chai nước hoa, phụ kiện DIy
Kích cỡ: nhỏ nhất 1cm, to nhất 3cm', 10, 1);
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES (35, N'Chân siêu hít (hít được ốp lưng in hình,mọi mặt phẳng..v.v) ComBo 2 cái (giao màu ngẫu nhiên)', '007', 59000, 40, N'https://vn-test-11.slatic.net/p/51943172c2c8cdaac0745b6e72612d90.jpg_600x600Q100.jpg', N'-Hit điện thoại di động công nghệ hút chân không.Trọng lượng sản phẩm: khoảng 42g Kích thước gói đơn: dài 7 * rộng 5,5 * cao 12CMSản phẩm giá đỡ điện thoại hình cánh hoa, 2 đầu siêu dính, dễ sử dụng,hít được trên ốp điện thoại có in hình- Sử dụng trên bàn làm việc hoặc trên ôtô rất tiện lợi.Không cần dán 1 lớp nào lên điện thoại, sản phẩm có bộ hút cao su cực mạnh !- Sử dụng được trên mọi mặt phẳng- Thân kẹp làm từ thép hợp kim chắc chắn chống rỉ.- Kích thước : 6 x8 cmChất liệu sản phẩm: nhựa + hợp kim + siliconTính năng: Sản phẩm này có đa chức năng, lực hút cực mạnh, dây đai di động, v.v. Không cần vá, không làm hỏng điện thoại di động, kết nối ống kim loại, xoay 360 độ, nhỏ gọn và nhẹ, mọi lúc, mọi nơi, thuận tiện và thiết thực.', 022, 1);
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(36, N'Phụ kiện trang trí thủ công', '008', '69000', 20, N'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQAELyCwkcpP_D13-15-_RYZRLUQu2lQ4CSrQtVPc1_rxruCSB33Sy12r5s4xB-pLWJ930DWYwRa-85sa_RE7p0z_eLsibBZpgpYnGjVSE&usqp=CAc.jpg', N'Chất liệu: nhựa resin thân thiện với môi trường, không độc hại, nhẹ và mịn, bền và chắc chắn. Tự làm bất kỳ đồ thủ công DIY nào như kẹp tóc, dây buộc tóc, điện thoại di động, hộp văn phòng phẩm, khung ảnh. Các hạt có nhiều hình dạng, màu sắc và phần phẳng tinh tế, phù hợp với đồ thủ công của bạn, chẳng hạn như kẹp tóc, móc chìa khóa, ...', 10, 1)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(37, N'Tai nghe Bluetooth không dây Airpods chính hãng ', '002', '499000', 10, N'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSSkYiGhHmPpTGUbIM2Uy0-kkz_heHWuCRIpoV2Lu-mNTt-nqL87nANa-_at8oFUrRVqfwb4DWs-X0&usqp=CAc.jpg', N'Tai nghe Bluetooth AirPods Wireless là dòng tai nghe với hình thức thiết kế tương tu tai nghe EarPods, điểm khác biệt đó là tai nghe AirPods đã loại bỏ Jack cắm 3.5 mm, trở thành dòng tai nghe không dây kết nối bluetooth, mang lại sự tiện lợi cho người dùng', 0, 5)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(38, N'Kính cường lực Oppo A3s Full 5D ', '006', '50000', 10, N'https://p-vn.ipricegroup.com/247307e0d16e337337db6004475f30b45b755253_0.jpg?position=5.jpg', N'Miếng dán kính full màn hình với mặt dán hoàn toàn là kính chịu lực, độ sáng và bóng y làm cho điện thoại bạn đã xịn nay càng xịn hơn. Kính dán lên giống hệt như màn hình máy, ko có mép, ko nhìn thấy viền mép dán. Siêu phẩm có độ cứng gấp 3 lần so với kính full cũ đang bán ngoài thị trường, khắc phục tình trạng mẻ viền, mẻ góc.', 8, 2)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(39, N'Tai nghe Sony WI-C400', '015', '350000', 3, N'https://p-vn.ipricegroup.com/uploaded_b7132b5655bb6dfaacc6f6053baaf940.jpg?position=5.jpg', N'Khả năng kết nối BLUETOOTH dễ dàng với NFC một chạm. Thời gian sử dụng pin lên đến 20 giờ. Màng loa neodymium 9 mm mang đến âm thanh sống động. Rung để thông báo cuộc gọi đến', 1, 5)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(40, N'Phụ kiện trang trí', '009', '59000', 10, N'https://ae01.alicdn.com/kf/HTB1.yORSXzqK1RjSZFvq6AB7VXaT/T-L-m-p-i-n-Tho-i-Ph-Ki-n-Trang-Tr-Kim-C-ng.jpg_q50.jpg', N'Vật liệu hỗn hợp',0, 1)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(41, N'Ốp lưng Oppo A5s', '006', '25000', 3, N'https://cdn.tgdd.vn/Products/Images/60/206022/op-lung-oppo-a5s-deo-solid-ii-jm-19e069-meo-ngo-1-600x600.jpg', N'Kiểu dáng thời trang và đẹp mắt. Thiết kế vừa vặn và ôm sát thân máy. Dễ dàng tháo/lắp ốp vào máy',1, 4)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(42, N'Dây ngọc bội hoa sen', '010', '99000', 30, N'https://storage.googleapis.com/cdn.nhanh.vn/store/14345/ps/20191127/553.jpg', N'Kích thước nhỏ gọn, yêu, đường nét tinh tế. Kết hợp với ngọc bội hoa sen là tua rua 2 màu xanh, đỏ', 12, 1)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(43, N'Màn hình iphone', '004', '700000', 15, N'https://fonesmart.com.vn/images/repairs/2019/07/04/resized/thay-kinh-iphone-xi_1562206706.png', N'Gồm 3 lớp chính là : Mặt kính, cảm ứng và phần LCD hiển thị. Hiện tại với màn hình iPhone 11 Pro Max ta có thể thay thế mặt kính hoặc mặt kính cảm ứng.', 10, 3)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(44, N'Màn hình Samsung Galaxy A30s', '005', '550000', 12, N'https://dienthoaivui.com.vn/wp-content/uploads/2019/11/a30.png', N'Màn hình Galaxy A30 chính hãng được thay tại shop cam kết hàng chính hãng thương hiệu Samsung 100%, được nhập trực tiếp tại hãng Samsung đã qua kiểm định về chất lượng màn hình', 5, 3)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(45, N'Màn hình Oppo F17', '006', '450000', 20, N'https://fonesmart.com.vn/images/repairs/2020/11/19/original/thay-man-hinh-oppo-f17-pro-chinh-hang_1605755777.png', N'Linh kiện màn hình Oppo F17, F17 Pro được nhập khẩu chính hãng',11, 3)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(46, N'Tai nghe có dây M60', '016', '100000', 25, N'https://salt.tikicdn.com/ts/product/fd/a6/0d/b4f42317bc57dfb8063d9ec1fa40d532.PNG', N'M60 Tai nghe phổ âm hoàn hảo với mic cáp TPE đàn hồi cao Tai nghe có dây 1,2m với mic thiết kế nhẹ trong tai thân thiện với người dùng
1. Loa: 10 mm.
2. Chiều dài đường dây: 1,2m, trọng lượng: 13g.
3. Cắm âm thanh: Ø3,5mm. 
4. Cáp tai nghe: Dây bện cao TPE với dây tráng men.
5. Micrô: bộ điều khiển có mic. 
6. Điều khiển dây: hoạt động một nút chức năng, được điều chỉnh để kiểm soát Apple và Android. Tặng kèm 3 Dây Bọc Cáp Sạc, bọc Dây Tai Nghe Lò Xo',14, 5)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(47, N'Tai nghe Airpods', '017', '1500000', 22, N'https://cdn.tgdd.vn/Products/Images/54/236025/airpods-2-wireless-charge-apple-mrxj2-ava-600x600.jpg', N'Thiết kế đơn giản, thời trang và nhỏ gọn. Trang bị chip H1 hoàn toàn mới, cho tốc độ kết nối, chuyển đổi giữa các thiết bị nhanh chóng. Kích hoạt nhanh trợ lý ảo Siri bằng cách nói "Hey, Siri". Hỗ trợ sạc không dây chuẩn Qi tiện lợi. Sản phẩm chính hãng Apple, nguyên seal 100%.', 5, 5)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(48, N'Ốp lưng iphone 12 Pro Max', '007', '55000', 22, N'https://cdn.tgdd.vn/Products/Images/60/237539/op-lung-iphone-12-pro-max-da-apple-mhkm3-den-ava-600x600.jpg', N'Vỏ ốp lưng phủ sắc đen thanh lịch, thiết kế ôm sát iPhone 12 Pro Max. Làm từ da thuộc mềm nhẹ, bền đẹp, cầm nắm dễ chịu. Các chi tiết được làm tinh xảo, bảo vệ tốt điện thoại, hạn chế trầy xước. Có nam châm tích hợp cố định tiếp xúc giữa ốp và phần lưng điện thoại, sạc không dây dễ dàng. Ốp lưng chính hãng Apple 100%.', 12, 4)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(49, N'Ốp lưng Samsung A2 LTE', '008', '40000', 16, N'https://cdn.tgdd.vn/Products/Images/60/243078/op-lung-galaxy-a22-lte-deo-soft-clear-samsung-1-600x600.jpg', N'Kiểu dáng gọn nhẹ, thiết kế trong suốt mọi mặt góp phần làm tăng nét sang trọng cho Galaxy A22. Được sản xuất hoàn thiện đến từng chi tiết nhỏ, camera, cổng sạc, nút bấm trải nghiệm thoải mái. Đảm bảo an toàn cho mặt lưng và cạnh hông nhờ thiết kế ôm sát, vừa khít. Vật liệu nhựa dẻo cho bề mặt mịn màng, chịu lực tác động tốt, tháo rời và lắp vào máy đơn giản.', 0, 4)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(50, N'Kính cường lực iphone 11 Pro Max', '007', '90000', 30, N'https://shopmrhi.com/uploads/source/danmanhinh/gor/11/ava.png', N'Kính cường lực bảo vệ gấp 3 lần: Với 6 giờ nung trong nhiệt độ cao. Kính cường lực GOR bảo vệ mạnh mẽ chống lại các vết nứt, và bền hơn nhiều so với các Kính bảo vệ Kính cường lực thông thường khác. Công nghệ chống vỡ tốt hơn để bảo vệ màn hình hiệu quả hơn.', 5, 2)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc)
VALUES(51, N'Combo Củ sạc điện thoại 5V/1A & Dây sạc cổng Micro USB chính hãng cao cấp', '001', 60000, 80, N'https://salt.tikicdn.com/ts/product/77/c1/d4/081a8ab4a0f7860279f7f1d0d2525d92.jpg', N'Mô Tả Sản Phẩm
Củ sạc 5V/1A VNPT Technology chính hãng cao cấp, hỗ trợ sạc nhanh cho hiệu suất cao.
Củ sạc 5V/1A VNPT Technology được thiết kế nhỏ gọn, tiện lợi dễ dàng mang theo tới bất kỳ nơi đâu nhằm đảm bảo những thiết bị di động của bạn luôn sẵn sàng để sử dụng.
Củ sạc cho điện áp đầu ra ổn định, an toàn và không làm cho pin của thiết bị bị chai, phồng hay hỏng. Chân tiếp xúc làm bằng hợp kim cao cấp, tiếp điện tốt giúp giảm thời gian sạc. Hệ thống mạch bảo vệ điện áp thông minh bên trong sạc rất an toàn, tin cậy tránh những nguy hại như cháy, chập khi nạp điện.
Củ sạc 5V/1A VNPT Technology cho nguồn ra chuẩn 5V-1A, đây là một nguồn ra phổ biến nhất hiện nay và có thể sử dụng tương thích cấp nguồn sạc cho nhiều thiết bị khác nhau như: điện thoại, smartphone, loa bluetooth, các bộ phát wifi di động 3G/4G, IP Camera, v...v...
* Thông số kỹ thuật Củ sạc 5V/1A VNPT Technology
Model: Sạc 1 cổng USB
Chất liệu: Vỏ Nhựa ABS
Tính năng khác: Bảo vệ quá nhiệt, ngắn mạch, quá tải.
Tính năng: Sạc/cấp nguồn cho các loại thiết bị qua cổng sạc USB
Điện áp vào : AC100~240V, 50/60Hz
Điện áp ra: DC 5V / 1A
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....
', 20, 6)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(52, N'Dây sạc điện thoại đa năng trên xe ô tô', '002', 150000, 110, N'https://dochoiotogiare.com/wp-content/uploads/2018/09/day-sac-dien-thoai-da-nang-1.png', N'– Dây dài 1,2m
– Có 3 đầu cổng sạc cho các dòng điện thoại khác nhau
– Chất liệu bền bỉ, an toàn với điện thoại
– Có thể sử dụng ở bất kỳ đâu, bất kỳ nơi nào
– Màu sắc: màu đồng gold.
1. Tác dụng của dây sạc đa năng 3 in 1 
– Sợi dây cáp ngắn gọn tiện lợi làm bằng dây dù cực chất, vô cùng chắc chắn và bên. Đầu vào USB và có 3 đầu ra là Lightning, Micro USB và Type C. Giúp bạn cùng một lúc có thể sạc được nhiều thiết bị di động mà chỉ cần 1 ổ cắm nguồn.
– Toàn bộ đầu ra đều tích hợp chip nhận dạng máy thông minh và an toàn nguồn điện giúp giữ tuổi thọ cho PIN khi được nạp nguồn điện
– Chỉ với dây sạc điện thoại đa năng bạn có thể sạc nhiều thiết bị cùng 1 lúc dù ở bất kỳ nơi đâu, bất kỳ thời gian nào.
– Cáp đầu hình dạng được thiết kế riêng biệt cho phép bạn chuyển dữ liệu của bạn và thiết bị hoán đổi với một dây cáp.
– Thiết kế thanh thoát, gọn gàng, lớp dây được bọc dù siêu bền đảm bảo không bị đứt, chống rối.
– Cáp sạc không chỉ phù hợp để nạp điện cho smartphone, máy tính bảng mà còn để truyền tải dữ liệu một cách tốt nhất
– Lõi bằng đồng giúp việc truyền tải dữ liệu không bị gián đoạn, sạc nhanh hơn và luôn ổn định
2. Đặc điểm nổi trội của sản phẩm dây sạc điện thoại đa năng
– Sạc & Sync Cable: Sản phẩm có thể được sử dụng để sạc điện thoại, thiết bị thông minh / iPhone và truyền dữ liệu. Sử dụng lõi dây đồng mạ niken chất lượng cao, tốc độ truyền dẫn cao, sạc nhanh, đầu ra ổn định không gây thiệt hại cho điện thoại di động.
– 3 in 1: Cáp sạc đa năng với dây sạc USB tích hợp 3 đầu sạc Lightning – MicroUSB – Type C (macbook 12, xiaomi note 3, vv). Sản phẩm có 3 đầu Micro USB và Lightning và USB Type C riêng biệt nên có thể được sử dụng cho nhiều loại điện thoại thông minh và sạc cùng lúc 3 thiết bị.
– Khả năng tương thích: Tương thích cho tất cả các điện thoại thông minh / iPhone /iPad bằng cách sử dụng cổng micro USB và Lightning và USB Type C.
– Thiết kế dây bọc vải chắc chắn, hạn chế rối dây – đứt dây
– Hạn chế tối đa lỗi từ hệ diều hành iOS
– Chiều dài dây sạc đa năng 3 trong 1 là 1.2m cho phép bạn sạc, truyền dữ liệu mà thiết bị vẫn được đặt ở một nơi hợp lý.
– Hỗ trợ sạc nhanh 2.1A – truyền dữ liệu tốc độ cao
Lưu ý: Tuỳ theo cốc sạc của bạn mà sạc cùng lúc 2 thiêt bị trở lên. Tuyệt đối không dùng sạc iphone 1A sạc cho 2 máy, điều này chắc chắn dẫn đến đứt mạch cốc sạc của bạn.', 50, 6)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(53, N'Túi chống nước Anker', '001', 119000, 100, N'https://didongviet.vn/tin-tuc/wp-content/uploads/2019/06/tui-chong-nuoc-dien-thoai-anker-didongviet.jpg', N'Là thiết bị có khả năng kháng nước vượt trội, túi chống nước Anker giúp chống nước tốt theo tiêu chuẩn IPX8, bảo vệ điện thoại tốt ở độ sâu lên đến 30m. Thiết bị đựng vừa các mẫu điện thoại có kích thước lên đến 6inch như iPhone X, 6S Plus, Galaxy S6, iPhone 7. 7 Plus, Galaxy S9, S9 Plus, Note 8,….
Thiết kế túi chống nước khá đơn giản, có hai mặt là nhựa trong, ôm khít vào điện thoại giúp cầm năm và các thao tác dễ dàng hơn. Túi có khóa an toàn ở 2 đầu chống nước lọt tuyệt đối.
Túi chống nước Anker được review khá nhiều, được các reviewer đánh giá khá cao về chất lượng thiết bị. Người dùng vẫn có thể sử dụng thiết bị có màn hình cảm ứng rất mượt mà qua lớp nhựa trong suốt của túi. Hoặc có thể sử dụng chụp ảnh, quay phim với chất lượng hình ảnh cao ngay cả khi đang ở dưới nước.
Dù là sản phẩm cao cấp, có chất lượng cao nhưng giá bán túi chống nước Anker khá hợp lý. ', 0, 7)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(54, N'Pin Điện Thoại Galaxy S4 Chính Hãng', '001', 210000, 150, N'https://mayvitinhcu.net/wp-content/uploads/2017/12/pin-samsung-galaxy-s4-440x440.jpg', N'Giới Thiệu  Pin Điện Thoại Samsung Galaxy S4 I9500 B600BE 2600mAh (Xám)
– Dung lượng Pin: 2600mAh
– Sản xuất tại: Sản xuất tại: Hàn Quốc
– Có tích hợp công nghệ NFC trên Pin cho khả năng giao tiếp không dây.
– Bạn đang lo lắng về tình trạng Pin Galaxy S4, sau một thời gian sử dụng Pin S4 của bạn bị chai, phồng, sụt pin … Vấn đề sẽ được giải quyết sau khi bạn mua quả Pin Samsung S4 mới.
– Pin Galaxy S4 hiện tại có rất nhiều cửa hàng bán nhưng tìm mua được Pin chất lượng cao, có nguồn gốc rõ ràng không phải dễ. Các bạn rất dễ mua phải Pin S4 hàng nhái, hàng kém chất lượng với giá không hề rẻ.', 12, 8)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(55, N'Dây sạc điện thoại samsung galaxy note ii n7100 (pink), ceramic', '003', 179000, 200, N'https://catthanh.com/1_html/img/product_img/thum/1395047799_day-sac-dien-thoai-sam-sung-galaxy-notte-2-n7100-1.jpg', N'Dây sạc điện thoại samsung galaxy note ii n7100 (pink), ceramic 
Bạn đang sở hữu Samsung Note 2 sành điệu, bạn thường xuyên di chuyển và làm việc qua chú dế ấy  và khiến cho nó luôn trong tình trạng sắp hết pin? Và bạn cần một bộ thiết bị để luôn chủ động trong mọi trường hợp? Vậy thì hãy sở hữu ngay sản phẩm gồm: combo 1 củ sạc và 1 cáp sạc dành cho Samsung Note 2
Dùng được cho hầu hết các dòng Smartphone cao cấp trên thị trường hiện nay của SONY , SKY, LG, HTC, NOKIA có cùng chân kết nối Micro Usb
Giao tiếp dễ dàng hơn với cổng USB tiện lợi, Dễ dàng kết nối, Nhỏ gọn, tiện lợi. Cho Note 2 của bạn luôn vận hành tốt, đầy đủ "năng lượng" với bộ cáp sạc nhỏ xinh này bạn nhé', 0, 6)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(56, N'Túi chống nước Msquare', '002', 155000, 200, N'https://didongviet.vn/tin-tuc/wp-content/uploads/2019/06/tui-chong-nuoc-dien-thoai-msquare-didongviet.jpg', N'Thương hiệu Msqura đến từ Nhật Bản luôn tạo ra những sản phẩm chất lượng. Túi chống nước Msquare được làm bằng nhựa cao cấp giúp chống nước. Bảo vệ điện thoại khỏi dính nước, dính bụi khi đi bơi, đi dã ngoại tốt.
Phần khóa túi chống nước có thiết kế độc đáo. Đi kèm với đó là dây đeo chắn chắn, dễ dàng điều chỉnh kích thước phù hợp với cơ thể người dùng. Kích thước túi chống nước Msquare khá lớn, thích hợp sử dụng cho các dòng điện thoại có màn hình từ 5.7 inch trở xuống.
Túi chống nước có mặt trước và sau trong suốt, nhìn xuyên thấu điện thoại tiện lợi. Với khá nhiều màu để người dùng lựa chọn như xanh, đen, đỏ, hồng, cam…', 100, 7)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(57, N'Pin Samsung Galaxy J1 chính hãng', '002', 150000, 120, N'https://www.phukiensamsung.com/upload/images/01-2015/pin-j1-1.JPG', N'- Sản phẩm được thiết kế dành riêng cho điện thoại Galaxy J1.
- Pin Samsung J1 chính hãng có dung lượng 1850mAh in rõ trên mặt pin.
- Các thông số kỹ thuật được in ngay trên mặt trước và mặt sau pin rõ ràng.
- Pin Galaxy J1 chính hãng được làm đạt tiêu chuẩn nên bạn hoàn toàn yên tâm sử dụng,
- Sản phẩm được bảo hành 06 tháng 1 đổi do lỗi nhà sản xuất.', 16, 8)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(58, N'Túi chống nước R-13B', '003', 350000, 100, N'https://didongviet.vn/tin-tuc/wp-content/uploads/2019/06/tui-chong-nuoc-dien-thoai-r13-b-3-didongviet.jpg', N'Là chiếc túi cao cấp, sở hữu nhiều điểm ấn tượng. Túi chống nước R-13B được khá nhiều người yêu thích. Dù điện thoại được bỏ trong túi nhưng người dùng vẫn có thể sử dụng tai nghe bình thường như để ở ngoài.
Túi chống nước R-13B có thiết kế bền, đẹp. Được làm bằng chất liệu PVC và ABS giúp chống nước tuyệt đối. Để người dùng yên tâm hơn khi sử dụng điện thoại trong môi trường có nước. Không lo vấn đề hư hỏng các thiết bị công nghệ khi dính nước.
Túi có thể bảo vệ điện thoại ở độ sau đến 20m. Đựng vừa cho các loại điện thoại có màn hình điện thoại từ 3.5 inch – 5.5 inch như iPhone, HTC, Galaxy Note,…', 0, 7)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(59, N'Túi chống nước Joyroom TCN001', '004', 129000, 70, N'https://didongviet.vn/tin-tuc/wp-content/uploads/2019/06/tui-chong-nuoc-dien-thoai-yoyroom-tcn001-didongviet.jpg', N'Một mẫu túi chống nước giá rẻ đáng sở hữu khác là sản phẩm đến từ thương hiệu Joyroom. Với khả năng chịu nước đến 20m, túi chống nước Joyroom giúp người dùng thoải mái quay phim, chụp ảnh dưới nước.
Thiết bị thích hợp để bảo vệ cho các dòng điện thoại có màn hình dưới 6 inch. Ngoài khả năng chống nước, túi giúp chồng bụi, chốn cát tốt. Bên cạnh đó, người dùng có thể dùng túi để đựng và bảo quản tốt cho các giấy tờ cần thiết.
Túi có trọng lượng nhẹ, tầm 48g cùng dây đeo dài, để người dùng luôn thoải mái nhất khi sử dụng. Giá túi chống nước Joyroom TCN001 hiện khoảng 129 ngàn. Với các màu sắc như trắng, vàng, hồng,.. để người dùng có sự lựa chọn màu yêu thích.', 19, 7)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(60, N'Củ Sạc IPhone Apple Chính Hãng 5W', '004',  250000, 100, N'https://bizweb.dktcdn.net/thumb/medium/100/184/165/products/1441283015-sac-zin-iphone-full.jpg?v=1635237254257', N'Củ Sạc IPhone Apple Chính Hãng
THÔNG TIN SẢN PHẨM
Củ Sạc IPhone Apple với thiết kế siêu nhỏ gọn, nhẹ và thuận tiện cho việc sạc hầu hết các thiết bị có tính di động của Apple.
Sản phẩm sẽ thật sự trở thành một phụ kiện hữu ích cho bạn khi cần một phụ kiện an toàn, tiện lợi, chất lượng tốt cùng với tính tiện dụng của nó.
Không còn phải lo lắng về dây nhợ rườm rà, cồng kềnh gây bất tiện cho việc mang theo nữa. Thiết kế sở hữu kích thước nhỏ gọn,
rất vừa tầm tay lại hợp thời trang, cùng với màu sắc duy nhất là màu trắng tinh tế, sáng bóng đẹp mắt.
Củ Sạc IPhone Apple là loại sạc mà Apple cung cấp cho khách hàng của mình nhằm rút ngắn thời gian sạc cho các thiết bị di động của mình, thông qua việc sử dụng dây cáp có cổng USB, công suất 5W cho khả năng sạc nhanh và hiệu quả.
Sản phẩm được làm từ chất liệu nhựa cao cấp nên rất an toàn khi sử dụng, thậm chí bạn cũng không còn cần phải lo lắng khi vừa sạc thiết bị vừa cầm trên tay.
Sản phẩm tương thích với  các thiết bị di động của Apple như iPhone, iPad mini, iPad air, iPad 1, iPod…', 34, 6)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc)
VALUES(61, N'Pin iPhone 12/12Mini/12Pro/12Promax zin tháo máy, tặng dán pin', '003', 900000, 150, N'https://cdn.thanhtrungmobile.vn/thanhtrungmobile-vn/2020/09/thay-pin-iphone-12-1-1.jpg', N'MÔ TẢ SẢN PHẨM
Lí do phải thay pin:
+ Pin tụt nhanh hơn kéo theo tần suất phải sạc pin tăng lên.
+ Pin chỉ sử dụng trong thời gian ngắn máy đã nóng ran.
+ Pin bị phồng đội cả phần màn hình lên nếu vẫn tiếp tục dùng có thể gây vỡ, nứt màn hình.
+ Pin báo ảo, sạc nhanh đầy nhưng dùng chưa hết pin đã sập nguồn hoặc đôi khi tắt nguồn một cách đột ngột.
+ Báo sạc nhưng không vào pin.
+ Dung lượng pin tối đa trong mục tình trạng pin < 80% . Một nghiên cứu chỉ ra rằng iPhone chai pin khoảng từ 40% trở lên là chúng ta nên thay pin mới để bảo vệ cho chiếc điện thoại của mình.  
Thay pin iPhone 12/ 12Pro/ 12Mini/ 12 Promax uy tín
Hàng chuẩn zin tháo máy, quý khách khi mua về có thể mang ra cửa hàng cho thợ thay thế
Giá trên shop bán mua về chưa kèm công thợ thay
Khi thay pin sẽ báo bảo trì, phải sàng cáp và fix pin ( báo % cũ )', 56, 8)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(62, N'Đế sạc không dây 2in1 dạng đứng cho Iphone và AppleWatch', '005', 700000, 150, N'https://macinsta.vn/wp-content/uploads/2018/12/as15-de-sac-2in1-dang-dung-cho-iphone-va-applewatch-2-510x510.jpg', N'Sản phẩm sẽ bao gồm: 1 Đế sạc không dây 2in1 cho Iphone và AppleWatch + 1 cáp sạc Type-C + 1 củ sạc nhanh 9V-1.67A (5V-2A). Bạn sẽ không cần phải sử dụng thêm phụ kiên nào khác bên ngoài.', 50, 6)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(63, N'Túi chống nước Basseus Air Cushion LV258', '005', 200000, 100, N'https://didongviet.vn/tin-tuc/wp-content/uploads/2019/06/tui-chong-nuoc-dien-thoai-basseus-didongviet.jpg', N'Một thiết bị chống nước cao cấp khác đến từ thương hiệu Basseus nổi tiếng khác là túi chống nước Basseus Air cushion LV258. Đây là chiếc túi chống nước đa năng. Bảo vệ điện thoại tốt, còn là chiếc phao chống chìm cho điện thoại khi xuống nước. Dù lỡ tay vẫn không lo điện thoại bị chìm.
Túi chống nước được làm bằng nhựa dẻo PVC trong suốt cùng sợi nylon cao cấp, cho tính đàn hồi cao, bền hơn. Sử dụng để bảo quản cho điện thoại có màn hình từ 6 inch.
Khóa bảo vệ và rãnh không khi được thiết kế thông minh. Đảm bảo cho nước không rò rỉ vào được bên trong, bảo vệ điện thoại an toàn tuyệt đối. Có thể đeo túi chống nước Basseus ở cổ, ở tay hoặc thắc lưng tiện lợi.
Giá bán túi chống nước Basseus LV258 khoảng 200 ngàn. Có các tùy chọn màu cho người dùng lựa chọn như đen, xanh, cam.
Từ những thông tin trên, tùy nhu cầu mà người dùng có thể chọn cho mình một túi phù hợp để bảo vệ dế yêu của mình được tốt nhất.', 16, 7)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(64, N'Pin OPPO R9 / F1 Plus / X9009 chính hãng', '004', 400000, 50, N'https://phatthanhmobile.vn/wp-content/uploads/2018/02/thay-pin-oppo.jpg', N'Thay pin OPPO chính hãng tại Phát Thành
Pin OPPO thay mới là hàng zin với chất lượng đảm bảo, có bảo hành.
Thay pin không làm mất dữ liệu cá nhân
Hỗ trợ vệ sinh máy miễn phí trong quá trình thay pin
Kỹ thuật viên giàu kinh nghiệm thay pin trước mặt khách.
Nhân viên tư vấn vui vẻ, nhiệt tình và tận tâm.
Hệ thống máy móc, thiết bị hiện đại phục vụ sửa chữa
Báo giá và thời gian cụ thể để khách hàng tiện so sánh và lựa chọn.
Nghiêm túc trong sửa chữa bảo hành – Thân thiện trong tư vấn là điều cần thiết đối với sự phát triển của công ty.
Cảm ơn quý khách đã ủng hộ Hệ thống sửa điện thoại Phát Thành trong suốt lộ trình hơn 10 năm xây dựng thương hiệu sửa chữa điện thoại và máy tính bảng thông minh.', 22, 8)
INSERT INTO SanPham (id_sanpham, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang, id_danhmuc) 
VALUES(65, N'Đế sạc Y-Magsafe 3in1 kiêm đèn ngủ thông minh', '006', 750000, 120, N'https://macinsta.vn/wp-content/uploads/2021/07/IS27-3-510x510.jpg', N'Sạc cùng lúc cho 3 thiết bị: Iphone, Apple Watch và Airpods
Tích hợp sạc từ tính dính hút chắc chắn Magsafe
Tích hợp đèn ngủ với 2 chế độ sáng, bật tắt bằng chạm cảm ứng
Output sạc nhanh cho cả 3 thiết bị: Vị trí sạc điện thoại với công suất lên đến 15W, vị trí sạc Airpods (có thể sạc được cho điện thoại) với công suất 5W, vị trí sạc Apple Watch công suất 3W. Sạc độc lập 3 thiết bị cùng 1 lúc mà không ảnh hưởng lẫn nhau nhờ chịp thông minh thế hệ mới
Bộ sản phẩm đi kèm 1 cáp sạc cho Apple Watch để lắp vào đế sạc và 1 dây cáp nguồn cho đế sạc', 45, 6)
SELECT * FROM SanPham

INSERT INTO TrangChu(id_trangchu, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang)
VALUES(1, N'Dây đeo điện thoại', 001, 39000, 50, N'https://vn-test-11.slatic.net/p/ece4c6dcc1701fe408b8eb87ada8c963.jpg_800x800Q100.jpg',N'Dây đeo điện thoại, bóp ví, móc khoá loại ngắn xỏ ngón tay
Dây đeo không chỉ xinh xắn tô vẻ đáng yêu cho chiếc điện thoại, mà thật sự hữu ích chống rớt cho điện thoại, không sợ trợt tay khi sử dụng. 
Khoen được làm bằng chất liệu silicon siêu mềm dẻo, không đau khi xỏ vào ngón tay như vòng kim loại.
Không chỉ xỏ điện thoại, ngoài ra còn có thể treo móc khoá, treo balo như vật trang trí xinh xắn.
Lưu ý ốp lưng hoặc điện thoại của bạn cần phải có lỗ xỏ dây.
Đặc tính sản phẩm Dây đeo điện thoại, bóp ví, móc khoá loại ngắn xỏ ngón tay, khoen tròn hoạt hình xinh xắn', 20);
INSERT INTO TrangChu(id_trangchu, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang)
VALUES(2, N'Kính cường lực', 001, 435000, 100, N'https://lesang.vn/images/san-pham/kinh-cuong-luc-iphone-13-13-pro-spigen-glas-tr-slim-hd1632884050.jpg', N'Cường lực iPhone 13 Pro Max Spigen thuộc dòng sản phẩm cao cấp từ Mỹ, rất mỏng và Full toàn màn hình, siêu mượt, chống vân tay cực tốt.
Tính năng nổi bật 
- Kính cường lực về hình thức bề ngoài thì hầu hết mọi loại đều như nhau về thiết kế. Sự khác biệt chủ yếu nằm ở các điểm sau:
+ Công nghệ chế tạo: Đảm bảo được sự chính xác, sắc nét
+ Chất lượng nguyên vật liệu: Đảm bảo độ an toàn, chất lượng hình ảnh cũng như tác động khi va chạm
+ Các lớp phủ bề mặt: Tăng cường khả năng chống vân tay, chống bám bẩn, trơn mượt hơn trong thời gian dài.
Các thương hiệu lớn thường sẽ hoàn thiện những phần này tốt hơn nhiều so với các dòng sản phẩm thông thường dù nhìn bên ngoài chúng giống nhau.', 30);
INSERT INTO TrangChu(id_trangchu, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang)
VALUES(3, N'Màn hình điện thoại', 001, 550000, 100, N'https://viettopcare.vn/wp-content/uploads/2017/08/thay-man-hinh-iphone-7-7-plus-1.jpg', N'Linh kiện màn hình, mặt kính cảm ứng iPhone 7,7 Plus sử dụng để thay thế đều là hàng zin linh kiện chính hãng và được kiểm tra chất lượng kỹ càng.
Được hỗ trợ bởi các trang thiết bị công nghệ cao, đội ngũ kỹ thuật viên giỏi, cứng tay nghề.
Được tư vấn nhiệt tình, tìm những giải pháp hợp lý tốt nhất, tiết kiệm nhất dành cho bạn.
Quý khách hàng sẽ được giám sát toàn bộ quá trình thay màn hình iPhone 7, 7 Plus.
Bảo hành vĩnh viễn đối với những trường hợp thay mặt kính.
Nhiều chế độ ưu đãi, tặng Giftcard, tăng thời gian bảo hành', 10);
INSERT INTO TrangChu(id_trangchu, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang)
VALUES(4, N'Ốp lưng', 001, 120000, 120, N'https://shopop.vn/wp-content/uploads/2020/10/24-04-2020-1587696699-0-600x600.jpg', N'Mặt ốp thiết kế trong suốt nên sẽ không che mất các thiết kế mặt sau nguyên thuỷ của dế yêu, Đồng thời với Viền ốp thiết kế Chống Sốc tạo độ an toàn tuyệt đối khi rơi rớt
Chất liệu ốp : Dẻo trong suốt, Viền Chống Sốc
Bảo vệ điện thoại tốt', 0);
INSERT INTO TrangChu(id_trangchu, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang)
VALUES(5, N'Tai nghe', 001, 440000, 200, N'https://chiemtaimobile.vn/images/thumbnails/600/600/detailed/27/tai-nghe-bluetooth-true-wireless-hoco-ew03-cool-pro__2_.jpg', N'Ưu điểm của Tai nghe Bluetooth True Wireless Hoco EW03 Cool Pro
Là phiên bản tai nghe không dây mới nhất đến từ nhà Hoco, EW03 Cool Pro TWS sở hữu kích thước mini, ngoại hình được tối giản, chất âm cải thiện đáng kể cùng thời lượng pin khá tốt, tính năng kết nối Pop-up cùng thay đổi tên cũng là những điểm nhấn tuyệt vời cho sản phẩm này.
Ngoại hình nhỏ gọn, thanh lịch
Giống như phiên bản tiền nhiệm Hoco ES49, phiên bản tai nghe EW03 Cool Pro TWS sở hữu tone trắng chủ đạo đi kèm thiết kế nhỏ gọn và linh hoạt với các chi tiết được hoàn thiện tỉ mỉ cho cảm giác cầm nắm thoải mái và chắc chắn. Bên cạnh đó, tai nghe được trang bị thiết kế earbuds cho khả năng bám vừa vặn với đường viền tai, trọng lượng nhẹ nên người dùng luôn cảm thấy thoải mái khi sử dụng trong thời gian dài.
Chất âm cải thiện, kết nối bluetooth ổn định
Tai nghe bluetooth Hoco EW03 được cải tiến đáng kể về chất âm, đem đến cho người nghe trải nghiệm tuyệt vời ở nhiều thể loại âm nhạc khác nhau. Bên cạnh đó tai nghe được trang bị chuẩn bluetooth mới nhất V5.1  cùng các giao thức hỗ trợ như rảnh tay, A2DP, AVRCP... cho tín hiệu ổn định khi kết nối với smartphone ở khoảng cách tối đa lên tới 10m. Đặc biệt, tai nghe không dây EW03 được trang bị tính năng tự động kết nối pop-up trên thiết bị iPhone, iPAD,...
Thời lượng pin dài, điều khiển cảm ứng mượt mà
Ngoài ra, tai nghe True Wireless Hoco EW03 của Hoco cũng sở hữu phím điều khiển cảm ứng có độ chính xác cao, cho thao tác mượt mà cả ở hai bên tai nghe giúp người dùng dễ dàng thực hiện trả lời/ từ chối cuộc gọi, đánh thức trợ lý giọng nói, tạm dừng/ phát nhạc,…
Hoco EW03 Cool Pro sở hữu dung lượng pin khá lớn. Cụ thể mỗi tai nghe đơn có dung lượng khoảng 30mAh và dung lượng dock sạc là 300mAh. Với khoảng 1 giờ sạc, tai nghe cho thời gian sử dụng để đàm thoại hoặc nghe nhạc liên tục lên tới 4 giờ, và thời gian chờ lên tới 200 giờ khá ấn tượng.
THÔNG SỐ
Thương hiệu	Hoco
Model	EW03
Bluetooth	V5.1
Hỗ trợ giao thức	tai nghe, rảnh tay, A2DP, AVRCP
Khoảng cách kết nối	10m
Tần số	2.4GHz
Điện áp sạc	DC 5V
Thời gian sạc	khoảng 1 giờ
Thời gian đàm thoại/ nghe nhạc	khoảng 4 giờ
Thời gian chờ	200 giờ
Dung lượng pin dock sạc	300mAh
VIDEOS
', 0);
INSERT INTO TrangChu(id_trangchu, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang)
VALUES(6, N'Sạc điện thoại', 001, 800000, 200, N'https://macinsta.vn/wp-content/uploads/2019/12/IS15-3-510x510.jpg', N'Đế sạc nhanh không dây đa năng 4in1 Q20
Sạc nhanh không dây, sạc cùng lúc cho 2 điện thoại + Apple Watch + Airpods
Sản phẩm kèm củ sạc nhanh 27W (9V/3A), bạn có thể sử dụng đế sạc này để sạc cho mọi thiết bị điện thoại không dây, Apple Watch, Airpods mà không cần phải sử dụng thêm bất cứ cáp sạc, củ sạc ngoài nào khác
Vị trí sạc không dây cho điện thoại có thể sử dụng để sạc không dây cho Airpods 2/Airpods Pro
Sạc nhanh không nóng
Tiện lợi: Sạc điện thoại đặt nằm dọc hoặc nằm ngang giúp bạn giải trí dễ dàng: Xem phim, đọc sách, gọi video call,…', 12)
INSERT INTO TrangChu(id_trangchu, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang)
VALUES(7, N'Túi đựng điện thoại chống nước', 001, 40000, 200, N'https://banbuonsieure.com/wp-content/uploads/2015/09/tui-chong-nuoc-cho-dien-thoai-5.jpg', N'Túi chống nước Cosano 5 inch là phụ kiện lý tưởng với giá cả hợp lý, thích hợp cho người dùng mỗi khi đi bơi, đi du lịch hay đi dưới mưa.
Thiết kế tiện lợi
Túi chống nước Cosano được thiết kế để đảm bảo an toàn cho điện thoại từ 5 inch trở xuống không bị dính nước, với chất liệu nilon chống thấm trong suốt. 
Ngoài ra sản phẩm còn được trang bị thêm dây đeo tiện lợi có thể gấp gọn cho vào trong túi sau khi sử dụng, giúp mang theo điện thoại bên mình mọi lúc mọi nơi.
Phù hợp mọi người dùng, mọi lứa tuổi
Sản phẩm có thiết kế rất dễ sử dụng phù hợp với mọi lứa tuổi, ai cũng có thể dùng dễ dàng giúp bạn yên tâm trong mỗi chuyến du lịch, tắm biển hay đi mưa.
', 20)
INSERT INTO TrangChu(id_trangchu, tensanpham, masp, giasp, soluong, hinhanh, tomtat, tinhtrang)
VALUES(8, N'Pin điện thoại', 001, 300000, 200, N'https://img.websosanh.vn/v2/users/root_product/images/pin-dien-thoai-iphone-6s-plus/1r0sDxvBpTwH.jpg', N'Pin là một bình chứa nhỏ chứa năng lượng hóa học. Khi sạc điện thoại, dòng điện được sử dụng để thiết lập các phản ứng hóa học, vận chuyển các electron từ anode tích điện âm đi tới cathode tích điện dương nằm phía cuối viên pin.', 10, N'Thanh toán bằng tiền mặt')
SELECT * FROM TrangChu

INSERT INTO Orders( id_order, tenkhachhang, dienthoai,  diachi,    tensanpham,  soluongmua  ,trangthai,giasp,hinhanh,tongtien,phuongthucthanhtoan)
VALUES( 1,   N'Biền Xuân Thắng', '0339475274',  N'Đà Nẵng' , N'Phụ kiện trang trí thủ công',       1,          N'Chờ xác nhận' ,125000,'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQAELyCwkcpP_D13-15-_RYZRLUQu2lQ4CSrQtVPc1_rxruCSB33Sy12r5s4xB-pLWJ930DWYwRa-85sa_RE7p0z_eLsibBZpgpYnGjVSE&usqp=CAc.jpg',125000,N'InternetBanking')
INSERT INTO Orders( id_order, tenkhachhang, dienthoai,  diachi,    tensanpham,  soluongmua ,trangthai,giasp,hinhanh,tongtien,phuongthucthanhtoan)
VALUES( 2,   N'Doãn Văn Nam', '0374839463',  N'Đà Nẵng' , N'Màn hình iphone',       1,         N'Chờ xác nhận' ,350000,'https://p-vn.ipricegroup.com/247307e0d16e337337db6004475f30b45b755253_0.jpg?position=5.jpg',350000, N'Thanh toán bằng tiền mặt')
SELECT * FROM Orders