
--Transaction Yapýsý aslýnda default olarak Sql Ýçerisinde var 
	--default olarak her sorgu commit özelliðine sahiptir
		
		-- commit tran =>iþlemi baþarý ile sona erdir
		-- rollback tran => iþlemi geriye al

--Transcationlar genelde Stored Procedures gibi yapýlarla birlikte kullanýlýr. Bir dizi sql kodunuz var sp içinde
-- iþlem baþladý ama bazý þeyler ters gitti iþlemem tamamlanamadý ve yarýda kesildi 
-- ama siz bu  sorunlu iþleme gelene kadar 3 tabloda deðiþiklik yaptýnýz onlar iþlendi bile çoktan tablolara
--  o zaman bu iþlemi en baþa sanki hiç olmamýþ gibi geri almak istiyorsanýz iþte transaction tam bunun için var

--Aþaðýdaki örnek koda bakýn personeller tablosundan bir silme iþlemi yapýyorum ama sildiðim kiþi sayýsý
-- 1'den fazla ise bu iþlemi geri alýyorum
-- NOT : @@rowcount bize son yapýlan sorgudan kaç satýrýn etkilendiðini gösterir



use Northwind
go

 begin tran --transaction baþlatýyorum
 declare @i int
 delete from Personeller where PersonelID>1
 set @i = @@ROWCOUNT
 if @i =1
 	begin
 		print 'kayýt silindi'
 		commit --iþlem istediðim gibi ise commit 
 	end
 else
 	begin
 		print 'kayýt silinemedi'
 		rollback --iþlem istemedðim gibiyse rollback yapýyorum bu noktada
 	end