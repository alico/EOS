USE [ESSMerkez]
GO
/****** Object:  ForeignKey [FK_Districts_Cities]    Script Date: 05/15/2013 00:18:34 ******/
ALTER TABLE [dbo].[Districts] DROP CONSTRAINT [FK_Districts_Cities]
GO
/****** Object:  ForeignKey [FK_ElectionDetails_Elections]    Script Date: 05/15/2013 00:18:34 ******/
ALTER TABLE [dbo].[ElectionDetails] DROP CONSTRAINT [FK_ElectionDetails_Elections]
GO
/****** Object:  ForeignKey [FK_ElectionDetails_ElectionStatus]    Script Date: 05/15/2013 00:18:34 ******/
ALTER TABLE [dbo].[ElectionDetails] DROP CONSTRAINT [FK_ElectionDetails_ElectionStatus]
GO
/****** Object:  ForeignKey [FK_Elections_ElectionTypes]    Script Date: 05/15/2013 00:18:34 ******/
ALTER TABLE [dbo].[Elections] DROP CONSTRAINT [FK_Elections_ElectionTypes]
GO
/****** Object:  ForeignKey [FK_RegionDetails_Districts]    Script Date: 05/15/2013 00:18:34 ******/
ALTER TABLE [dbo].[RegionDetails] DROP CONSTRAINT [FK_RegionDetails_Districts]
GO
/****** Object:  ForeignKey [FK_RegionDetails_Regions]    Script Date: 05/15/2013 00:18:34 ******/
ALTER TABLE [dbo].[RegionDetails] DROP CONSTRAINT [FK_RegionDetails_Regions]
GO
/****** Object:  ForeignKey [FK_SessionDetails_UserSessions]    Script Date: 05/15/2013 00:18:34 ******/
ALTER TABLE [dbo].[SessionDetails] DROP CONSTRAINT [FK_SessionDetails_UserSessions]
GO
/****** Object:  ForeignKey [FK_Votes_Districts]    Script Date: 05/15/2013 00:18:35 ******/
ALTER TABLE [dbo].[Votes] DROP CONSTRAINT [FK_Votes_Districts]
GO
/****** Object:  ForeignKey [FK_Votes_Elections]    Script Date: 05/15/2013 00:18:35 ******/
ALTER TABLE [dbo].[Votes] DROP CONSTRAINT [FK_Votes_Elections]
GO
/****** Object:  ForeignKey [FK_Votes_Regions]    Script Date: 05/15/2013 00:18:35 ******/
ALTER TABLE [dbo].[Votes] DROP CONSTRAINT [FK_Votes_Regions]
GO
/****** Object:  View [dbo].[VElectionDetails]    Script Date: 05/15/2013 00:18:36 ******/
DROP VIEW [dbo].[VElectionDetails]
GO
/****** Object:  View [dbo].[VRegions]    Script Date: 05/15/2013 00:18:36 ******/
DROP VIEW [dbo].[VRegions]
GO
/****** Object:  Table [dbo].[Votes]    Script Date: 05/15/2013 00:18:35 ******/
ALTER TABLE [dbo].[Votes] DROP CONSTRAINT [FK_Votes_Districts]
GO
ALTER TABLE [dbo].[Votes] DROP CONSTRAINT [FK_Votes_Elections]
GO
ALTER TABLE [dbo].[Votes] DROP CONSTRAINT [FK_Votes_Regions]
GO
DROP TABLE [dbo].[Votes]
GO
/****** Object:  Table [dbo].[ElectionDetails]    Script Date: 05/15/2013 00:18:34 ******/
ALTER TABLE [dbo].[ElectionDetails] DROP CONSTRAINT [FK_ElectionDetails_Elections]
GO
ALTER TABLE [dbo].[ElectionDetails] DROP CONSTRAINT [FK_ElectionDetails_ElectionStatus]
GO
DROP TABLE [dbo].[ElectionDetails]
GO
/****** Object:  Table [dbo].[RegionDetails]    Script Date: 05/15/2013 00:18:34 ******/
ALTER TABLE [dbo].[RegionDetails] DROP CONSTRAINT [FK_RegionDetails_Districts]
GO
ALTER TABLE [dbo].[RegionDetails] DROP CONSTRAINT [FK_RegionDetails_Regions]
GO
DROP TABLE [dbo].[RegionDetails]
GO
/****** Object:  Table [dbo].[Elections]    Script Date: 05/15/2013 00:18:34 ******/
ALTER TABLE [dbo].[Elections] DROP CONSTRAINT [FK_Elections_ElectionTypes]
GO
DROP TABLE [dbo].[Elections]
GO
/****** Object:  Table [dbo].[Districts]    Script Date: 05/15/2013 00:18:34 ******/
ALTER TABLE [dbo].[Districts] DROP CONSTRAINT [FK_Districts_Cities]
GO
DROP TABLE [dbo].[Districts]
GO
/****** Object:  Table [dbo].[SessionDetails]    Script Date: 05/15/2013 00:18:34 ******/
ALTER TABLE [dbo].[SessionDetails] DROP CONSTRAINT [FK_SessionDetails_UserSessions]
GO
DROP TABLE [dbo].[SessionDetails]
GO
/****** Object:  View [dbo].[VUser]    Script Date: 05/15/2013 00:18:36 ******/
DROP VIEW [dbo].[VUser]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/15/2013 00:18:34 ******/
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[UserSessions]    Script Date: 05/15/2013 00:18:35 ******/
DROP TABLE [dbo].[UserSessions]
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 05/15/2013 00:18:35 ******/
DROP TABLE [dbo].[UserTypes]
GO
/****** Object:  Table [dbo].[ElectionStatus]    Script Date: 05/15/2013 00:18:34 ******/
DROP TABLE [dbo].[ElectionStatus]
GO
/****** Object:  Table [dbo].[ElectionTypes]    Script Date: 05/15/2013 00:18:34 ******/
DROP TABLE [dbo].[ElectionTypes]
GO
/****** Object:  Table [dbo].[Regions]    Script Date: 05/15/2013 00:18:34 ******/
ALTER TABLE [dbo].[Regions] DROP CONSTRAINT [DF_Regions_CandidateCount]
GO
DROP TABLE [dbo].[Regions]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 05/15/2013 00:18:34 ******/
DROP TABLE [dbo].[Cities]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 05/15/2013 00:18:34 ******/
DROP TABLE [dbo].[Departments]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 05/15/2013 00:18:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentStatus] [bit] NULL,
	[DepartmentName] [varchar](255) NULL,
	[DistrictId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentStatus], [DepartmentName], [DistrictId]) VALUES (1, 1, N'Ataşehir Seçim Bölgesi', 418)
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentStatus], [DepartmentName], [DistrictId]) VALUES (2, 1, N'Ceyhan Seçim Bölgesi', 2)
SET IDENTITY_INSERT [dbo].[Departments] OFF
/****** Object:  Table [dbo].[Cities]    Script Date: 05/15/2013 00:18:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cities](
	[CityId] [varchar](3) NOT NULL,
	[CityName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'1', N'Adana')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'10', N'Balıkesir')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'11', N'Bilecik')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'12', N'Bingöl')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'13', N'Bitlis')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'14', N'Bolu')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'15', N'Burdur')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'16', N'Bursa')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'17', N'Çanakkale')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'18', N'Çankırı')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'19', N'Çorum')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'2', N'Adıyaman')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'20', N'Denizli')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'21', N'Diyarbakır')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'22', N'Edirne')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'23', N'Elazığ')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'24', N'Erzincan')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'25', N'Erzurum')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'26', N'Eskişehir')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'27', N'Gaziantep')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'28', N'Giresun')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'29', N'Gümüşhane')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'3', N'Afyon')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'30', N'Hakkari')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'31', N'Hatay')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'32', N'Isparta')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'33', N'Mersin')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'34', N'İstanbul')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'35', N'İzmir')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'36', N'Kars')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'37', N'Kastamonu')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'38', N'Kayseri')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'39', N'Kırklareli')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'4', N'Ağrı')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'40', N'Kırşehir')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'41', N'Kocaeli')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'42', N'Konya')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'43', N'Kütahya')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'44', N'Malatya')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'45', N'Manisa')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'46', N'K.Maraş')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'47', N'Mardin')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'48', N'Muğla')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'49', N'Muş')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'5', N'Amasya')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'50', N'Nevşehir')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'51', N'Niğde')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'52', N'Ordu')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'53', N'Rize')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'54', N'Sakarya')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'55', N'Samsun')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'56', N'Siirt')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'57', N'Sinop')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'58', N'Sivas')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'59', N'Tekirdağ')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'6', N'Ankara')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'60', N'Tokat')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'61', N'Trabzon')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'62', N'Tunceli')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'63', N'Şanlıurfa')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'64', N'Uşak')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'65', N'Van')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'66', N'Yozgat')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'67', N'Zonguldak')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'68', N'Aksaray')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'69', N'Bayburt')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'7', N'Antalya')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'70', N'Karaman')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'71', N'Kırıkkale')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'72', N'Batman')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'73', N'Şırnak')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'74', N'Bartın')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'75', N'Ardahan')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'76', N'Iğdır')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'77', N'Yalova')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'78', N'Karabük')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'79', N'Kilis')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'8', N'Artvin')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'80', N'Osmaniye')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'81', N'Düzce')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'9', N'Aydın')
/****** Object:  Table [dbo].[Regions]    Script Date: 05/15/2013 00:18:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Regions](
	[RegionId] [int] IDENTITY(1,1) NOT NULL,
	[Region] [varchar](55) NULL,
	[CandidateCount] [int] NULL CONSTRAINT [DF_Regions_CandidateCount]  DEFAULT ((1)),
	[CityId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RegionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Regions] ON
INSERT [dbo].[Regions] ([RegionId], [Region], [CandidateCount], [CityId]) VALUES (1, N'İstanbul 1. Bölge', NULL, 34)
INSERT [dbo].[Regions] ([RegionId], [Region], [CandidateCount], [CityId]) VALUES (2, N'Adana 1. Bölge', NULL, 1)
INSERT [dbo].[Regions] ([RegionId], [Region], [CandidateCount], [CityId]) VALUES (5, N'1. ve tek bölge', NULL, 1)
INSERT [dbo].[Regions] ([RegionId], [Region], [CandidateCount], [CityId]) VALUES (6, N'Tek Bölge ', NULL, 1)
INSERT [dbo].[Regions] ([RegionId], [Region], [CandidateCount], [CityId]) VALUES (7, N'test bolge', NULL, 1)
INSERT [dbo].[Regions] ([RegionId], [Region], [CandidateCount], [CityId]) VALUES (9, N'As', 12, 1)
INSERT [dbo].[Regions] ([RegionId], [Region], [CandidateCount], [CityId]) VALUES (10, N'Adana 3. Bölge', 2, 1)
INSERT [dbo].[Regions] ([RegionId], [Region], [CandidateCount], [CityId]) VALUES (11, N'Adana 4. Bölge', 3, NULL)
INSERT [dbo].[Regions] ([RegionId], [Region], [CandidateCount], [CityId]) VALUES (12, N'Adana 6. Bölge', 2, 1)
SET IDENTITY_INSERT [dbo].[Regions] OFF
/****** Object:  Table [dbo].[ElectionTypes]    Script Date: 05/15/2013 00:18:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ElectionTypes](
	[ElectionTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ElectionTypeName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ElectionTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ElectionTypes] ON
INSERT [dbo].[ElectionTypes] ([ElectionTypeId], [ElectionTypeName]) VALUES (1, N'Genel Seçimler')
INSERT [dbo].[ElectionTypes] ([ElectionTypeId], [ElectionTypeName]) VALUES (2, N'Yerel Yönetim Seçimleri')
INSERT [dbo].[ElectionTypes] ([ElectionTypeId], [ElectionTypeName]) VALUES (3, N'Milletvekili Seçileri')
SET IDENTITY_INSERT [dbo].[ElectionTypes] OFF
/****** Object:  Table [dbo].[ElectionStatus]    Script Date: 05/15/2013 00:18:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ElectionStatus](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ElectionStatus] ON
INSERT [dbo].[ElectionStatus] ([StatusId], [StatusName]) VALUES (1, N'Yeni Seçim')
INSERT [dbo].[ElectionStatus] ([StatusId], [StatusName]) VALUES (2, N'Seçmen Kaydı')
INSERT [dbo].[ElectionStatus] ([StatusId], [StatusName]) VALUES (3, N'Parti Kaydı')
INSERT [dbo].[ElectionStatus] ([StatusId], [StatusName]) VALUES (4, N'Aday Kaydı')
INSERT [dbo].[ElectionStatus] ([StatusId], [StatusName]) VALUES (5, N'Seçim Başlatıldı')
INSERT [dbo].[ElectionStatus] ([StatusId], [StatusName]) VALUES (6, N'Seçim Bitirildi')
SET IDENTITY_INSERT [dbo].[ElectionStatus] OFF
/****** Object:  Table [dbo].[UserTypes]    Script Date: 05/15/2013 00:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserTypes](
	[UserTypeId] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[UserTypes] ON
INSERT [dbo].[UserTypes] ([UserTypeId], [UserType]) VALUES (1, N'YSK Memuru')
INSERT [dbo].[UserTypes] ([UserTypeId], [UserType]) VALUES (2, N'Özel Görevli YSK Memuru')
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
/****** Object:  Table [dbo].[UserSessions]    Script Date: 05/15/2013 00:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserSessions](
	[SessionId] [varchar](50) NOT NULL,
	[UserId] [varchar](11) NULL,
	[StartDate] [datetime] NULL,
	[FinishDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/15/2013 00:18:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[IdentityNo] [varchar](11) NOT NULL,
	[UserTypeId] [int] NULL,
	[UserName] [varchar](50) NULL,
	[UserPassword] [varchar](50) NULL,
	[DepartmentId] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[CreatedBy] [varchar](11) NULL,
	[UpdatedBy] [varchar](11) NULL,
	[UserStatus] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdentityNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Users] ([IdentityNo], [UserTypeId], [UserName], [UserPassword], [DepartmentId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [UserStatus]) VALUES (N'20093509402', 2, N'20093509402', N'20093509402', 1, CAST(0x0000A1A600A8A193 AS DateTime), CAST(0x0000A1BB00D84958 AS DateTime), N'20093509402', N'20093509402', 1)
INSERT [dbo].[Users] ([IdentityNo], [UserTypeId], [UserName], [UserPassword], [DepartmentId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [UserStatus]) VALUES (N'71437132480', 2, N'71437132480', N'71437132480', 1, CAST(0x0000A1BB00D24658 AS DateTime), CAST(0x0000A1BB00D24659 AS DateTime), N'20093509402', N'20093509402', 1)
/****** Object:  View [dbo].[VUser]    Script Date: 05/15/2013 00:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[VUser] as 
SELECT c.*, u.UserName,u.UserPassword,u.UserTypeId,u.CreatedAt,u.CreatedBy,u.DepartmentId,u.UpdatedAt,u.UpdatedBy,u.UserStatus 
FROM 
	ESSInternet.dbo.Citizens c
LEFT JOIN dbo.Users u ON u.IdentityNo = c.IdentityNo
GO
/****** Object:  Table [dbo].[SessionDetails]    Script Date: 05/15/2013 00:18:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SessionDetails](
	[SessionId] [varchar](50) NULL,
	[LogDescription] [varchar](255) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Districts]    Script Date: 05/15/2013 00:18:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Districts](
	[DistrictId] [int] IDENTITY(1,1) NOT NULL,
	[CityId] [varchar](3) NULL,
	[DistrictName] [varchar](50) NULL,
	[DistrictStatus] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[DistrictId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Districts] ON
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (1, N'1', N'Aladağ', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (2, N'1', N'Ceyhan', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (3, N'1', N'Çukurova', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (4, N'1', N'Feke', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (5, N'1', N'İmamoğlu', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (6, N'1', N'Karaisalı', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (7, N'1', N'Karataş', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (8, N'1', N'Kozan', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (9, N'1', N'Pozantı', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (10, N'1', N'Saimbeyli', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (11, N'1', N'Sarıçam', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (12, N'1', N'Seyhan', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (13, N'1', N'Tufanbeyli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (14, N'1', N'Yumurtalık', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (15, N'1', N'Yüreğir', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (16, N'2', N'Adıyaman Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (17, N'2', N'Besni', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (18, N'2', N'Çelikhan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (19, N'2', N'Gerger', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (20, N'2', N'Gölbaşı / Adıyaman', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (21, N'2', N'Kahta', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (22, N'2', N'Samsat', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (23, N'2', N'Sincik', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (24, N'2', N'Tut', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (25, N'3', N'Afyonkarahisar Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (26, N'3', N'Başmakçı', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (27, N'3', N'Bayat / Afyonkarahisar', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (28, N'3', N'Bolvadin', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (29, N'3', N'Çay', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (30, N'3', N'Çobanlar', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (31, N'3', N'Dazkırı', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (32, N'3', N'Dinar', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (33, N'3', N'Emirdağ', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (34, N'3', N'Evciler', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (35, N'3', N'Hocalar', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (36, N'3', N'İhsaniye', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (37, N'3', N'İscehisar', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (38, N'3', N'Kızılören', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (39, N'3', N'Sandıklı', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (40, N'3', N'Sinanpaşa', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (41, N'3', N'Sultandağı', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (42, N'3', N'Şuhut', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (43, N'4', N'Ağrı Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (44, N'4', N'Diyadin', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (45, N'4', N'Doğubayazıt', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (46, N'4', N'Eleşkirt', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (47, N'4', N'Hamur', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (48, N'4', N'Patnos', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (49, N'4', N'Taşlıçay', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (50, N'4', N'Tutak', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (51, N'5', N'Amasya Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (52, N'5', N'Göynücek', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (53, N'5', N'Gümüşhacıköy', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (54, N'5', N'Hamamözü', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (55, N'5', N'Merzifon', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (56, N'5', N'Suluova', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (57, N'5', N'Taşova', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (58, N'6', N'Akyurt', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (59, N'6', N'Altındağ', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (60, N'6', N'Ayaş', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (61, N'6', N'Bala', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (62, N'6', N'Beypazarı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (63, N'6', N'Çamlıdere', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (64, N'6', N'Çankaya', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (65, N'6', N'Çubuk', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (66, N'6', N'Elmadağ', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (67, N'6', N'Etimesgut', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (68, N'6', N'Evren', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (69, N'6', N'Gölbaşı / Ankara', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (70, N'6', N'Güdül', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (71, N'6', N'Haymana', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (72, N'6', N'Kalecik', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (73, N'6', N'Kazan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (74, N'6', N'Keçiören', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (75, N'6', N'Kızılcahamam', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (76, N'6', N'Mamak', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (77, N'6', N'Nallıhan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (78, N'6', N'Polatlı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (79, N'6', N'Pursaklar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (80, N'6', N'Sincan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (81, N'6', N'Şereflikoçhisar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (82, N'6', N'Yenimahalle', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (83, N'7', N'Akseki', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (84, N'7', N'Aksu / Antalya', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (85, N'7', N'Alanya', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (86, N'7', N'Demre', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (87, N'7', N'Döşemealtı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (88, N'7', N'Elmalı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (89, N'7', N'Finike', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (90, N'7', N'Gazipaşa', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (91, N'7', N'Gündoğmuş', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (92, N'7', N'İbradı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (93, N'7', N'Kaş', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (94, N'7', N'Kemer / Antalya', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (95, N'7', N'Kepez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (96, N'7', N'Konyaaltı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (97, N'7', N'Korkuteli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (98, N'7', N'Kumluca', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (99, N'7', N'Manavgat', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (100, N'7', N'Muratpaşa', 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (101, N'7', N'Serik', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (102, N'8', N'Ardanuç', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (103, N'8', N'Arhavi', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (104, N'8', N'Artvin Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (105, N'8', N'Borçka', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (106, N'8', N'Hopa', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (107, N'8', N'Murgul', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (108, N'8', N'Şavşat', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (109, N'8', N'Yusufeli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (110, N'9', N'Aydın Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (111, N'9', N'Bozdoğan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (112, N'9', N'Buharkent', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (113, N'9', N'Çine', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (114, N'9', N'Didim', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (115, N'9', N'Germencik', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (116, N'9', N'İncirliova', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (117, N'9', N'Karacasu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (118, N'9', N'Karpuzlu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (119, N'9', N'Koçarlı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (120, N'9', N'Köşk', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (121, N'9', N'Kuşadası', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (122, N'9', N'Kuyucak', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (123, N'9', N'Nazilli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (124, N'9', N'Söke', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (125, N'9', N'Sultanhisar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (126, N'9', N'Yenipazar / Aydın', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (127, N'10', N'Ayvalık', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (128, N'10', N'Balıkesir Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (129, N'10', N'Balya', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (130, N'10', N'Bandırma', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (131, N'10', N'Bigadiç', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (132, N'10', N'Burhaniye', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (133, N'10', N'Dursunbey', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (134, N'10', N'Edremit / Balıkesir', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (135, N'10', N'Erdek', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (136, N'10', N'Gömeç', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (137, N'10', N'Gönen / Balıkesir', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (138, N'10', N'Havran', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (139, N'10', N'İvrindi', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (140, N'10', N'Kepsut', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (141, N'10', N'Manyas', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (142, N'10', N'Marmara', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (143, N'10', N'Savaştepe', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (144, N'10', N'Sındırgı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (145, N'10', N'Susurluk', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (146, N'11', N'Bilecik Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (147, N'11', N'Bozüyük', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (148, N'11', N'Gölpazarı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (149, N'11', N'İnhisar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (150, N'11', N'Osmaneli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (151, N'11', N'Pazaryeri', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (152, N'11', N'Söğüt', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (153, N'11', N'Yenipazar / Bilecik', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (154, N'12', N'Adaklı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (155, N'12', N'Bingöl Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (156, N'12', N'Genç', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (157, N'12', N'Karlıova', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (158, N'12', N'Kiğı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (159, N'12', N'Solhan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (160, N'12', N'Yayladere', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (161, N'12', N'Yedisu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (162, N'13', N'Adilcevaz', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (163, N'13', N'Ahlat', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (164, N'13', N'Bitlis Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (165, N'13', N'Güroymak', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (166, N'13', N'Hizan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (167, N'13', N'Mutki', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (168, N'13', N'Tatvan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (169, N'14', N'Bolu Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (170, N'14', N'Dörtdivan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (171, N'14', N'Gerede', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (172, N'14', N'Göynük', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (173, N'14', N'Kıbrıscık', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (174, N'14', N'Mengen', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (175, N'14', N'Mudurnu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (176, N'14', N'Seben', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (177, N'14', N'Yeniçağa', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (178, N'15', N'Ağlasun', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (179, N'15', N'Altınyayla / Burdur', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (180, N'15', N'Bucak', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (181, N'15', N'Burdur Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (182, N'15', N'Çavdır', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (183, N'15', N'Çeltikçi', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (184, N'15', N'Gölhisar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (185, N'15', N'Karamanlı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (186, N'15', N'Kemer / Burdur', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (187, N'15', N'Tefenni', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (188, N'15', N'Yeşilova', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (189, N'16', N'Büyükorhan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (190, N'16', N'Gemlik', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (191, N'16', N'Gürsu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (192, N'16', N'Harmancık', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (193, N'16', N'İnegöl', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (194, N'16', N'İznik', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (195, N'16', N'Karacabey', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (196, N'16', N'Keles', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (197, N'16', N'Kestel', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (198, N'16', N'Mudanya', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (199, N'16', N'Mustafakemalpaşa', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (200, N'16', N'Nilüfer', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (201, N'16', N'Orhaneli', 1)
GO
print 'Processed 200 total records'
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (202, N'16', N'Orhangazi', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (203, N'16', N'Osmangazi', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (204, N'16', N'Yenişehir / Bursa', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (205, N'16', N'Yıldırım', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (206, N'17', N'Ayvacık / Çanakkale', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (207, N'17', N'Bayramiç', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (208, N'17', N'Biga', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (209, N'17', N'Bozcaada', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (210, N'17', N'Çan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (211, N'17', N'Çanakkale Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (212, N'17', N'Eceabat', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (213, N'17', N'Ezine', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (214, N'17', N'Gelibolu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (215, N'17', N'Gökçeada', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (216, N'17', N'Lapseki', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (217, N'17', N'Yenice / Çanakkale', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (218, N'18', N'Atkaracalar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (219, N'18', N'Bayramören', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (220, N'18', N'Çankırı Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (221, N'18', N'Çerkeş', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (222, N'18', N'Eldivan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (223, N'18', N'Ilgaz', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (224, N'18', N'Kızılırmak', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (225, N'18', N'Korgun', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (226, N'18', N'Kurşunlu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (227, N'18', N'Orta', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (228, N'18', N'Şabanözü', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (229, N'18', N'Yapraklı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (230, N'19', N'Alaca', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (231, N'19', N'Bayat / Çorum', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (232, N'19', N'Boğazkale', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (233, N'19', N'Çorum Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (234, N'19', N'Dodurga', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (235, N'19', N'İskilip', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (236, N'19', N'Kargı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (237, N'19', N'Laçin', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (238, N'19', N'Mecitözü', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (239, N'19', N'Oğuzlar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (240, N'19', N'Ortaköy / Çorum', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (241, N'19', N'Osmancık', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (242, N'19', N'Sungurlu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (243, N'19', N'Uğurludağ', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (244, N'20', N'Acıpayam', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (245, N'20', N'Akköy', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (246, N'20', N'Babadağ', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (247, N'20', N'Baklan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (248, N'20', N'Bekilli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (249, N'20', N'Beyağaç', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (250, N'20', N'Bozkurt / Denizli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (251, N'20', N'Buldan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (252, N'20', N'Çal', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (253, N'20', N'Çameli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (254, N'20', N'Çardak', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (255, N'20', N'Çivril', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (256, N'20', N'Denizli Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (257, N'20', N'Güney', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (258, N'20', N'Honaz', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (259, N'20', N'Kale / Denizli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (260, N'20', N'Sarayköy', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (261, N'20', N'Serinhisar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (262, N'20', N'Tavas', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (263, N'21', N'Bağlar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (264, N'21', N'Bismil', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (265, N'21', N'Çermik', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (266, N'21', N'Çınar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (267, N'21', N'Çüngüş', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (268, N'21', N'Dicle', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (269, N'21', N'Eğil', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (270, N'21', N'Ergani', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (271, N'21', N'Hani', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (272, N'21', N'Hazro', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (273, N'21', N'Kayapınar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (274, N'21', N'Kocaköy', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (275, N'21', N'Kulp', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (276, N'21', N'Lice', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (277, N'21', N'Silvan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (278, N'21', N'Sur', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (279, N'21', N'Yenişehir / Diyarbakır', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (280, N'22', N'Edirne Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (281, N'22', N'Enez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (282, N'22', N'Havsa', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (283, N'22', N'İpsala', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (284, N'22', N'Keşan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (285, N'22', N'Lalapaşa', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (286, N'22', N'Meriç', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (287, N'22', N'Süloğlu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (288, N'22', N'Uzunköprü', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (289, N'23', N'Ağın', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (290, N'23', N'Alacakaya', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (291, N'23', N'Arıcak', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (292, N'23', N'Baskil', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (293, N'23', N'Elazığ Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (294, N'23', N'Karakoçan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (295, N'23', N'Keban', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (296, N'23', N'Kovancılar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (297, N'23', N'Maden', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (298, N'23', N'Palu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (299, N'23', N'Sivrice', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (300, N'24', N'Çayırlı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (301, N'24', N'Erzincan Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (302, N'24', N'İliç', 1)
GO
print 'Processed 300 total records'
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (303, N'24', N'Kemah', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (304, N'24', N'Kemaliye', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (305, N'24', N'Otlukbeli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (306, N'24', N'Refahiye', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (307, N'24', N'Tercan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (308, N'24', N'Üzümlü', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (309, N'25', N'Aşkale', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (310, N'25', N'Aziziye', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (311, N'25', N'Çat', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (312, N'25', N'Hınıs', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (313, N'25', N'Horasan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (314, N'25', N'İspir', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (315, N'25', N'Karaçoban', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (316, N'25', N'Karayazı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (317, N'25', N'Köprüköy', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (318, N'25', N'Narman', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (319, N'25', N'Oltu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (320, N'25', N'Olur', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (321, N'25', N'Palandöken', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (322, N'25', N'Pasinler', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (323, N'25', N'Pazaryolu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (324, N'25', N'Şenkaya', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (325, N'25', N'Tekman', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (326, N'25', N'Tortum', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (327, N'25', N'Uzundere', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (328, N'25', N'Yakutiye', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (329, N'26', N'Alpu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (330, N'26', N'Beylikova', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (331, N'26', N'Çifteler', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (332, N'26', N'Günyüzü', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (333, N'26', N'Han', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (334, N'26', N'İnönü', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (335, N'26', N'Mahmudiye', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (336, N'26', N'Mihalgazi', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (337, N'26', N'Mihalıççık', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (338, N'26', N'Odunpazarı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (339, N'26', N'Sarıcakaya', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (340, N'26', N'Seyitgazi', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (341, N'26', N'Sivrihisar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (342, N'26', N'Tepebaşı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (343, N'27', N'Araban', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (344, N'27', N'İslahiye', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (345, N'27', N'Karkamış', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (346, N'27', N'Nizip', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (347, N'27', N'Nurdağı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (348, N'27', N'Oğuzeli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (349, N'27', N'Şahinbey', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (350, N'27', N'Şehitkamil', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (351, N'27', N'Yavuzeli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (352, N'28', N'Alucra', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (353, N'28', N'Bulancak', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (354, N'28', N'Çamoluk', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (355, N'28', N'Çanakçı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (356, N'28', N'Dereli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (357, N'28', N'Doğankent', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (358, N'28', N'Espiye', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (359, N'28', N'Eynesil', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (360, N'28', N'Giresun Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (361, N'28', N'Görele', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (362, N'28', N'Güce', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (363, N'28', N'Keşap', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (364, N'28', N'Piraziz', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (365, N'28', N'Şebinkarahisar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (366, N'28', N'Tirebolu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (367, N'28', N'Yağlıdere', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (368, N'29', N'Gümüşhane Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (369, N'29', N'Kelkit', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (370, N'29', N'Köse', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (371, N'29', N'Kürtün', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (372, N'29', N'Şiran', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (373, N'29', N'Torul', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (374, N'30', N'Çukurca', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (375, N'30', N'Hakkari Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (376, N'30', N'Şemdinli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (377, N'30', N'Yüksekova', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (378, N'31', N'Altınözü', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (379, N'31', N'Belen', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (380, N'31', N'Dörtyol', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (381, N'31', N'Erzin', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (382, N'31', N'Hassa', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (383, N'31', N'Hatay Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (384, N'31', N'İskenderun', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (385, N'31', N'Kırıkhan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (386, N'31', N'Kumlu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (387, N'31', N'Reyhanlı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (388, N'31', N'Samandağ', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (389, N'31', N'Yayladağı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (390, N'32', N'Aksu / Isparta', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (391, N'32', N'Atabey', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (392, N'32', N'Eğirdir', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (393, N'32', N'Gelendost', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (394, N'32', N'Gönen / Isparta', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (395, N'32', N'Isparta Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (396, N'32', N'Keçiborlu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (397, N'32', N'Senirkent', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (398, N'32', N'Sütçüler', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (399, N'32', N'Şarkikaraağaç', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (400, N'32', N'Uluborlu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (401, N'32', N'Yalvaç', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (402, N'32', N'Yenişarbademli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (403, N'33', N'Akdeniz', 1)
GO
print 'Processed 400 total records'
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (404, N'33', N'Anamur', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (405, N'33', N'Aydıncık / Mersin', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (406, N'33', N'Bozyazı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (407, N'33', N'Çamlıyayla', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (408, N'33', N'Erdemli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (409, N'33', N'Gülnar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (410, N'33', N'Mezitli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (411, N'33', N'Mut', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (412, N'33', N'Silifke', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (413, N'33', N'Tarsus', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (414, N'33', N'Toroslar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (415, N'33', N'Yenişehir / Mersin', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (416, N'34', N'Adalar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (417, N'34', N'Arnavutköy', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (418, N'34', N'Ataşehir', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (419, N'34', N'Avcılar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (420, N'34', N'Bağcılar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (421, N'34', N'Bahçelievler', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (422, N'34', N'Bakırköy', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (423, N'34', N'Başakşehir', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (424, N'34', N'Bayrampaşa', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (425, N'34', N'Beşiktaş', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (426, N'34', N'Beykoz', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (427, N'34', N'Beylikdüzü', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (428, N'34', N'Beyoğlu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (429, N'34', N'Büyükçekmece', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (430, N'34', N'Çatalca', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (431, N'34', N'Çekmeköy', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (432, N'34', N'Esenler', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (433, N'34', N'Esenyurt', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (434, N'34', N'Eyüp', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (435, N'34', N'Fatih', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (436, N'34', N'Gaziosmanpaşa', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (437, N'34', N'Güngören', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (438, N'34', N'Kadıköy', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (439, N'34', N'Kağıthane', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (440, N'34', N'Kartal', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (441, N'34', N'Küçükçekmece', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (442, N'34', N'Maltepe', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (443, N'34', N'Pendik', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (444, N'34', N'Sancaktepe', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (445, N'34', N'Sarıyer', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (446, N'34', N'Silivri', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (447, N'34', N'Sultanbeyli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (448, N'34', N'Sultangazi', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (449, N'34', N'Şile', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (450, N'34', N'Şişli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (451, N'34', N'Tuzla', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (452, N'34', N'Ümraniye', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (453, N'34', N'Üsküdar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (454, N'34', N'Zeytinburnu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (455, N'35', N'Aliağa', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (456, N'35', N'Balçova', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (457, N'35', N'Bayındır', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (458, N'35', N'Bayraklı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (459, N'35', N'Bergama', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (460, N'35', N'Beydağ', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (461, N'35', N'Bornova', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (462, N'35', N'Buca', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (463, N'35', N'Çeşme', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (464, N'35', N'Çiğli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (465, N'35', N'Dikili', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (466, N'35', N'Foça', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (467, N'35', N'Gaziemir', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (468, N'35', N'Güzelbahçe', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (469, N'35', N'Karabağlar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (470, N'35', N'Karaburun', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (471, N'35', N'Karşıyaka', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (472, N'35', N'Kemalpaşa', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (473, N'35', N'Kınık', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (474, N'35', N'Kiraz', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (475, N'35', N'Konak', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (476, N'35', N'Menderes', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (477, N'35', N'Menemen', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (478, N'35', N'Narlıdere', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (479, N'35', N'Ödemiş', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (480, N'35', N'Seferihisar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (481, N'35', N'Selçuk', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (482, N'35', N'Tire', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (483, N'35', N'Torbalı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (484, N'35', N'Urla', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (485, N'36', N'Akyaka', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (486, N'36', N'Arpaçay', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (487, N'36', N'Digor', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (488, N'36', N'Kağızman', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (489, N'36', N'Kars Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (490, N'36', N'Sarıkamış', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (491, N'36', N'Selim', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (492, N'36', N'Susuz', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (493, N'37', N'Abana', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (494, N'37', N'Ağlı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (495, N'37', N'Araç', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (496, N'37', N'Azdavay', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (497, N'37', N'Bozkurt / Kastamonu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (498, N'37', N'Cide', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (499, N'37', N'Çatalzeytin', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (500, N'37', N'Daday', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (501, N'37', N'Devrekani', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (502, N'37', N'Doğanyurt', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (503, N'37', N'Hanönü', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (504, N'37', N'İhsangazi', 1)
GO
print 'Processed 500 total records'
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (505, N'37', N'İnebolu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (506, N'37', N'Kastamonu Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (507, N'37', N'Küre', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (508, N'37', N'Pınarbaşı / Kastamonu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (509, N'37', N'Seydiler', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (510, N'37', N'Şenpazar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (511, N'37', N'Taşköprü', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (512, N'37', N'Tosya', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (513, N'38', N'Akkışla', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (514, N'38', N'Bünyan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (515, N'38', N'Develi', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (516, N'38', N'Felahiye', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (517, N'38', N'Hacılar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (518, N'38', N'İncesu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (519, N'38', N'Kocasinan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (520, N'38', N'Melikgazi', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (521, N'38', N'Özvatan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (522, N'38', N'Pınarbaşı / Kayseri', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (523, N'38', N'Sarıoğlan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (524, N'38', N'Sarız', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (525, N'38', N'Talas', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (526, N'38', N'Tomarza', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (527, N'38', N'Yahyalı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (528, N'38', N'Yeşilhisar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (529, N'39', N'Babaeski', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (530, N'39', N'Demirköy', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (531, N'39', N'Kırklareli Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (532, N'39', N'Kofçaz', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (533, N'39', N'Lüleburgaz', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (534, N'39', N'Pehlivanköy', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (535, N'39', N'Pınarhisar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (536, N'39', N'Vize', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (537, N'40', N'Akçakent', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (538, N'40', N'Akpınar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (539, N'40', N'Boztepe', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (540, N'40', N'Çiçekdağı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (541, N'40', N'Kaman', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (542, N'40', N'Kırşehir Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (543, N'40', N'Mucur', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (544, N'41', N'Başiskele', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (545, N'41', N'Çayırova', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (546, N'41', N'Darıca', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (547, N'41', N'Derince', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (548, N'41', N'Dilovası', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (549, N'41', N'Gebze', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (550, N'41', N'Gölcük', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (551, N'41', N'İzmit', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (552, N'41', N'Kandıra', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (553, N'41', N'Karamürsel', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (554, N'41', N'Kartepe', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (555, N'41', N'Körfez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (556, N'42', N'Ahırlı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (557, N'42', N'Akören', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (558, N'42', N'Akşehir', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (559, N'42', N'Altınekin', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (560, N'42', N'Beyşehir', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (561, N'42', N'Bozkır', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (562, N'42', N'Cihanbeyli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (563, N'42', N'Çeltik', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (564, N'42', N'Çumra', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (565, N'42', N'Derbent', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (566, N'42', N'Derebucak', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (567, N'42', N'Doğanhisar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (568, N'42', N'Emirgazi', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (569, N'42', N'Ereğli / Konya', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (570, N'42', N'Güneysınır', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (571, N'42', N'Hadim', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (572, N'42', N'Halkapınar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (573, N'42', N'Hüyük', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (574, N'42', N'Ilgın', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (575, N'42', N'Kadınhanı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (576, N'42', N'Karapınar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (577, N'42', N'Karatay', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (578, N'42', N'Kulu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (579, N'42', N'Meram', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (580, N'42', N'Sarayönü', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (581, N'42', N'Selçuklu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (582, N'42', N'Seydişehir', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (583, N'42', N'Taşkent', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (584, N'42', N'Tuzlukçu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (585, N'42', N'Yalıhüyük', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (586, N'42', N'Yunak', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (587, N'43', N'Altıntaş', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (588, N'43', N'Aslanapa', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (589, N'43', N'Çavdarhisar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (590, N'43', N'Domaniç', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (591, N'43', N'Dumlupınar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (592, N'43', N'Emet', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (593, N'43', N'Gediz', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (594, N'43', N'Hisarcık', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (595, N'43', N'Kütahya Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (596, N'43', N'Pazarlar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (597, N'43', N'Simav', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (598, N'43', N'Şaphane', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (599, N'43', N'Tavşanlı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (600, N'44', N'Akçadağ', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (601, N'44', N'Arapgir', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (602, N'44', N'Arguvan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (603, N'44', N'Battalgazi', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (604, N'44', N'Darende', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (605, N'44', N'Doğanşehir', 1)
GO
print 'Processed 600 total records'
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (606, N'44', N'Doğanyol', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (607, N'44', N'Hekimhan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (608, N'44', N'Kale / Malatya', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (609, N'44', N'Kuluncak', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (610, N'44', N'Malatya Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (611, N'44', N'Pütürge', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (612, N'44', N'Yazıhan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (613, N'44', N'Yeşilyurt / Malatya', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (614, N'45', N'Ahmetli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (615, N'45', N'Akhisar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (616, N'45', N'Alaşehir', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (617, N'45', N'Demirci', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (618, N'45', N'Gölmarmara', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (619, N'45', N'Gördes', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (620, N'45', N'Kırkağaç', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (621, N'45', N'Köprübaşı / Manisa', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (622, N'45', N'Kula', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (623, N'45', N'Manisa Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (624, N'45', N'Salihli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (625, N'45', N'Sarıgöl', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (626, N'45', N'Saruhanlı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (627, N'45', N'Selendi', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (628, N'45', N'Soma', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (629, N'45', N'Turgutlu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (630, N'46', N'Afşin', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (631, N'46', N'Andırın', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (632, N'46', N'Çağlıyancerit', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (633, N'46', N'Ekinözü', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (634, N'46', N'Elbistan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (635, N'46', N'Göksun', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (636, N'46', N'Kahramanmaraş Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (637, N'46', N'Nurhak', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (638, N'46', N'Pazarcık', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (639, N'46', N'Türkoğlu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (640, N'47', N'Dargeçit', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (641, N'47', N'Derik', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (642, N'47', N'Kızıltepe', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (643, N'47', N'Mardin Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (644, N'47', N'Mazıdağı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (645, N'47', N'Midyat', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (646, N'47', N'Nusaybin', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (647, N'47', N'Ömerli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (648, N'47', N'Savur', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (649, N'47', N'Yeşilli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (650, N'48', N'Bodrum', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (651, N'48', N'Dalaman', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (652, N'48', N'Datça', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (653, N'48', N'Fethiye', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (654, N'48', N'Kavaklıdere', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (655, N'48', N'Köyceğiz', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (656, N'48', N'Marmaris', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (657, N'48', N'Milas', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (658, N'48', N'Muğla Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (659, N'48', N'Ortaca', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (660, N'48', N'Ula', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (661, N'48', N'Yatağan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (662, N'49', N'Bulanık', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (663, N'49', N'Hasköy', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (664, N'49', N'Korkut', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (665, N'49', N'Malazgirt', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (666, N'49', N'Muş Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (667, N'49', N'Varto', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (668, N'50', N'Acıgöl', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (669, N'50', N'Avanos', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (670, N'50', N'Derinkuyu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (671, N'50', N'Gülşehir', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (672, N'50', N'Hacıbektaş', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (673, N'50', N'Kozaklı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (674, N'50', N'Nevşehir Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (675, N'50', N'Ürgüp', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (676, N'51', N'Altunhisar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (677, N'51', N'Bor', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (678, N'51', N'Çamardı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (679, N'51', N'Çiftlik', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (680, N'51', N'Niğde Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (681, N'51', N'Ulukışla', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (682, N'52', N'Akkuş', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (683, N'52', N'Aybastı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (684, N'52', N'Çamaş', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (685, N'52', N'Çatalpınar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (686, N'52', N'Çaybaşı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (687, N'52', N'Fatsa', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (688, N'52', N'Gölköy', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (689, N'52', N'Gülyalı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (690, N'52', N'Gürgentepe', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (691, N'52', N'İkizce', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (692, N'52', N'Kabadüz', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (693, N'52', N'Kabataş', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (694, N'52', N'Korgan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (695, N'52', N'Kumru', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (696, N'52', N'Mesudiye', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (697, N'52', N'Ordu Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (698, N'52', N'Perşembe', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (699, N'52', N'Ulubey / Ordu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (700, N'52', N'Ünye', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (701, N'53', N'Ardeşen', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (702, N'53', N'Çamlıhemşin', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (703, N'53', N'Çayeli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (704, N'53', N'Derepazarı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (705, N'53', N'Fındıklı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (706, N'53', N'Güneysu', 1)
GO
print 'Processed 700 total records'
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (707, N'53', N'Hemşin', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (708, N'53', N'İkizdere', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (709, N'53', N'İyidere', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (710, N'53', N'Kalkandere', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (711, N'53', N'Pazar / Rize', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (712, N'53', N'Rize Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (713, N'54', N'Adapazarı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (714, N'54', N'Akyazı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (715, N'54', N'Arifiye', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (716, N'54', N'Erenler', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (717, N'54', N'Ferizli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (718, N'54', N'Geyve', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (719, N'54', N'Hendek', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (720, N'54', N'Karapürçek', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (721, N'54', N'Karasu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (722, N'54', N'Kaynarca', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (723, N'54', N'Kocaali', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (724, N'54', N'Pamukova', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (725, N'54', N'Sapanca', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (726, N'54', N'Serdivan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (727, N'54', N'Söğütlü', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (728, N'54', N'Taraklı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (729, N'55', N'Alaçam', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (730, N'55', N'Asarcık', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (731, N'55', N'Atakum', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (732, N'55', N'Ayvacık / Samsun', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (733, N'55', N'Bafra', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (734, N'55', N'Canik', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (735, N'55', N'Çarşamba', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (736, N'55', N'Havza', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (737, N'55', N'İlkadım', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (738, N'55', N'Kavak', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (739, N'55', N'Ladik', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (740, N'55', N'Ondokuzmayıs', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (741, N'55', N'Salıpazarı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (742, N'55', N'Tekkeköy', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (743, N'55', N'Terme', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (744, N'55', N'Vezirköprü', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (745, N'55', N'Yakakent', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (746, N'56', N'Aydınlar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (747, N'56', N'Baykan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (748, N'56', N'Eruh', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (749, N'56', N'Kurtalan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (750, N'56', N'Pervari', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (751, N'56', N'Siirt Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (752, N'56', N'Şirvan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (753, N'57', N'Ayancık', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (754, N'57', N'Boyabat', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (755, N'57', N'Dikmen', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (756, N'57', N'Durağan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (757, N'57', N'Erfelek', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (758, N'57', N'Gerze', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (759, N'57', N'Saraydüzü', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (760, N'57', N'Sinop Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (761, N'57', N'Türkeli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (762, N'58', N'Akıncılar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (763, N'58', N'Altınyayla / Sivas', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (764, N'58', N'Divriği', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (765, N'58', N'Doğanşar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (766, N'58', N'Gemerek', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (767, N'58', N'Gölova', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (768, N'58', N'Gürün', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (769, N'58', N'Hafik', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (770, N'58', N'İmranlı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (771, N'58', N'Kangal', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (772, N'58', N'Koyulhisar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (773, N'58', N'Sivas Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (774, N'58', N'Suşehri', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (775, N'58', N'Şarkışla', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (776, N'58', N'Ulaş', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (777, N'58', N'Yıldızeli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (778, N'58', N'Zara', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (779, N'59', N'Çerkezköy', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (780, N'59', N'Çorlu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (781, N'59', N'Hayrabolu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (782, N'59', N'Malkara', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (783, N'59', N'Marmaraereğlisi', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (784, N'59', N'Muratlı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (785, N'59', N'Saray / Tekirdağ', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (786, N'59', N'Şarköy', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (787, N'59', N'Tekirdağ Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (788, N'60', N'Almus', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (789, N'60', N'Artova', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (790, N'60', N'Başçiftlik', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (791, N'60', N'Erbaa', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (792, N'60', N'Niksar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (793, N'60', N'Pazar / Tokat', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (794, N'60', N'Reşadiye', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (795, N'60', N'Sulusaray', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (796, N'60', N'Tokat Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (797, N'60', N'Turhal', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (798, N'60', N'Yeşilyurt / Tokat', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (799, N'60', N'Zile', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (800, N'61', N'Akçaabat', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (801, N'61', N'Araklı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (802, N'61', N'Arsin', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (803, N'61', N'Beşikdüzü', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (804, N'61', N'Çarşıbaşı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (805, N'61', N'Çaykara', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (806, N'61', N'Dernekpazarı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (807, N'61', N'Düzköy', 1)
GO
print 'Processed 800 total records'
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (808, N'61', N'Hayrat', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (809, N'61', N'Köprübaşı / Trabzon', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (810, N'61', N'Maçka', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (811, N'61', N'Of', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (812, N'61', N'Sürmene', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (813, N'61', N'Şalpazarı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (814, N'61', N'Tonya', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (815, N'61', N'Trabzon Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (816, N'61', N'Vakfıkebir', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (817, N'61', N'Yomra', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (818, N'62', N'Çemişgezek', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (819, N'62', N'Hozat', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (820, N'62', N'Mazgirt', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (821, N'62', N'Nazımiye', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (822, N'62', N'Ovacık / Tunceli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (823, N'62', N'Pertek', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (824, N'62', N'Pülümür', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (825, N'62', N'Tunceli Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (826, N'63', N'Akçakale', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (827, N'63', N'Birecik', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (828, N'63', N'Bozova', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (829, N'63', N'Ceylanpınar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (830, N'63', N'Halfeti', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (831, N'63', N'Harran', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (832, N'63', N'Hilvan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (833, N'63', N'Siverek', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (834, N'63', N'Suruç', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (835, N'63', N'Şanlıurfa Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (836, N'63', N'Viranşehir', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (837, N'64', N'Banaz', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (838, N'64', N'Eşme', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (839, N'64', N'Karahallı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (840, N'64', N'Sivaslı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (841, N'64', N'Ulubey / Uşak', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (842, N'64', N'Uşak Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (843, N'65', N'Bahçesaray', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (844, N'65', N'Başkale', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (845, N'65', N'Çaldıran', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (846, N'65', N'Çatak', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (847, N'65', N'Edremit / Van', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (848, N'65', N'Erciş', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (849, N'65', N'Gevaş', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (850, N'65', N'Gürpınar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (851, N'65', N'Muradiye', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (852, N'65', N'Özalp', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (853, N'65', N'Saray / Van', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (854, N'65', N'Van Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (855, N'66', N'Akdağmadeni', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (856, N'66', N'Aydıncık / Yozgat', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (857, N'66', N'Boğazlıyan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (858, N'66', N'Çandır', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (859, N'66', N'Çayıralan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (860, N'66', N'Çekerek', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (861, N'66', N'Kadışehri', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (862, N'66', N'Saraykent', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (863, N'66', N'Sarıkaya', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (864, N'66', N'Sorgun', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (865, N'66', N'Şefaatli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (866, N'66', N'Yenifakılı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (867, N'66', N'Yerköy', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (868, N'66', N'Yozgat Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (869, N'67', N'Alaplı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (870, N'67', N'Çaycuma', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (871, N'67', N'Devrek', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (872, N'67', N'Ereğli / Zonguldak', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (873, N'67', N'Gökçebey', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (874, N'67', N'Zonguldak Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (875, N'68', N'Ağaçören', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (876, N'68', N'Aksaray Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (877, N'68', N'Eskil', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (878, N'68', N'Gülağaç', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (879, N'68', N'Güzelyurt', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (880, N'68', N'Ortaköy', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (881, N'68', N'Sarıyahşi', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (882, N'69', N'Aydıntepe', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (883, N'69', N'Bayburt Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (884, N'69', N'Demirözü', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (885, N'70', N'Ayrancı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (886, N'70', N'Başyayla', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (887, N'70', N'Ermenek', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (888, N'70', N'Karaman Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (889, N'70', N'Kazımkarabekir', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (890, N'70', N'Sarıveliler', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (891, N'71', N'Bahşili', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (892, N'71', N'Balışeyh', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (893, N'71', N'Çelebi', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (894, N'71', N'Delice', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (895, N'71', N'Karakeçili', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (896, N'71', N'Keskin', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (897, N'71', N'Kırıkkale Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (898, N'71', N'Sulakyurt', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (899, N'71', N'Yahşihan', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (900, N'72', N'Batman Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (901, N'72', N'Beşiri', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (902, N'72', N'Gercüş', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (903, N'72', N'Hasankeyf', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (904, N'72', N'Kozluk', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (905, N'72', N'Sason', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (906, N'73', N'Beytüşşebap', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (907, N'73', N'Cizre', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (908, N'73', N'Güçlükonak', 1)
GO
print 'Processed 900 total records'
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (909, N'73', N'İdil', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (910, N'73', N'Silopi', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (911, N'73', N'Şırnak Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (912, N'73', N'Uludere', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (913, N'74', N'Amasra', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (914, N'74', N'Bartın Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (915, N'74', N'Kurucaşile', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (916, N'74', N'Ulus', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (917, N'75', N'Ardahan Merkez', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (918, N'75', N'Çıldır', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (919, N'75', N'Damal', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (920, N'75', N'Göle', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (921, N'75', N'Hanak', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (922, N'75', N'Posof', 0)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (923, N'76', N'Aralık', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (924, N'76', N'Iğdır Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (925, N'76', N'Karakoyunlu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (926, N'76', N'Tuzluca', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (927, N'77', N'Altınova', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (928, N'77', N'Armutlu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (929, N'77', N'Çınarcık', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (930, N'77', N'Çiftlikköy', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (931, N'77', N'Termal', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (932, N'77', N'Yalova Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (933, N'78', N'Eflani', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (934, N'78', N'Eskipazar', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (935, N'78', N'Karabük Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (936, N'78', N'Ovacık / Karabük', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (937, N'78', N'Safranbolu', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (938, N'78', N'Yenice / Karabük', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (939, N'79', N'Elbeyli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (940, N'79', N'Kilis Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (941, N'79', N'Musabeyli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (942, N'79', N'Polateli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (943, N'80', N'Bahçe', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (944, N'80', N'Düziçi', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (945, N'80', N'Hasanbeyli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (946, N'80', N'Kadirli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (947, N'80', N'Osmaniye Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (948, N'80', N'Sumbas', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (949, N'80', N'Toprakkale', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (950, N'81', N'Akçakoca', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (951, N'81', N'Cumayeri', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (952, N'81', N'Çilimli', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (953, N'81', N'Düzce Merkez', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (954, N'81', N'Gölyaka', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (955, N'81', N'Gümüşova', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (956, N'81', N'Kaynaşlı', 1)
INSERT [dbo].[Districts] ([DistrictId], [CityId], [DistrictName], [DistrictStatus]) VALUES (957, N'81', N'Yığılca', 1)
SET IDENTITY_INSERT [dbo].[Districts] OFF
/****** Object:  Table [dbo].[Elections]    Script Date: 05/15/2013 00:18:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Elections](
	[ElectionId] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NULL,
	[Name] [varchar](255) NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ElectionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Elections] ON
INSERT [dbo].[Elections] ([ElectionId], [TypeId], [Name], [CreatedAt], [CreatedBy]) VALUES (2, 1, N'Genel Seçim', CAST(0x0000A19300000000 AS DateTime), N'20093509402')
INSERT [dbo].[Elections] ([ElectionId], [TypeId], [Name], [CreatedAt], [CreatedBy]) VALUES (5, 1, N'Test Seçimi', CAST(0x0000A1A900BB820B AS DateTime), N'20093509402')
INSERT [dbo].[Elections] ([ElectionId], [TypeId], [Name], [CreatedAt], [CreatedBy]) VALUES (6, 2, N'Test Seçimi3', CAST(0x0000A1A901039FA8 AS DateTime), N'20093509402')
INSERT [dbo].[Elections] ([ElectionId], [TypeId], [Name], [CreatedAt], [CreatedBy]) VALUES (7, 1, N'Test Seçimi4', CAST(0x0000A1A9010447AE AS DateTime), N'20093509402')
INSERT [dbo].[Elections] ([ElectionId], [TypeId], [Name], [CreatedAt], [CreatedBy]) VALUES (8, 1, N'Test Seçimi5', CAST(0x0000A1A901047737 AS DateTime), N'20093509402')
INSERT [dbo].[Elections] ([ElectionId], [TypeId], [Name], [CreatedAt], [CreatedBy]) VALUES (9, 1, N'Test Seçimi7', CAST(0x0000A1A90104BDC2 AS DateTime), N'20093509402')
INSERT [dbo].[Elections] ([ElectionId], [TypeId], [Name], [CreatedAt], [CreatedBy]) VALUES (10, 1, N'Test Seçimi8', CAST(0x0000A1A9013D16AB AS DateTime), N'20093509402')
INSERT [dbo].[Elections] ([ElectionId], [TypeId], [Name], [CreatedAt], [CreatedBy]) VALUES (11, 1, N'Test Seçimi9', CAST(0x0000A1A9013D8314 AS DateTime), N'20093509402')
INSERT [dbo].[Elections] ([ElectionId], [TypeId], [Name], [CreatedAt], [CreatedBy]) VALUES (12, 1, N'Test Seçimi12', CAST(0x0000A1A9014233A3 AS DateTime), N'20093509402')
INSERT [dbo].[Elections] ([ElectionId], [TypeId], [Name], [CreatedAt], [CreatedBy]) VALUES (13, 1, N'Test Seçimi32', CAST(0x0000A1A90142C596 AS DateTime), N'20093509402')
INSERT [dbo].[Elections] ([ElectionId], [TypeId], [Name], [CreatedAt], [CreatedBy]) VALUES (14, 2, N'Test Seçimi13', CAST(0x0000A1B100CECDA5 AS DateTime), N'20093509402')
INSERT [dbo].[Elections] ([ElectionId], [TypeId], [Name], [CreatedAt], [CreatedBy]) VALUES (15, 1, N'Test Seçimi21', CAST(0x0000A1B100D0DE5D AS DateTime), N'20093509402')
INSERT [dbo].[Elections] ([ElectionId], [TypeId], [Name], [CreatedAt], [CreatedBy]) VALUES (16, 1, N'Test Seçimi112', CAST(0x0000A1B100DF0C5C AS DateTime), N'20093509402')
INSERT [dbo].[Elections] ([ElectionId], [TypeId], [Name], [CreatedAt], [CreatedBy]) VALUES (17, 1, N'Test Seçimi36', CAST(0x0000A1B100E10E74 AS DateTime), N'20093509402')
INSERT [dbo].[Elections] ([ElectionId], [TypeId], [Name], [CreatedAt], [CreatedBy]) VALUES (18, 1, N'Test Seçimi113', CAST(0x0000A1B100E3F7B6 AS DateTime), N'20093509402')
INSERT [dbo].[Elections] ([ElectionId], [TypeId], [Name], [CreatedAt], [CreatedBy]) VALUES (19, 1, N'Arayüz test', CAST(0x0000A1BC01509F9A AS DateTime), N'20093509402')
SET IDENTITY_INSERT [dbo].[Elections] OFF
/****** Object:  Table [dbo].[RegionDetails]    Script Date: 05/15/2013 00:18:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegionDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[RegionId] [int] NULL,
	[DistrictId] [int] NULL,
	[RegionStatus] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RegionDetails] ON
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (1, 6, 917, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (2, 6, 918, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (3, 6, 919, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (4, 6, 920, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (5, 6, 921, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (6, 6, 922, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (7, 7, 17, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (8, 7, 19, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (9, 7, 20, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (10, 7, 21, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (11, 7, 22, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (12, 7, 23, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (25, 10, 1, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (26, 10, 2, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (27, 10, 4, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (28, 10, 7, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (29, 10, 8, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (30, 11, 5, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (31, 11, 9, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (32, 12, 10, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (33, 12, 12, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (34, 9, 11, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (35, 9, 26, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (36, 9, 27, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (37, 9, 28, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (38, 9, 30, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (39, 9, 31, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (40, 9, 32, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (41, 9, 34, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (42, 9, 35, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (43, 9, 37, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (44, 9, 38, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (45, 9, 39, 1)
INSERT [dbo].[RegionDetails] ([id], [RegionId], [DistrictId], [RegionStatus]) VALUES (46, 9, 41, 1)
SET IDENTITY_INSERT [dbo].[RegionDetails] OFF
/****** Object:  Table [dbo].[ElectionDetails]    Script Date: 05/15/2013 00:18:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ElectionDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ElectionId] [int] NULL,
	[StartDate] [datetime] NULL,
	[FinishDate] [datetime] NULL,
	[StatusId] [int] NULL,
	[StartedBy] [varchar](11) NULL,
	[FinishedBy] [varchar](11) NULL,
	[ActionDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ElectionDetails] ON
INSERT [dbo].[ElectionDetails] ([Id], [ElectionId], [StartDate], [FinishDate], [StatusId], [StartedBy], [FinishedBy], [ActionDate]) VALUES (1, 12, CAST(0x0000A2410083D600 AS DateTime), CAST(0x0000A2410128A180 AS DateTime), 1, N'20093509402', N'20093509402', CAST(0x0000A1A901424406 AS DateTime))
INSERT [dbo].[ElectionDetails] ([Id], [ElectionId], [StartDate], [FinishDate], [StatusId], [StartedBy], [FinishedBy], [ActionDate]) VALUES (2, 13, CAST(0x0000A2410083D600 AS DateTime), CAST(0x0000A2410128A180 AS DateTime), 1, N'20093509402', N'20093509402', CAST(0x0000A1A90142D7D3 AS DateTime))
INSERT [dbo].[ElectionDetails] ([Id], [ElectionId], [StartDate], [FinishDate], [StatusId], [StartedBy], [FinishedBy], [ActionDate]) VALUES (3, 14, CAST(0x0000A2410083D600 AS DateTime), CAST(0x0000A2410128A180 AS DateTime), 2, N'20093509402', N'20093509402', CAST(0x0000A1B100CEE046 AS DateTime))
INSERT [dbo].[ElectionDetails] ([Id], [ElectionId], [StartDate], [FinishDate], [StatusId], [StartedBy], [FinishedBy], [ActionDate]) VALUES (4, 15, CAST(0x0000A2410083D600 AS DateTime), CAST(0x0000A2410128A180 AS DateTime), 1, N'20093509402', N'20093509402', CAST(0x0000A1B100D1016D AS DateTime))
INSERT [dbo].[ElectionDetails] ([Id], [ElectionId], [StartDate], [FinishDate], [StatusId], [StartedBy], [FinishedBy], [ActionDate]) VALUES (5, 15, CAST(0x0000A2410083D600 AS DateTime), CAST(0x0000A2410128A180 AS DateTime), 2, N'20093509402', N'20093509402', CAST(0x0000A1B100D139B2 AS DateTime))
INSERT [dbo].[ElectionDetails] ([Id], [ElectionId], [StartDate], [FinishDate], [StatusId], [StartedBy], [FinishedBy], [ActionDate]) VALUES (6, 15, CAST(0x0000A2410083D600 AS DateTime), CAST(0x0000A2410128A180 AS DateTime), 3, N'20093509402', N'20093509402', CAST(0x0000A1B100D14730 AS DateTime))
INSERT [dbo].[ElectionDetails] ([Id], [ElectionId], [StartDate], [FinishDate], [StatusId], [StartedBy], [FinishedBy], [ActionDate]) VALUES (7, 15, CAST(0x0000A2410083D600 AS DateTime), CAST(0x0000A2410128A180 AS DateTime), 4, N'20093509402', N'20093509402', CAST(0x0000A1B100D14FD1 AS DateTime))
INSERT [dbo].[ElectionDetails] ([Id], [ElectionId], [StartDate], [FinishDate], [StatusId], [StartedBy], [FinishedBy], [ActionDate]) VALUES (9, 15, CAST(0x0000A2410083D600 AS DateTime), CAST(0x0000A2410128A180 AS DateTime), 6, N'20093509402', N'20093509402', CAST(0x0000A1B100D15CC3 AS DateTime))
INSERT [dbo].[ElectionDetails] ([Id], [ElectionId], [StartDate], [FinishDate], [StatusId], [StartedBy], [FinishedBy], [ActionDate]) VALUES (10, 5, NULL, NULL, NULL, N'20093509402', N'20093509402', CAST(0x0000A1B100E2C7EF AS DateTime))
INSERT [dbo].[ElectionDetails] ([Id], [ElectionId], [StartDate], [FinishDate], [StatusId], [StartedBy], [FinishedBy], [ActionDate]) VALUES (11, 2, NULL, NULL, NULL, N'20093509402', N'20093509402', CAST(0x0000A1B100E33749 AS DateTime))
INSERT [dbo].[ElectionDetails] ([Id], [ElectionId], [StartDate], [FinishDate], [StatusId], [StartedBy], [FinishedBy], [ActionDate]) VALUES (12, 6, NULL, NULL, NULL, N'20093509402', N'20093509402', CAST(0x0000A1B100E391A6 AS DateTime))
INSERT [dbo].[ElectionDetails] ([Id], [ElectionId], [StartDate], [FinishDate], [StatusId], [StartedBy], [FinishedBy], [ActionDate]) VALUES (13, 18, CAST(0x0000A2410083D600 AS DateTime), CAST(0x0000A2410128A180 AS DateTime), 1, N'20093509402', N'20093509402', CAST(0x0000A1B100E4055E AS DateTime))
INSERT [dbo].[ElectionDetails] ([Id], [ElectionId], [StartDate], [FinishDate], [StatusId], [StartedBy], [FinishedBy], [ActionDate]) VALUES (14, 19, CAST(0x0000A1B100000000 AS DateTime), CAST(0x0000A1CF00000000 AS DateTime), 1, N'20093509402', N'20093509402', CAST(0x0000A1BC0150C264 AS DateTime))
INSERT [dbo].[ElectionDetails] ([Id], [ElectionId], [StartDate], [FinishDate], [StatusId], [StartedBy], [FinishedBy], [ActionDate]) VALUES (15, 19, CAST(0x0000A1B200000000 AS DateTime), CAST(0x0000A1B400000000 AS DateTime), 2, N'20093509402', N'20093509402', CAST(0x0000A1BC0150D2AE AS DateTime))
INSERT [dbo].[ElectionDetails] ([Id], [ElectionId], [StartDate], [FinishDate], [StatusId], [StartedBy], [FinishedBy], [ActionDate]) VALUES (16, 19, CAST(0x0000A1B500000000 AS DateTime), CAST(0x0000A1B800000000 AS DateTime), 3, N'20093509402', N'20093509402', CAST(0x0000A1BC0150DFA3 AS DateTime))
INSERT [dbo].[ElectionDetails] ([Id], [ElectionId], [StartDate], [FinishDate], [StatusId], [StartedBy], [FinishedBy], [ActionDate]) VALUES (18, 19, CAST(0x0000A1BA00000000 AS DateTime), CAST(0x0000A1BE00000000 AS DateTime), 4, N'20093509402', N'20093509402', CAST(0x0000A1BC01512A52 AS DateTime))
INSERT [dbo].[ElectionDetails] ([Id], [ElectionId], [StartDate], [FinishDate], [StatusId], [StartedBy], [FinishedBy], [ActionDate]) VALUES (19, 19, CAST(0x0000A1BC00000000 AS DateTime), CAST(0x0000A1BD00000000 AS DateTime), 5, N'20093509402', N'20093509402', CAST(0x0000A1BC0151447D AS DateTime))
SET IDENTITY_INSERT [dbo].[ElectionDetails] OFF
/****** Object:  Table [dbo].[Votes]    Script Date: 05/15/2013 00:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Votes](
	[VoteId] [int] IDENTITY(1,1) NOT NULL,
	[ElectionId] [int] NULL,
	[RegionId] [int] NULL,
	[DistrictId] [int] NULL,
	[PartyId] [int] NULL,
	[UsedAt] [datetime] NULL,
	[UsedFrom] [int] NULL,
	[VoteStatus] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[VoteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Votes] ON
INSERT [dbo].[Votes] ([VoteId], [ElectionId], [RegionId], [DistrictId], [PartyId], [UsedAt], [UsedFrom], [VoteStatus]) VALUES (1, 19, 1, 418, 22, CAST(0x0000A1BE01874F30 AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[Votes] OFF
/****** Object:  View [dbo].[VRegions]    Script Date: 05/15/2013 00:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VRegions] AS
SELECT r.RegionId,r.Region,c.CityId,c.CityName,r.CandidateCount,COUNT(rd.RegionId) AS DistrictCount FROM  dbo.Regions r
INNER JOIN dbo.Cities c ON c.CityId = r.CityId
INNER JOIN dbo.RegionDetails rd ON rd.RegionId = r.RegionId
GROUP BY 
r.RegionId,r.Region,c.CityId,c.CityName,r.CandidateCount
GO
/****** Object:  View [dbo].[VElectionDetails]    Script Date: 05/15/2013 00:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[VElectionDetails] AS
SELECT ed.ElectionId,
		e.Name,
		ed.StartDate,
		ed.FinishDate,
		ed.ActionDate,
		es.StatusName,
		ed.StartedBy,
		ed.FinishedBy 
FROM Elections e
LEFT JOIN dbo.ElectionDetails ed ON ed.ElectionId =e.ElectionId
LEFT JOIN  dbo.ElectionStatus es ON es.StatusId = ed.StatusId
GO
/****** Object:  ForeignKey [FK_Districts_Cities]    Script Date: 05/15/2013 00:18:34 ******/
ALTER TABLE [dbo].[Districts]  WITH CHECK ADD  CONSTRAINT [FK_Districts_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([CityId])
GO
ALTER TABLE [dbo].[Districts] CHECK CONSTRAINT [FK_Districts_Cities]
GO
/****** Object:  ForeignKey [FK_ElectionDetails_Elections]    Script Date: 05/15/2013 00:18:34 ******/
ALTER TABLE [dbo].[ElectionDetails]  WITH CHECK ADD  CONSTRAINT [FK_ElectionDetails_Elections] FOREIGN KEY([ElectionId])
REFERENCES [dbo].[Elections] ([ElectionId])
GO
ALTER TABLE [dbo].[ElectionDetails] CHECK CONSTRAINT [FK_ElectionDetails_Elections]
GO
/****** Object:  ForeignKey [FK_ElectionDetails_ElectionStatus]    Script Date: 05/15/2013 00:18:34 ******/
ALTER TABLE [dbo].[ElectionDetails]  WITH CHECK ADD  CONSTRAINT [FK_ElectionDetails_ElectionStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ElectionStatus] ([StatusId])
GO
ALTER TABLE [dbo].[ElectionDetails] CHECK CONSTRAINT [FK_ElectionDetails_ElectionStatus]
GO
/****** Object:  ForeignKey [FK_Elections_ElectionTypes]    Script Date: 05/15/2013 00:18:34 ******/
ALTER TABLE [dbo].[Elections]  WITH CHECK ADD  CONSTRAINT [FK_Elections_ElectionTypes] FOREIGN KEY([TypeId])
REFERENCES [dbo].[ElectionTypes] ([ElectionTypeId])
GO
ALTER TABLE [dbo].[Elections] CHECK CONSTRAINT [FK_Elections_ElectionTypes]
GO
/****** Object:  ForeignKey [FK_RegionDetails_Districts]    Script Date: 05/15/2013 00:18:34 ******/
ALTER TABLE [dbo].[RegionDetails]  WITH CHECK ADD  CONSTRAINT [FK_RegionDetails_Districts] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[Districts] ([DistrictId])
GO
ALTER TABLE [dbo].[RegionDetails] CHECK CONSTRAINT [FK_RegionDetails_Districts]
GO
/****** Object:  ForeignKey [FK_RegionDetails_Regions]    Script Date: 05/15/2013 00:18:34 ******/
ALTER TABLE [dbo].[RegionDetails]  WITH CHECK ADD  CONSTRAINT [FK_RegionDetails_Regions] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Regions] ([RegionId])
GO
ALTER TABLE [dbo].[RegionDetails] CHECK CONSTRAINT [FK_RegionDetails_Regions]
GO
/****** Object:  ForeignKey [FK_SessionDetails_UserSessions]    Script Date: 05/15/2013 00:18:34 ******/
ALTER TABLE [dbo].[SessionDetails]  WITH CHECK ADD  CONSTRAINT [FK_SessionDetails_UserSessions] FOREIGN KEY([SessionId])
REFERENCES [dbo].[UserSessions] ([SessionId])
GO
ALTER TABLE [dbo].[SessionDetails] CHECK CONSTRAINT [FK_SessionDetails_UserSessions]
GO
/****** Object:  ForeignKey [FK_Votes_Districts]    Script Date: 05/15/2013 00:18:35 ******/
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_Districts] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[Districts] ([DistrictId])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_Districts]
GO
/****** Object:  ForeignKey [FK_Votes_Elections]    Script Date: 05/15/2013 00:18:35 ******/
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_Elections] FOREIGN KEY([ElectionId])
REFERENCES [dbo].[Elections] ([ElectionId])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_Elections]
GO
/****** Object:  ForeignKey [FK_Votes_Regions]    Script Date: 05/15/2013 00:18:35 ******/
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_Regions] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Regions] ([RegionId])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_Regions]
GO
