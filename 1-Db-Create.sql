use master
go
--veritabanı kontrolü
if exists (select * from sysdatabases where name ='Filmler-ve-Flimler')
	begin
	print 'aynı isimli bir veritabanı mecvut tablolar siliniyor'

	drop database [Filmler-ve-Flimler]
	end
go
create database [Filmler-ve-Flimler]
go
use master
declare @dosyaYolu nvarchar(max)
select @dosyaYolu= filename from master.dbo.sysaltfiles where dbid =1 and fileid=1
select @dosyaYolu=SUBSTRING(@dosyaYolu,0,CHARINDEX('master.mdf',@dosyaYolu))
print 'fiziksel database dosyanızın yolu => ' + @dosyaYolu+'filmler-ve-flimler.mdf'
go
SET DATEFORMAT mdy
go
