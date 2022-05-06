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


--------------------------------------------- Tablo Oluþturma ---------------------------------------------------------------------
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

------------------------------------------------- VÝEWS -------------------------------------------------
go
create table YorumLog
( 
	ID int,
	Yorum nvarchar(max),
	OlusturmaTarihi datetime,
	SilmeTarihi datetime
)
go
-------------------------------------------------VÝEWS------------------------------------------------------------------------------
create view "Yonetmenler-ve-filmleri" as
select YonetmenAdi,FilmAdi from Filmler  f inner join Yonetmenler y on y.YonetmenId=f.YonetmenId
go
create view "kullanýcýnýn favorileri" as
select k.KullaniciAd,f.FilmAdi,fav.KullaniciPuani from Favoriler fav inner join 
Kullanicilar k on k.KullaniciId = fav.KullaniciId 
	inner join Filmler f on f.FilmId=fav.FilmId
go
create view "Kullanici-Bilgisi" as
select k.UyelikAdi,k.KullaniciAd,k.KullaniciSoyad,k.Cinsiyet from Kullanicilar k
go

create view "kategori-fav-sayýsý"
as
select k.KategoriAdi, COUNT(*) [sayýsý]from Favoriler fv inner join Filmler f 
	on fv.FilmId = f.FilmId
	inner join FilmTurleri ft
	on ft.FilmId=f.FilmId
	inner join Kategoriler k
	on k.KategoriId=ft.kategoriId
	group by k.KategoriAdi
	
go

create view "filmler ve kategroiler" as
select  f.FilmAdi,k.KategoriAdi from FilmTurleri ft inner join Filmler  f
on ft.FilmId=f.FilmId
inner join  Kategoriler k
on ft.kategoriId=k.KategoriId
go

------------------------------------------------- STORED PROCEDURES -------------------------------------------------
go
create proc sp_KullanýcýGetir(@id int) as
select *from Kullanicilar where KullaniciId=@id
go
create proc sp_KullanýcýYorumSayisi(@id int, @count int output) as
select @count=COUNT(*) from Yorumlar where KullaniciId =@id

go
----örnek kullaným--------------------------
--declare @x int 
--exec sp_KullanýcýYorumSayisi 1, @x output
--print @x
------------------------------------------

create proc sp_FilminKategorisi(@filmAdi nvarchar(max)) as
select k.KategoriAdi from FilmTurleri ft inner join kategoriler k
on k.KategoriId=ft.kategoriId
inner join Filmler f on f.FilmId=ft.FilmId
where f.FilmAdi = @filmAdi

go
------------örnek kullaným-----------------
--exec sp_FilminKategorisi 'eyes wide shut'


create proc sp_OyuncuFilmleriGetir(@ad nvarchar(max) , @soyad nvarchar(max)) as
select f.FilmAdi,o.OyuncuAdi,o.OyuncuSoyAdi, oyuncuflim.Karakteri from OyuncuFilmografi oyuncuflim inner join Oyuncular o
on oyuncuflim.OyuncuId =o.OyuncuId
inner join filmler f on f.FilmId =oyuncuflim.FilmId
where OyuncuAdi = @ad and OyuncuSoyAdi=@soyad
go

-------------örnek kullaným------------------
--exec sp_OyuncuFilmleriGetir 'orlando','bloom'


------------------------------------------------- Trigger ------------------------------------------------------------------------

--silinen yorumu yorumloglara eklemek 

Create Trigger triggerYorumlar
on Yorumlar
after delete
as
declare @Id nvarchar(max), @yorum nvarchar(max),@Olusmatarih datetime
select  @Id=KullaniciId,@yorum=YorumText,@Olusmatarih=YorumTarih from deleted
insert YorumLog Values(@Id,@yorum,@Olusmatarih,GETDATE())
go
--Yorum update edilirse yorumun eski halini yorum loglara eklemek
create Trigger YorumUpdate
on Yorumlar
for update
as
declare @Id nvarchar(max), @yorumEskiYorum nvarchar(max),@Olusmatarih datetime
select  @Id=KullaniciId,@yorumEskiYorum =YorumText,@Olusmatarih=YorumTarih from deleted
insert YorumLog Values(@Id,@yorumEskiYorum+'##update##',@Olusmatarih,GETDATE())



