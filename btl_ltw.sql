create database btl_ltw


use btl_ltw



create table tblNguoiDung(
	sEmail nvarchar(255) primary key,
	sMatKhau nvarchar(255)
)

create table tblFormKhaoSat(
	iFormID int primary key Identity,
	sEmail nvarchar(255),
	sTenForm nvarchar(255),
	sMoTa nvarchar(255),
	foreign key (sEmail) references tblNguoiDung(sEmail)

)

create table tblCauHoi(
	iCauHoiID int primary key identity,
	iFormID int,
	sNoiDung nvarchar(255),
	sKieuCauHoi nvarchar(255),
	foreign key (iFormID) references tblFormKhaoSat(iFormID)

)

create table tblCauTraLoi (
	iCauTraLoiID int primary key identity,
	--sEmail nvarchar(255),
	iCauHoiID int,
	sNoiDung nvarchar(255),
	--foreign key (sEmail) references tblNguoiDung(sEmail),
	foreign key (iCauHoiID) references tblCauHoi(iCauHoiID)
)

create table tblTraLoiForm (
	iTLFormID int primary key identity,
	iFormID int,
	foreign key (iFormID) references tblFormKhaoSat(iFormID)
)

create table tblCT_TraLoiForm (
	iCTTLFID int primary key identity,
	iTLFormID int,
	iCauHoiID int,
	iCauTraLoiID int null,
	sNoiDung nvarchar(255) null,
	foreign key (iTLFormID) references tblTraLoiForm(iTLFormID),
	foreign key (iCauHoiID) references tblCauHoi(iCauHoiID),
	foreign key (iCauTraLoiID) references tblCauTraLoi(iCauTraLoiID)

)

drop table tblCauTraLoi


create procedure st_dangKyTaiKhoan (@email nvarchar(255), @mk nvarchar(255))
as
begin 
	insert into tblNguoiDung values (@email, @mk)
end


insert into tblNguoiDung values ('dd','ddd')
insert into tblFormKhaoSat values ('1@gmail.com','Khao sat test 2', 'form nay chi de test thoi 2')

select * from tblNguoiDung
delete from tblNguoiDung where sEmail = 'dd'

execute st_dangKyTaiKhoan '1@gmail.com','1'

select count(*) from tblNguoiDung where sEmail = 'dd' and sMatKhau = 'ddd'


create procedure sp_GetFormFromEmail (@email nvarchar(255))
as 
begin
	Select * from tblFormKhaoSat where sEmail = @email
end

execute sp_GetFormFromEmail "1@gmail.com"