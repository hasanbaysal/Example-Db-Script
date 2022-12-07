
--Transaction Yap�s� asl�nda default olarak Sql ��erisinde var 
	--default olarak her sorgu commit �zelli�ine sahiptir
		
		-- commit tran =>i�lemi ba�ar� ile sona erdir
		-- rollback tran => i�lemi geriye al

--Transcationlar genelde Stored Procedures gibi yap�larla birlikte kullan�l�r. Bir dizi sql kodunuz var ba�lad�n�z
-- kodlama ama baz� �eyler ters gitti i�lemem tamamlanamad� ve yar�da kesildi 
-- ama siz bu  sorunlu i�leme gelene kadar 3 tabloda de�i�iklik yapt�n�z onlar i�lendi bile �oktan tablolara
--  o zaman bu i�lemi en ba�a sanki hi� olmam�� gibi geri almak istiyorsan�z i�te transaction tam bunun i�in var

--A�a��daki �rnek koda bak�n personeller tablosundan bir silme i�lemi yap�yorum ama sildi�im ki�i say�s�
-- 1'den fazla ise bu i�lemi geri al�yorum
-- NOT : @@rowcount bize son yap�lan sorgudan ka� sat�r�n etkilendi�ini g�sterir



use Northwind
go

 begin tran 
 declare @i int
 delete from Personeller where PersonelID>1
 set @i = @@ROWCOUNT
 if @i =1
 	begin
 		print 'kay�t silindi'
 		commit
 	end
 else
 	begin
 		print 'kay�t silinemedi'
 		rollback
 	end