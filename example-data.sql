USE [Filmler-ve-Flimler]
GO
SET IDENTITY_INSERT [dbo].[Yonetmenler] ON 

INSERT [dbo].[Yonetmenler] ([YonetmenId], [YonetmenAdi], [YonetmenSoyAdi], [YonetmenDogumTarihi]) VALUES (5, N'stanley', N'kubrick', CAST(N'1928-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Yonetmenler] ([YonetmenId], [YonetmenAdi], [YonetmenSoyAdi], [YonetmenDogumTarihi]) VALUES (7, N'Andrei', N'Tarkovsky ', CAST(N'1932-09-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Yonetmenler] ([YonetmenId], [YonetmenAdi], [YonetmenSoyAdi], [YonetmenDogumTarihi]) VALUES (8, N'Peter', N'Jackson', CAST(N'1961-09-30T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Yonetmenler] OFF
GO
SET IDENTITY_INSERT [dbo].[Filmler] ON 

INSERT [dbo].[Filmler] ([FilmId], [FilmAdi], [YayinlanmaTarih], [YonetmenId]) VALUES (1, N'Yüzüklerin Efendisi: Yüzük Kardeşliği', CAST(N'2001-01-01T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Filmler] ([FilmId], [FilmAdi], [YayinlanmaTarih], [YonetmenId]) VALUES (2, N'Yüzüklerin Efendisi: İki Kule', CAST(N'2002-01-01T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Filmler] ([FilmId], [FilmAdi], [YayinlanmaTarih], [YonetmenId]) VALUES (3, N'Eyes Wide Shut', CAST(N'1999-01-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Filmler] ([FilmId], [FilmAdi], [YayinlanmaTarih], [YonetmenId]) VALUES (4, N'Full metal jacket', CAST(N'1987-01-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Filmler] ([FilmId], [FilmAdi], [YayinlanmaTarih], [YonetmenId]) VALUES (5, N'Stalker', CAST(N'1979-01-01T00:00:00.000' AS DateTime), 7)
SET IDENTITY_INSERT [dbo].[Filmler] OFF
GO
SET IDENTITY_INSERT [dbo].[Kategoriler] ON 

INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi]) VALUES (1, N'korku')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi]) VALUES (2, N'gerilim')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi]) VALUES (3, N'fantastik')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi]) VALUES (4, N'romantik')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi]) VALUES (5, N'macera')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi]) VALUES (6, N'bilim kurgu')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi]) VALUES (7, N'animasyon')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi]) VALUES (8, N'biyografi')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi]) VALUES (9, N'dram')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi]) VALUES (10, N'gizem')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi]) VALUES (11, N'şavaş')
SET IDENTITY_INSERT [dbo].[Kategoriler] OFF
GO
INSERT [dbo].[FilmTurleri] ([FilmId], [kategoriId]) VALUES (1, 3)
INSERT [dbo].[FilmTurleri] ([FilmId], [kategoriId]) VALUES (1, 5)
INSERT [dbo].[FilmTurleri] ([FilmId], [kategoriId]) VALUES (2, 3)
INSERT [dbo].[FilmTurleri] ([FilmId], [kategoriId]) VALUES (2, 5)
INSERT [dbo].[FilmTurleri] ([FilmId], [kategoriId]) VALUES (3, 9)
INSERT [dbo].[FilmTurleri] ([FilmId], [kategoriId]) VALUES (3, 10)
INSERT [dbo].[FilmTurleri] ([FilmId], [kategoriId]) VALUES (4, 11)
INSERT [dbo].[FilmTurleri] ([FilmId], [kategoriId]) VALUES (4, 9)
INSERT [dbo].[FilmTurleri] ([FilmId], [kategoriId]) VALUES (5, 6)
INSERT [dbo].[FilmTurleri] ([FilmId], [kategoriId]) VALUES (5, 9)
GO
SET IDENTITY_INSERT [dbo].[Kullanicilar] ON 

