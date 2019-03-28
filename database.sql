create database QLKSC
go
use QLKSC
go

--table chuc vu

create table chucvu(
	macv char(2) primary key,
	tencv nvarchar(30) not null
)
go
insert into chucvu values('GD',N'Giám đốc')
insert into chucvu values('PD',N'Phó Giám đốc')
insert into chucvu values('KT',N'Kế toán')
insert into chucvu values('TK',N'Thư ký')
insert into chucvu values('LT',N'Lễ tân')
insert into chucvu values('PV',N'Phụ vụ')
insert into chucvu values('BV',N'Bảo vệ')

go

--table nhanvien

create table nhanvien(
	manv char(5) primary key,
	macv char(2) foreign key references chucvu(macv) not null,
	hoten nvarchar(30) not null,
	ngaysinh date check(ngaysinh < getdate()) not null,
	gioitinh nvarchar(3) check(gioitinh in(N'Nam',N'Nữ')) not null,
	sdt varchar(12) check(sdt like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' or sdt like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') not null,
	cmnd char(9) check(cmnd like '[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') unique not null,
	diachi nvarchar(50) not null,
	email varchar(30) unique check(email  like '[a-z]%@[a-z]%.[a-z]%')
)
go
insert into nhanvien values('NV001','GD',N'Nguyễn Hùng',convert(date,'05/05/1975',105),N'Nam','01223503050','212555667',N'Hải Châu, Đà Nẵng','hungnguyen@gmail.com')
insert into nhanvien values('NV002','LT',N'Nguyễn Hoàng Anh',convert(date,'02/02/1985',105),N'Nữ','01223503052','212555666',N'Hải Châu, Đà Nẵng','hoanganh@gmail.com')
insert into nhanvien values('NV003','LT',N'Nguyễn Anh Thư',convert(date,'02/06/1988',105),N'Nữ','01223503053','212555668',N'Thanh Khê, Đà Nẵng','anhthu@gmail.com')
insert into nhanvien values('NV004','BV',N'Lê Quốc Bảo',convert(date,'25/12/1978',105),N'Nam','01223503054','212555669',N'Cẩm Lệ, Đà Nẵng','quocbao@gmail.com')
insert into nhanvien values('NV005','PV',N'Nguyễn Hồng Hoa',convert(date,'01/02/1985',105),N'Nữ','01223503055','212555676',N'Hải Châu, Đà Nẵng','honghoa@gmail.com')
insert into nhanvien values('NV006','PD',N'Trần Hoàng Minh',convert(date,'02/02/1978',105),N'Nam','01223503056','212555686',N'Hòa Khánh, Đà Nẵng','hoangminh@gmail.com')
insert into nhanvien values('NV007','KT',N'Nguyễn Ngọc My',convert(date,'02/07/1983',105),N'Nữ','01223503057','212555696',N'Hải Châu, Đà Nẵng','ngocmy@gmail.com')
insert into nhanvien values('NV008','PV',N'Nguyễn Thị Ngọc',convert(date,'12/12/1985',105),N'Nữ','01223503058','212555766',N'Hải Châu, Đà Nẵng','ngocngoc@gmail.com')
insert into nhanvien values('NV009','TK',N'Lê Bảo Trâm',convert(date,'22/02/1985',105),N'Nữ','01223503059','212555866',N'Hải Châu, Đà Nẵng','baotram@gmail.com')
insert into nhanvien values('NV010','PV',N'Nguyễn Ngọc Anh',convert(date,'15/06/1985',105),N'Nam','01223503060','212555966',N'Hải Châu, Đà Nẵng','ngocanh@gmail.com')

go

--table loaiphong

create table loaiphong(
	tenlp varchar(10) primary key,
	soluong int not null,
	giaphong int not null
)
go
insert into loaiphong values('Standard',7,200000)
insert into loaiphong values('Deluxe',6,300000)
insert into loaiphong values('Suite',5,400000)
insert into loaiphong values('Superio',3,500000)

go

--table phong

create table phong(
	maphong char(4) primary key,
	tenlp varchar(10) foreign key references loaiphong(tenlp),
	tinhtrang bit
)
go
insert into phong values('S503','Standard',1)
insert into phong values('S504','Standard',1)
insert into phong values('S505','Standard',1)
insert into phong values('S403','Standard',0)
insert into phong values('S404','Standard',0)
insert into phong values('S405','Standard',0)
insert into phong values('S303','Standard',0)
insert into phong values('S304','Standard',0)
insert into phong values('S305','Standard',0)
insert into phong values('S205','Standard',0)
insert into phong values('D501','Deluxe',1)
insert into phong values('D502','Deluxe',1)
insert into phong values('D401','Deluxe',1)
insert into phong values('D402','Deluxe',1)
insert into phong values('D301','Deluxe',0)
insert into phong values('D302','Deluxe',0)
insert into phong values('D203','Deluxe',0)
insert into phong values('D204','Deluxe',0)
insert into phong values('D104','Deluxe',0)
insert into phong values('D105','Deluxe',0)
insert into phong values('E201','Suite',0)
insert into phong values('E202','Suite',0)
insert into phong values('E103','Suite',0)
insert into phong values('E102','Suite',0)
insert into phong values('E101','Suite',0)
insert into phong values('V001','Superio',1)
insert into phong values('V002','Superio',1)
insert into phong values('V003','Superio',0)
insert into phong values('V004','Superio',0)
insert into phong values('V005','Superio',0)

