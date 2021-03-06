USE [master]
GO
/****** Object:  Database [QLBANLKDT]    Script Date: 14/10/2017 11:27:35 SA ******/
CREATE DATABASE [QLBANLKDT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBANLKDT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLBANLKDT.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLBANLKDT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLBANLKDT_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBANLKDT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBANLKDT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBANLKDT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBANLKDT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBANLKDT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBANLKDT] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBANLKDT] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLBANLKDT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBANLKDT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBANLKDT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBANLKDT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBANLKDT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBANLKDT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBANLKDT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBANLKDT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBANLKDT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLBANLKDT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBANLKDT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBANLKDT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBANLKDT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBANLKDT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBANLKDT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBANLKDT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBANLKDT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLBANLKDT] SET  MULTI_USER 
GO
ALTER DATABASE [QLBANLKDT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBANLKDT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBANLKDT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBANLKDT] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QLBANLKDT]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 14/10/2017 11:27:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[UserAdmin] [varchar](30) NOT NULL,
	[PassAdmin] [varchar](30) NOT NULL,
	[Hoten] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHITIETDONTHANG]    Script Date: 14/10/2017 11:27:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDONTHANG](
	[MaDonHang] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[Soluong] [int] NULL,
	[Dongia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_CTDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 14/10/2017 11:27:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[Dathanhtoan] [bit] NULL,
	[Tinhtranggiaohang] [bit] NULL,
	[Ngaydat] [datetime] NULL,
	[Ngaygiao] [datetime] NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HangSanXuat]    Script Date: 14/10/2017 11:27:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HangSanXuat](
	[MaHSX] [int] IDENTITY(1,1) NOT NULL,
	[TenNSX] [nvarchar](50) NOT NULL,
	[Diachi] [nvarchar](200) NULL,
	[DienThoai] [varchar](50) NULL,
 CONSTRAINT [PK_HangSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaHSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 14/10/2017 11:27:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Taikhoan] [varchar](50) NULL,
	[Matkhau] [varchar](50) NOT NULL,
	[Email] [varchar](100) NULL,
	[DiachiKH] [nvarchar](200) NULL,
	[DienthoaiKH] [varchar](50) NULL,
	[Ngaysinh] [datetime] NULL,
 CONSTRAINT [PK_Khachhang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 14/10/2017 11:27:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ChuDe] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 14/10/2017 11:27:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NOT NULL,
	[Giaban] [decimal](18, 0) NULL,
	[Mota] [nvarchar](max) NULL,
	[Anhbia] [varchar](50) NULL,
	[Ngaycapnhat] [datetime] NULL,
	[Soluongton] [int] NULL,
	[MaLoai] [int] NULL,
	[MaHSX] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Admin] ([UserAdmin], [PassAdmin], [Hoten]) VALUES (N'admin', N'123456', N'caominhhuy')
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (1, 1, 1, CAST(3000000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (1, 6, 1, CAST(469000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (3, 2, 2, CAST(3000000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[DonDatHang] ON 

INSERT [dbo].[DonDatHang] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1, 0, 0, CAST(N'2017-10-15 00:00:00.000' AS DateTime), CAST(N'2017-10-20 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[DonDatHang] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (3, 0, 0, CAST(N'2017-10-16 00:00:00.000' AS DateTime), CAST(N'2017-10-20 00:00:00.000' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
SET IDENTITY_INSERT [dbo].[HangSanXuat] ON 

INSERT [dbo].[HangSanXuat] ([MaHSX], [TenNSX], [Diachi], [DienThoai]) VALUES (1, N'Beat', N'197 Trần Hưng Đạo', N'98877668')
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenNSX], [Diachi], [DienThoai]) VALUES (2, N'Sanny', N'179 Chánh hưng - F.4 - Q.8 Tp.HCM', N'19001611')
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenNSX], [Diachi], [DienThoai]) VALUES (3, N'Flying Colors', N'45 Lý Thái Tổ-F2.Q.3 Tp.HCM', N'19001570')
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenNSX], [Diachi], [DienThoai]) VALUES (4, N'Logitech', N'179 Chánh Hưng F.4 Q.8 Tp.HCM', N'8504122')
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenNSX], [Diachi], [DienThoai]) VALUES (5, N'AK RACING', NULL, N'0901800')
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenNSX], [Diachi], [DienThoai]) VALUES (6, N'Corsair', NULL, N'19008080')
SET IDENTITY_INSERT [dbo].[HangSanXuat] OFF
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienthoaiKH], [Ngaysinh]) VALUES (1, N'Huỳnh Minh Hiền', N'hien221296', N'123456', N'hien@gmail.com', N'131 Xuyên Mộc', N'01227597156', CAST(N'1996-12-22 00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienthoaiKH], [Ngaysinh]) VALUES (2, N'Bùi Huy Chuối', N'cucai2', N'456789', N'chuoicho@gmail.com', N'153 Tân Bình /Hồ Chí Minh', N'01227597157', CAST(N'1996-05-23 00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienthoaiKH], [Ngaysinh]) VALUES (4, N'Nguyễn Hoàng Duy', N'cucai1', N'1234567', N'duycucung@gmail.com', N'123 Ung Văn Khiêm / Bình Thạnh', N'01227597158', CAST(N'1999-05-05 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
SET IDENTITY_INSERT [dbo].[LoaiSP] ON 

INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (1, N'Tai nghe')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (2, N'Chuột gaming')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (3, N'Bàn phím giả cơ')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (4, N'Bàn phím cơ')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (5, N'Ghế gaming')
SET IDENTITY_INSERT [dbo].[LoaiSP] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaHSX]) VALUES (1, N'Ghế xoay GH01', CAST(3000000 AS Decimal(18, 0)), N'Chất liệu: Da PU + PVC

* Kê tay: có thể nâng lên – hạ xuống, xoay trái – phải

* Khung chân: nhựa, viền đen, bánh xe lớn, KÊ CHÂN

* Trọng lượng tối đa: 150kg

* Ngả lưng 170*

* Phụ kiện đi kèm: đệm kê lưng bằng PU, dụng cụ, ốc.

Bảo hành: 24 tháng', N'Gh01.jpg', CAST(N'2017-09-30 00:00:00.000' AS DateTime), 10, 5, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaHSX]) VALUES (2, N'Ghế gaming G73', CAST(1500000 AS Decimal(18, 0)), N'Ghế khung SẮT bọc da và lưới

LƯỚI CHỊU LỰC SIÊU BỀN

Nệm mút đúc nguyên khối không xẹp

Chân quỳ ống cỡ 32 cực lớn

Tích hợp bộ ngả lưng của xe hơi, ngả được 170 độ

Cảm giác ngồi và nằm vô cùng dễ chịu

Kiểu dáng hiện đại, sang trọng

Màu sắc đa dạng

Độ bền cực cao

Dễ dàng thay thế linh kiện

Tháo lắp đơn giản, dễ vận chuyển', N'Gh02.jpg', CAST(N'2017-09-30 00:00:00.000' AS DateTime), 15, 5, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaHSX]) VALUES (6, N'Chuột Có Dây Logitech G102 - Gaming', CAST(469000 AS Decimal(18, 0)), N'Độ phân giải quang học	200 - 6.000 DPI
Kiểu giao tiếp	USB
SKU	6704175027186
Thương hiệu	Logitech
Sản xuất tại	Trung Quốc
Model	910-004846
Kích thước	116.6 x 62.15 x 38.2 (mm) Bảo hành:12 tháng ', N'Ch01.jpg', CAST(N'2017-09-30 00:00:00.000' AS DateTime), 100, 2, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaHSX]) VALUES (7, N'Chuột Logitech Proteus Spectrum RGB G502 Có Dây - Gaming', CAST(1600000 AS Decimal(18, 0)), N'Độ phân giải cao từ 200DPI lên tới 12.000DPI
Chuột Có Dây Logitech Proteus Spectrum RGB G502 - Gaming giúp bạn không phải dừng lại khi đang chơi để điều chỉnh DPI. Bạn có thể chỉnh 5 mức thiết lập DPI, từ siêu chính xác ở 200 DPI hoặc cực nhanh ở 12.000 DPI cho bạn những cú click chuột cực kỳ ấn tượng.

Chuột Có Dây Logitech Proteus Spectrum RGB G502 - Gaming


Kiểu dáng ấn tượng
Chuột có thiết kế khá lạ, không to bè như xu thế thiết kế chuột chung trên thị trường hiện nay mà thuôn gọn và có phần dài dơn so với các mẫu chuột khác. Chuột có thiết kế công thái dành riêng cho người dùng thuận tay phải. Và với hình dáng như vậy, G502 phù hợp nhất với người dùng cầm chuột theo kiểu Palm Grip. Hông phải với phần bọc cao su nhám cùng các vân tam giác cho cảm giác bám tay hơn khi cầm. Lưng chuột có độ cao vừa phải, phù hợp với người dùng có cỡ tay trung bình.

Trang bị đèn LED RGB 16.8 triệu màu
G502 được trang bị led RGB nên người dùng có thể thoải mái tùy chỉnh tới 16.8 triệu màu. Đây cũng là nơi quản lý các chế độ led (bao gồm 2 chế độ: Color Cycle và Breathing Effect) và các vùng led (bao gồm logo và nút báo mức DPI) trên chuột.

Thiết kế hiện đại
Phần thân chính được phủ nhung cùng với các bộ phận phủ cao su làm việc khá tốt, cảm giác cầm rất bám tay. Dù có thiết kế khá lạ nhưng G502, với tính năng thay đổi trọng lượng với bộ tạ đi kèm, vẫn không gây mỏi tay khi sử dụng lâu. Switch chuột có độ nặng vừa phải và độ nảy tốt, khá vừa tay. Các nút phụ cũng được bố trí khá tốt, dễ sử dụng. Nút cuộn to, được trang bị các vân nổi nên sử dụng khá nhẹ. Đặc biệt là hai chế độ khác nhau phù hợp với từng mục đích sử dụng khác nhau.

Chuột Có Dây Logitech Proteus Spectrum RGB G502 - Gaming


Thông số kỹ thuật
- Cảm biến: quang học Pixart PMW3366

- DPI: 200 – 12000

- Tần số phản hồi: 125/250/500/1000Hz

- Kết nối: USB, dây dẫn bọc lưới chống cắt

- LED: LED RGB 16.8 triệu màu

- Chip xử lý ARM 32-bit

- 11 nút lập trình được

- Nút cuộn (Scroll Wheel) hai chế độ

- Kích thước: 132mm x 75mm x 40mm

- Trọng lượng: 121g (đi kèm bộ 6 tạ với 3.6g mỗi tạ)', N'Ch02.jpg', CAST(N'2017-09-30 00:00:00.000' AS DateTime), 50, 2, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaHSX]) VALUES (8, N'TAI NGHE BEATS MIXR CHÍNH HÃNG NOBOX – BLACK', CAST(2100000 AS Decimal(18, 0)), N'Tai nghe beatsmixr chính hãng đã qua sử dụng còn mới 99%, đầy đủ phụ kiện: cáp, hộp đựng. Đây là cơ hội sở hữu tai nghe beats mixr chính hãng để chơi DJ hoặc nghe nhạc tuyệt vời nhất hiện nay, bởi âm thanh mà tai nghe beats mixr mang lại.

Bảo hành: 12 tháng âm thanh
Giá khuyến mãi: 2.190.000đ cho đến hết tháng 6/2017
Miễn phí giao hàng toàn quốc
Hotline: 0907100116', N'TN01.jpg', CAST(N'2017-09-30 00:00:00.000' AS DateTime), 20, 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaHSX]) VALUES (9, N'TAI NGHE CHUYÊN GAME SANNY K8', CAST(500000 AS Decimal(18, 0)), N'Thiết kế chuyên game, trùm kín không gây đau tai
Kiểu dáng đẹp, dây bọc kim tuyến to và chống đứt
Đai vòng qua đầu được gắn nhựa khá êm ái
Đặc biệt nút chỉnh Volume trên thân tai, có đèn Led 
Ốp tai được làm bắng chất liệu da nguyên chất , khó bị rã , sơn tĩnh điện cao cấp  không giống 1 vài sản phẩm ngoài thị trường
Chất lượng âm thanh nghe cực hay
Bass, tress, mở to không bị ù và rè loa 50mm khuyêch đại 55mm
 Dây tai nghe với đường kính 7mm, dài 2.4m,  có bỏ vỏ nhựa chắc chắn bên ngoài. Điều đó khiến dây không bị xoắn trong quá trình sử dụng , khó đứt và bền hơn hẳn', N'TN03.jpg', CAST(N'2017-09-30 00:00:00.000' AS DateTime), 30, 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaHSX]) VALUES (10, N'Bàn Phím Cơ Logitech G810 Orion Spectrum RGB', CAST(2900000 AS Decimal(18, 0)), N'Bảo hành: 24 tháng (1 đổi 1)
Switches: Romer-G (độc quyền của Logitech nghiên cứu và sản xuất)
Bàn phím cơ với Led RGB 16,8 triệu màu
Kết nối: USB 2.0
Keycaps: Nhựa ABS
Dây cable: Dài 1,8 m
Cân nặng: 1180g
Kích thước: 153 x 443.5 x 343 mm', N'BP01.jpg', CAST(N'2017-09-30 00:00:00.000' AS DateTime), 50, 4, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaHSX]) VALUES (11, N'Bàn Phím Flying Color K8 (Giả cơ, LED 7 màu)', CAST(500000 AS Decimal(18, 0)), N'Bàn phím Flying Color K8 Giả cơ Led 7 màu chuyên cho game thủ
+ Bàn phím cực đẹp, cực chất thiết kế chuẩn cho game thủ chuyên nghiệp
+ Phím gõ cao, được thiết kế giả cơ với âm thanh nghe cực thích tai
+ Hệ thống đèn Led 7 màu hỗ trợ game thủ chơi đêm (LED xuyên phím) nhìn rõ phím hơn
+ Hệ thống hỗ trợ gồm phím tăng giảm âm lượng ngay trên bàn phím, không phải thoát ra để điều chỉnh âm lượng khi chơi game
+ Có thể điều chỉnh độ sáng cho phù hợp, tránh lóa mắt', N'BP02.jpg', CAST(N'2017-09-30 00:00:00.000' AS DateTime), 50, 3, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaHSX]) VALUES (12, N'Chuột Corsair Gaming M65 Pro RGB White', CAST(1630000 AS Decimal(18, 0)), N'Là phiên bản kế thừa của dòng M65 đạt nhiều giải thưởng, thiết kế bổ sung thêm hệ thống RGB LED.
- Ba khu đèn nền được tùy biến đến 16.8 triệu màu sắc.

- Hiển thị mốc DPI bằng màu sắc cho khả năng điều khiển tuyệt vời với các mức quen thuộc cho game thủ.
- Cảm biến cao cấp 100DPI – 12.000DPI tùy chỉnh được để phù hợp với bất cứ game thủ nào dù là người khó tính nhất.
- Cấu tạo nhôm nguyên khối cực nhẹ và bền.

- Hệ thống điều chỉnh cân nặng có khả năng thiết lập lại tâm của trọng lực cho mọi cỡ tay.
- 8 phím gán thông minh bao gồm cả nút bắn tỉa có thể lập trình để thay đổi DPI nhanh trong 1 giây.
- Cải thiện nút bắn tỉa cho hiệu quả tốt hơn.

 

Thông số kỹ thuật

 

Mắt đọc : Quang học
Đèn led RGB : Tại 3 khu vực
DPI : 100DPI – 12.000DPI
Số nút : 8
Report Rate : 1000Hz/500Hz/250Hz/12
Trọng lượng : 135.5g ( 115g không tính dây)
Feet : PTFE
Cáp dài : 1.8m
Kích thước : 118mm x 72mm x 39mm', N'CH03.jpg', CAST(N'2017-10-04 00:00:00.000' AS DateTime), 20, 2, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaHSX]) VALUES (13, N'Chuột Corsair Scimitar Pro RGB', CAST(2350000 AS Decimal(18, 0)), N'Thông số kỹ thuật:

 

DPI: 1 dpi - 16000 dpi

Sensor Type: Optical

Mouse Backlighting: 4 Zone RGB

Programmable Buttons: 17

Report Rate: Selectable 1000Hz/500Hz/250Hz/125Hz

On-board Memory: Yes

Weight: 147g

Mouse Feet: Extra Large PTFE

Dimensions: 119.4mm x 77mm x 42.4mm

CUE Software: Enabled

Cable: 1.8m Braided Fiber

Game Type: MOBA, MMO', N'CH04.jpg', CAST(N'2017-10-04 00:00:00.000' AS DateTime), 20, 2, 6)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__KHACHHAN__7FB3F64F31D9EB9B]    Script Date: 14/10/2017 11:27:35 SA ******/
ALTER TABLE [dbo].[KHACHHANG] ADD UNIQUE NONCLUSTERED 
(
	[Taikhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__KHACHHAN__A9D10534EF4348BD]    Script Date: 14/10/2017 11:27:35 SA ******/
ALTER TABLE [dbo].[KHACHHANG] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETDONTHANG_DonDatHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonDatHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[CHITIETDONTHANG] CHECK CONSTRAINT [FK_CHITIETDONTHANG_DonDatHang]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETDONTHANG_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CHITIETDONTHANG] CHECK CONSTRAINT [FK_CHITIETDONTHANG_SanPham]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_Khachhang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_Khachhang]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_HangSanXuat] FOREIGN KEY([MaHSX])
REFERENCES [dbo].[HangSanXuat] ([MaHSX])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_HangSanXuat]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_LoaiSP] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiSP] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_LoaiSP]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD CHECK  (([Dongia]>=(0)))
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD CHECK  (([Soluong]>(0)))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([Giaban]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [QLBANLKDT] SET  READ_WRITE 
GO
