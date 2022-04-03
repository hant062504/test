use master
go

create database BanSach
go

use BanSach
go

create table LoaiSach(
	MaLoai nchar(10) primary key not null,
	TenLoai nvarchar(250)
)

create table NhaXuatBan(
	MaNXB nchar(10) primary key not null,
	TenNXB nvarchar(250),
	GioiThieu ntext
)

create table KhuyenMai(
	MaKhuyenMai nchar(10) primary key not null,
	PhanTramGiamGia bigint,
	NgayBatDau dateTime,
	NgayKetThuc dateTime
)

create table Sach(
	MaSach nchar(10) primary key not null,
	TenSach nvarchar(250),
	GiaTien money,
	Anh nvarchar(10),
	SoLuongCo int,
	NgayNhap dateTime,
	BanChay int,
	Mota ntext,
	MaLoai nchar(10),
	MaNXB nchar(10),
	MaKhuyenMai nchar(10),
	constraint FK_s_nxb foreign key(MaNXB) references NhaXuatBan(MaNXB),
	constraint FK_s_ls foreign key(MaLoai) references LoaiSach(MaLoai),
	constraint FK_s_km foreign key(MaKhuyenMai) references KhuyenMai(MaKhuyenMai)
)

create table KhachHang(
	MaKH nchar(10) primary key not null,
	TenDangNhap nvarchar(250),
	MatKhau nchar(50),
	HoTen nvarchar(50),
	Gioitinh nvarchar(5),
	DiaChi nvarchar(150),
	SDT nchar(10),
	Email nvarchar(250)
)

create table DonHang(
	MaDonHang nchar(10) primary key not null,
	NgayLap dateTime,
	MaKH nchar(10),
	ThanhTien money,
	PhiVanChuyen money,
	TongTien money,
	TinhTrang nvarchar(100),
	MaSach nchar(10),
	DiaChiNhanHang nvarchar(250),
	constraint FK_kh_dh foreign key(MaKH) references KhachHang(MaKH),
	constraint FK_s_dh foreign key(MaSach) references Sach(MaSach)

)