go

--table khachhang

create table khachhang(
	makh char(5) primary key,
	hoten nvarchar(30) not null,
	cmnd char(9) check(cmnd like '[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') unique not null,
	sdt varchar(12) check(sdt like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' or sdt like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') not null,
	email varchar(30) unique check(email  like '[a-z]%@[a-z]%.[a-z]%'),
	diachi nvarchar(50) not null
)
go
insert into khachhang values('KH001',N'Võ Hoài Linh','222555888','0909050505','hoailinh@yahoo.com',N'Hồ Chí Minh')
insert into khachhang values('KH002',N'Hồ Ngọc Hà','222777511','01668135131','haho@yahoo.com',N'Hồ Chí Minh')
insert into khachhang values('KH003',N'Đàm Vĩnh Hưng','222555782','0909050805','dvh@yahoo.com',N'Hồ Chí Minh')
insert into khachhang values('KH004',N'Hồ Quang Hiếu','222444456','01668135181','hqh@yahoo.com',N'Hồ Chí Minh')
insert into khachhang values('KH005',N'Cao Thái Sơn','229995753','0913050505','thaison@yahoo.com',N'Hồ Chí Minh')
go

--table datphong

create table datphong(
	madp char(5) primary key,
	manv char(5) foreign key references nhanvien(manv) not null,
	makh char(5) foreign key references khachhang(makh) not null,
	tenlp varchar(10) foreign key references loaiphong(tenlp) not null,
	ngaydat date default(getdate()) not null,
	ngayden date default(getdate()) not null,
	ngaydi date default(getdate()) not null,
	tiendatcoc int,
	soluong int not null,
	trangthai bit
)
go
insert into datphong values('DP001','NV002','KH001','Superio',getdate(),convert(date,'08/01/2015',105),convert(date,'08/02/2015',105),100000,2,0)
insert into datphong values('DP002','NV002','KH002','Standard',getdate(),convert(date,'01/03/2015',105),convert(date,'10/03/2015',105),60000,3,0)
insert into datphong values('DP003','NV003','KH003','Deluxe',getdate(),convert(date,'04/05/2015',105),convert(date,'12/05/2015',105),60000,2,0)
insert into datphong values('DP004','NV003','KH004','Deluxe',getdate(),convert(date,'08/01/2015',105),convert(date,'08/02/2015',105),60000,2,0)
insert into datphong values('DP005','NV002','KH005','Suite',getdate(),convert(date,'25/12/2014',105),convert(date,'28/12/2014',105),80000,2,1)

go

--table ctphongdat

create table ctphongdat(
	madp char(5) foreign key references datphong(madp) not null,
	maphong char(4) foreign key references phong(maphong) not null,
	primary key(madp,maphong)
)
go
insert into ctphongdat values('DP001','V001')
insert into ctphongdat values('DP001','V002')
insert into ctphongdat values('DP002','S503')
insert into ctphongdat values('DP002','S504')
insert into ctphongdat values('DP002','S505')
insert into ctphongdat values('DP003','D501')
insert into ctphongdat values('DP003','D502')
insert into ctphongdat values('DP004','D401')
insert into ctphongdat values('DP004','D402')
insert into ctphongdat values('DP005','E201')
insert into ctphongdat values('DP005','E202')

go

--table hoadon

create table hoadon(
	mahd char(5) primary key,
	madp char(5) foreign key references datphong(madp) not null,
	ngaylap date default(getdate()) not null,
	tongtien int not null
)
go

insert into hoadon values('HD001','DP005',getdate(),2400000)

go

--table phanquyen

create table phanquyen(
	id char(1) primary key,
	quyen nvarchar(10) not null
)
go
insert into phanquyen values('A',N'Quản trị')
insert into phanquyen values('B',N'Nhân viên')
insert into phanquyen values('C',N'Khách')

go

--table quyennv

create table quyennv(
	manv char(5) foreign key references nhanvien(manv) not null,
	id char(1) foreign key references phanquyen(id) not null,
	matkhau char(3) not null,
	primary key(manv,id)
)
go
insert into quyennv values('NV001','A','123')
insert into quyennv values('NV002','B','123')
insert into quyennv values('NV003','B','123')
insert into quyennv values('NV004','C','123')
insert into quyennv values('NV005','C','123')
insert into quyennv values('NV006','A','123')
insert into quyennv values('NV007','B','123')
insert into quyennv values('NV008','C','123')
insert into quyennv values('NV009','B','123')
insert into quyennv values('NV010','C','123')

go

create proc gethoadon
	@madp char(5)
as
begin
	select hd.mahd,hd.ngaylap,dp.madp,dp.makh,kh.hoten,dp.tenlp,dp.soluong,dp.ngayden,dp.ngaydi,hd.tongtien
	from hoadon as hd,datphong as dp,khachhang as kh
	where hd.madp=dp.madp and dp.makh = kh.makh and hd.madp = @madp
end

go

create proc getdsnv
as
begin
	select manv,tencv,hoten,ngaysinh,gioitinh,sdt,cmnd,diachi,email
	from nhanvien,chucvu
	where nhanvien.macv = chucvu.macv
end

go

create proc getdskh
as
begin
	select * from khachhang
end