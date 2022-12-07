use [Filmler-ve-Flimler]
go
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