INSERT [dbo].[Kullanicilar] ([KullaniciId], [UyelikAdi], [KullaniciSifre], [KullaniciTel], [KullaniciAd], [KullaniciSoyad], [Cinsiyet]) VALUES (1, N'filmhesap1', N'1234', N'0540000000', N'hasan', N'baysal', 1)
INSERT [dbo].[Kullanicilar] ([KullaniciId], [UyelikAdi], [KullaniciSifre], [KullaniciTel], [KullaniciAd], [KullaniciSoyad], [Cinsiyet]) VALUES (3, N'filmhesap2', N'43534', N'0540000000', N'fatih', N'binici', 1)
INSERT [dbo].[Kullanicilar] ([KullaniciId], [UyelikAdi], [KullaniciSifre], [KullaniciTel], [KullaniciAd], [KullaniciSoyad], [Cinsiyet]) VALUES (4, N'filmhesap3', N'21321', N'05000000000', N'zeynep', N'yıldırım', 0)
INSERT [dbo].[Kullanicilar] ([KullaniciId], [UyelikAdi], [KullaniciSifre], [KullaniciTel], [KullaniciAd], [KullaniciSoyad], [Cinsiyet]) VALUES (5, N'filmhesap4', N'asda23as2', N'05000000000', N'merve', N'yılmaz', 0)
INSERT [dbo].[Kullanicilar] ([KullaniciId], [UyelikAdi], [KullaniciSifre], [KullaniciTel], [KullaniciAd], [KullaniciSoyad], [Cinsiyet]) VALUES (6, N'filmhesap5', N'asdasd', N'05111111111', N'ayşe', N'selen', 0)
INSERT [dbo].[Kullanicilar] ([KullaniciId], [UyelikAdi], [KullaniciSifre], [KullaniciTel], [KullaniciAd], [KullaniciSoyad], [Cinsiyet]) VALUES (8, N'filmhesap6', N'asda21312@', N'05111111111', N'uğur', N'güneş', 1)
INSERT [dbo].[Kullanicilar] ([KullaniciId], [UyelikAdi], [KullaniciSifre], [KullaniciTel], [KullaniciAd], [KullaniciSoyad], [Cinsiyet]) VALUES (9, N'filmhesap6', N'asdlasdB@', N'05111111111', N'berk', N'T', 1)
SET IDENTITY_INSERT [dbo].[Kullanicilar] OFF
GO
SET IDENTITY_INSERT [dbo].[Yorumlar] ON 

INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (2, 1, 1, N'yüzüklerin efendisi serisi muhteşem', CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (3, 1, 1, N'tekrardan izliyorum', CAST(N'2021-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (8, 3, 2, N'serinin en sevdiğim filmi', CAST(N'2022-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (9, 1, 2, N'5.izleyişim', CAST(N'2022-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (10, 3, 2, N'Mutlaka izlemesilisin', CAST(N'2022-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (11, 3, 1, N'Sıfırdan başlıyorum seriye', CAST(N'2019-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (12, 4, 2, N'harika', CAST(N'2018-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (13, 4, 3, N'mükkemmel', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (14, 6, 3, N'heycanlı', CAST(N'2015-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (15, 9, 3, N'sonunu merakla bekledim', CAST(N'2015-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (16, 9, 3, N'favorim', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (17, 8, 1, N'lotr mükkemmel', CAST(N'2011-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (18, 8, 2, N'yüzü neden kartallar görtürmedi', CAST(N'2022-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (19, 6, 3, N'sürükleyici', CAST(N'2021-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (21, 1, 4, N':)', CAST(N'2021-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (22, 1, 5, N'wow', CAST(N'2021-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (23, 1, 4, N'tekrar izliyorum', CAST(N'2021-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (27, 3, 4, N'güzel film', CAST(N'2021-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (28, 3, 5, N'ruslar siname dahisi', CAST(N'2021-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (29, 9, 4, N'ilginç bir film', CAST(N'2021-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (31, 9, 5, N'beğenmedim', CAST(N'2021-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (33, 9, 2, N'gelmiş geçmiş en iyi film serisi lotr ', CAST(N'2021-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (35, 8, 4, N'neden daha önce izlemedim', CAST(N'2021-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (36, 8, 5, N'vakit kaybı', CAST(N'2021-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (38, 8, 5, N'zorla izledim', CAST(N'2021-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Yorumlar] ([YorumId], [KullaniciId], [FilmId], [YorumText], [YorumTarih]) VALUES (40, 6, 5, N'yorum update işlemi', CAST(N'2021-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Yorumlar] OFF
GO
INSERT [dbo].[Favoriler] ([KullaniciId], [FilmId], [KullaniciPuani]) VALUES (1, 1, 10)
INSERT [dbo].[Favoriler] ([KullaniciId], [FilmId], [KullaniciPuani]) VALUES (1, 2, 9)
INSERT [dbo].[Favoriler] ([KullaniciId], [FilmId], [KullaniciPuani]) VALUES (3, 1, 8)
INSERT [dbo].[Favoriler] ([KullaniciId], [FilmId], [KullaniciPuani]) VALUES (3, 2, 2)
INSERT [dbo].[Favoriler] ([KullaniciId], [FilmId], [KullaniciPuani]) VALUES (6, 2, 9)
INSERT [dbo].[Favoriler] ([KullaniciId], [FilmId], [KullaniciPuani]) VALUES (6, 3, 8)
INSERT [dbo].[Favoriler] ([KullaniciId], [FilmId], [KullaniciPuani]) VALUES (6, 4, 2)
INSERT [dbo].[Favoriler] ([KullaniciId], [FilmId], [KullaniciPuani]) VALUES (4, 1, 10)
INSERT [dbo].[Favoriler] ([KullaniciId], [FilmId], [KullaniciPuani]) VALUES (4, 5, 5)
INSERT [dbo].[Favoriler] ([KullaniciId], [FilmId], [KullaniciPuani]) VALUES (4, 3, 10)
INSERT [dbo].[Favoriler] ([KullaniciId], [FilmId], [KullaniciPuani]) VALUES (8, 5, 10)
GO
SET IDENTITY_INSERT [dbo].[Oyuncular] ON 

INSERT [dbo].[Oyuncular] ([OyuncuId], [OyuncuAdi], [OyuncuSoyAdi], [OyuncuDogumTarihi], [OyuncuCinsiyet]) VALUES (1, N'Elijah ', N'Wood', CAST(N'1997-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Oyuncular] ([OyuncuId], [OyuncuAdi], [OyuncuSoyAdi], [OyuncuDogumTarihi], [OyuncuCinsiyet]) VALUES (4, N'Orlando', N'Bloom', CAST(N'1997-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Oyuncular] ([OyuncuId], [OyuncuAdi], [OyuncuSoyAdi], [OyuncuDogumTarihi], [OyuncuCinsiyet]) VALUES (5, N'Ian', N'McKellen', CAST(N'1977-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Oyuncular] ([OyuncuId], [OyuncuAdi], [OyuncuSoyAdi], [OyuncuDogumTarihi], [OyuncuCinsiyet]) VALUES (6, N'Liv', N'Tyler', CAST(N'1988-01-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Oyuncular] ([OyuncuId], [OyuncuAdi], [OyuncuSoyAdi], [OyuncuDogumTarihi], [OyuncuCinsiyet]) VALUES (7, N'Cate ', N'Blanchett', CAST(N'1960-01-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Oyuncular] ([OyuncuId], [OyuncuAdi], [OyuncuSoyAdi], [OyuncuDogumTarihi], [OyuncuCinsiyet]) VALUES (8, N'Miranda ', N'Otto', CAST(N'1980-10-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Oyuncular] ([OyuncuId], [OyuncuAdi], [OyuncuSoyAdi], [OyuncuDogumTarihi], [OyuncuCinsiyet]) VALUES (9, N'Tom', N'Cruise', CAST(N'1970-10-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Oyuncular] ([OyuncuId], [OyuncuAdi], [OyuncuSoyAdi], [OyuncuDogumTarihi], [OyuncuCinsiyet]) VALUES (10, N'Nicole', N'Kidman', CAST(N'1970-01-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Oyuncular] ([OyuncuId], [OyuncuAdi], [OyuncuSoyAdi], [OyuncuDogumTarihi], [OyuncuCinsiyet]) VALUES (11, N'Madison', N'Eginton', CAST(N'1980-01-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Oyuncular] ([OyuncuId], [OyuncuAdi], [OyuncuSoyAdi], [OyuncuDogumTarihi], [OyuncuCinsiyet]) VALUES (12, N'R. Lee', N'Ermey', CAST(N'1960-01-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Oyuncular] ([OyuncuId], [OyuncuAdi], [OyuncuSoyAdi], [OyuncuDogumTarihi], [OyuncuCinsiyet]) VALUES (13, N'Adam ', N'Baldwin', CAST(N'1970-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Oyuncular] ([OyuncuId], [OyuncuAdi], [OyuncuSoyAdi], [OyuncuDogumTarihi], [OyuncuCinsiyet]) VALUES (14, N'Aleksandr ', N'Kaydanovskiy', CAST(N'1950-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Oyuncular] ([OyuncuId], [OyuncuAdi], [OyuncuSoyAdi], [OyuncuDogumTarihi], [OyuncuCinsiyet]) VALUES (15, N'Nataşa', N'Abromova', CAST(N'1960-01-01T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Oyuncular] OFF
GO
INSERT [dbo].[OyuncuFilmografi] ([OyuncuId], [FilmId], [Karakteri]) VALUES (1, 1, N'frodo')
INSERT [dbo].[OyuncuFilmografi] ([OyuncuId], [FilmId], [Karakteri]) VALUES (1, 2, N'frodo')
INSERT [dbo].[OyuncuFilmografi] ([OyuncuId], [FilmId], [Karakteri]) VALUES (4, 1, N'Legolas')
INSERT [dbo].[OyuncuFilmografi] ([OyuncuId], [FilmId], [Karakteri]) VALUES (4, 2, N'Legolas')
INSERT [dbo].[OyuncuFilmografi] ([OyuncuId], [FilmId], [Karakteri]) VALUES (5, 1, N'Gandalf')
INSERT [dbo].[OyuncuFilmografi] ([OyuncuId], [FilmId], [Karakteri]) VALUES (5, 2, N'Gandalf')
INSERT [dbo].[OyuncuFilmografi] ([OyuncuId], [FilmId], [Karakteri]) VALUES (6, 1, N'Arwen')
INSERT [dbo].[OyuncuFilmografi] ([OyuncuId], [FilmId], [Karakteri]) VALUES (6, 2, N'Arwen')
INSERT [dbo].[OyuncuFilmografi] ([OyuncuId], [FilmId], [Karakteri]) VALUES (7, 1, N'Galadriel')
INSERT [dbo].[OyuncuFilmografi] ([OyuncuId], [FilmId], [Karakteri]) VALUES (7, 2, N'Galadriel')
INSERT [dbo].[OyuncuFilmografi] ([OyuncuId], [FilmId], [Karakteri]) VALUES (8, 1, N'eoweyn')
INSERT [dbo].[OyuncuFilmografi] ([OyuncuId], [FilmId], [Karakteri]) VALUES (8, 2, N'eoweyn')
INSERT [dbo].[OyuncuFilmografi] ([OyuncuId], [FilmId], [Karakteri]) VALUES (9, 3, N'Bill')
INSERT [dbo].[OyuncuFilmografi] ([OyuncuId], [FilmId], [Karakteri]) VALUES (10, 3, N'Alice')
INSERT [dbo].[OyuncuFilmografi] ([OyuncuId], [FilmId], [Karakteri]) VALUES (11, 3, N'Helena')
INSERT [dbo].[OyuncuFilmografi] ([OyuncuId], [FilmId], [Karakteri]) VALUES (12, 4, NULL)
INSERT [dbo].[OyuncuFilmografi] ([OyuncuId], [FilmId], [Karakteri]) VALUES (13, 4, NULL)
INSERT [dbo].[OyuncuFilmografi] ([OyuncuId], [FilmId], [Karakteri]) VALUES (14, 5, NULL)
INSERT [dbo].[OyuncuFilmografi] ([OyuncuId], [FilmId], [Karakteri]) VALUES (15, 5, NULL)
GO
INSERT [dbo].[YorumLog] ([ID], [Yorum], [OlusturmaTarihi], [SilmeTarihi]) VALUES (8, N'bize gidelim mi film falan izleriz', CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2022-05-06T17:42:29.360' AS DateTime))
INSERT [dbo].[YorumLog] ([ID], [Yorum], [OlusturmaTarihi], [SilmeTarihi]) VALUES (6, N'sadjaskldakld##update##', CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2022-05-06T18:04:05.570' AS DateTime))
GO
