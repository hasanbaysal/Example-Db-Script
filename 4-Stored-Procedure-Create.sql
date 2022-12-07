use [Filmler-ve-Flimler]
go
create proc sp_KullanıcıGetir(@id int) as
select *from Kullanicilar where KullaniciId=@id
go
create proc sp_KullanıcıYorumSayisi(@id int, @count int output) as
select @count=COUNT(*) from Yorumlar where KullaniciId =@id

go
----örnek kullanım--------------------------
--declare @x int 
--exec sp_KullanıcıYorumSayisi 1, @x output
--print @x
------------------------------------------

create proc sp_FilminKategorisi(@filmAdi nvarchar(max)) as
select k.KategoriAdi from FilmTurleri ft inner join kategoriler k
on k.KategoriId=ft.kategoriId
inner join Filmler f on f.FilmId=ft.FilmId
where f.FilmAdi = @filmAdi

go
------------örnek kullanım-----------------
--exec sp_FilminKategorisi 'eyes wide shut'


create proc sp_OyuncuFilmleriGetir(@ad nvarchar(max) , @soyad nvarchar(max)) as
select f.FilmAdi,o.OyuncuAdi,o.OyuncuSoyAdi, oyuncuflim.Karakteri from OyuncuFilmografi oyuncuflim inner join Oyuncular o
on oyuncuflim.OyuncuId =o.OyuncuId
inner join filmler f on f.FilmId =oyuncuflim.FilmId
where OyuncuAdi = @ad and OyuncuSoyAdi=@soyad
go

-------------örnek kullanım------------------
--exec sp_OyuncuFilmleriGetir 'orlando','bloom'
