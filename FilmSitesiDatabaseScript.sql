use master
go
--veritabaný kontrolü
if exists (select * from sysdatabases where name ='Filmler-ve-Flimler')
	begin
	print 'ayný isimli bir veritabaný mecvut tablolar siliniyor'

	drop database [Filmler-ve-Flimler]
	end
go
create database [Filmler-ve-Flimler]
go
use master
declare @dosyaYolu nvarchar(max)
select @dosyaYolu= filename from master.dbo.sysaltfiles where dbid =1 and fileid=1
select @dosyaYolu=SUBSTRING(@dosyaYolu,0,CHARINDEX('master.mdf',@dosyaYolu))
print 'fiziksel database dosyanýzýn yolu => ' + @dosyaYolu+'filmler-ve-flimler.mdf'
go
SET DATEFORMAT mdy
go


--foreign key constraints
--=> alter table Ogrenciler
--=> add contraint [constraint_name] foreign key (column_name) references [2nd table](column in the 2nd table)
-- ==> on delete cascade
-- ==> on update cascade

--Tablolar

--default constraing eklenebilir
--ikinci versiyonda indexler eklenebilir


--cinsiyet bit  => erkek=true - kadýn=false
use [Filmler-ve-Flimler]
go
Create Table Yonetmenler
(
   YonetmenId int primary key identity(1,1) not null,
   YonetmenAdi nvarchar(max) not null,
   YonetmenSoyAdi nvarchar(max) not null,
   YonetmenDogumTarihi datetime null
)

go
create table Filmler
(
	FilmId int primary key identity(1,1) not null,
	FilmAdi nvarchar(max) not null,
	YayinlanmaTarih datetime null,
	YonetmenId int not null,  --fk yönetmenler tablosu

	Constraint FK_Yonetmen_Id_Filmler foreign key(YonetmenId) references Yonetmenler(YonetmenId)
	on delete cascade on update cascade
)
go
Create Table Kategoriler
(
	KategoriId int primary key identity(1,1),
	KategoriAdi nvarchar(max)
	
)
go
Create Table FilmTurleri
(
	FilmId int not null, --fk
	kategoriId int not null, --fk	
	constraint FK_FilmID_Turler foreign key (FilmId) references Filmler(FilmId)
	on delete cascade on update cascade,
	constraint FK_Kategoriler_Turler foreign key (kategoriId) references Kategoriler(KategoriId)
	on delete cascade on update cascade
)
go 
Create Table Kullanicilar
(
	KullaniciId int primary key identity(1,1) not null,
	UyelikAdi nvarchar(18) not null,
	KullaniciSifre nvarchar(20) not null,
	KullaniciTel nvarchar(11) not null,
	KullaniciAd nvarchar(20) not null,
	KullaniciSoyad nvarchar(20) not null,
	Cinsiyet bit not null
)
go
Create Table Yorumlar
(
	YorumId int primary key identity(1,1) not null,
	KullaniciId int not null, --fk
	FilmId int not null, --fk
	YorumText nvarchar(300) not null,
	YorumTarih datetime not null,
	constraint FK_KullaniciId_Yorumlar foreign key (KullaniciId) references Kullanicilar(KullaniciId)
	on delete cascade,
	constraint FK_FilmID_Yorumlar foreign key (FilmId) references Filmler(FilmId)
	on delete cascade
	

)
go
create Table Favoriler
(
	KullaniciId int not null, --fk
	FilmId int not null, --fk
	KullaniciPuani int not null --check constraint (1-10)
	Constraint DegerAraligi check (KullaniciPuani >= 1 and KullaniciPuani <= 10),
	Constraint FK_KullaniciID_filmler foreign key (FilmId) references Filmler(FilmId)
	on delete cascade,
	Constraint FK_KullaniciId_favoriler foreign key (KullaniciId) references Kullanicilar(KullaniciId)
	on delete cascade

)	

go
Create Table Oyuncular
(
	OyuncuId int primary key identity(1,1) not null ,
	OyuncuAdi nvarchar(25) not null,
	OyuncuSoyAdi nvarchar(25) not null,
	OyuncuDogumTarihi datetime null,
	OyuncuCinsiyet bit not null
)
go
Create Table OyuncuFilmografi
(
	OyuncuId int not null, --fk
	FilmId int not null, --fk
	Karakteri nvarchar(35) null , 
	Constraint FK_FilmId_Filmorgrafi foreign key (FilmId) references Filmler(FilmId)
	on delete cascade,
	Constraint FK_OyuncuId_Filmorgrafi foreign Key (OyuncuId) references Oyuncular(OyuncuId)
	on delete cascade
)

--views
go
create view "Yonetmenler-ve-filmleri" as
select YonetmenAdi,FilmAdi from Filmler  f inner join Yonetmenler y on y.YonetmenId=f.YonetmenId
go
create view "kullanýcýnýn favorileri" as
select k.KullaniciAd,f.FilmAdi,fav.KullaniciPuani from Favoriler fav inner join 
Kullanicilar k on k.KullaniciId = fav.KullaniciId 
	inner join Filmler f on f.FilmId=fav.FilmId
go
create view 