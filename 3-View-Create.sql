use [Filmler-ve-Flimler]
go
create view "Yonetmenler-ve-filmleri" as
select YonetmenAdi,FilmAdi from Filmler  f inner join Yonetmenler y on y.YonetmenId=f.YonetmenId
go
create view "kullanıcının favorileri" as
select k.KullaniciAd,f.FilmAdi,fav.KullaniciPuani from Favoriler fav inner join 
Kullanicilar k on k.KullaniciId = fav.KullaniciId 
	inner join Filmler f on f.FilmId=fav.FilmId
go
create view "Kullanici-Bilgisi" as
select k.UyelikAdi,k.KullaniciAd,k.KullaniciSoyad,k.Cinsiyet from Kullanicilar k
go

create view "kategori-fav-sayısı"
as
select k.KategoriAdi, COUNT(*) [sayısı]from Favoriler fv inner join Filmler f 
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
