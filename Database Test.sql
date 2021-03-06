USE [FujitsuTest]
GO
/****** Object:  Table [dbo].[Provinces]    Script Date: 17/01/2020 17:28:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provinces](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ProvinceCode] [nvarchar](50) NOT NULL,
	[ProvinceDesc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Provinces_1] PRIMARY KEY CLUSTERED 
(
	[ProvinceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 17/01/2020 17:28:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CityCode] [nvarchar](50) NOT NULL,
	[CityDesc] [nvarchar](50) NULL,
	[ProvinceCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_City_1] PRIMARY KEY CLUSTERED 
(
	[CityCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 17/01/2020 17:28:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SupplierCode] [nvarchar](50) NOT NULL,
	[SupplierName] [nvarchar](100) NULL,
	[Address] [nvarchar](200) NULL,
	[ProvinceCode] [nvarchar](50) NULL,
	[CityCode] [nvarchar](50) NULL,
	[PIC] [nvarchar](50) NULL,
 CONSTRAINT [PK_Supplier_1] PRIMARY KEY CLUSTERED 
(
	[SupplierCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewSuppliers]    Script Date: 17/01/2020 17:28:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewSuppliers]
AS
SELECT        s.id, s.SupplierCode, s.SupplierName, s.ProvinceCode, p.ProvinceDesc, s.CityCode, c.CityDesc, s.Address, s.PIC
FROM            dbo.Supplier AS s LEFT OUTER JOIN
                         dbo.Provinces AS p ON s.ProvinceCode = p.ProvinceCode LEFT OUTER JOIN
                         dbo.City AS c ON s.CityCode = c.CityCode
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 17/01/2020 17:28:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_No] [nvarchar](50) NULL,
	[Order_Date] [date] NULL,
	[Supplier_Code] [nvarchar](50) NULL,
	[Amount] [money] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([id], [CityCode], [CityDesc], [ProvinceCode]) VALUES (11, N'BD', N'Bandung', N'JBR')
INSERT [dbo].[City] ([id], [CityCode], [CityDesc], [ProvinceCode]) VALUES (12, N'BG', N'Bogor', N'JBR')
INSERT [dbo].[City] ([id], [CityCode], [CityDesc], [ProvinceCode]) VALUES (13, N'BS', N'Bekasi', N'JBR')
INSERT [dbo].[City] ([id], [CityCode], [CityDesc], [ProvinceCode]) VALUES (8, N'JB', N'Jakbar', N'DKI')
INSERT [dbo].[City] ([id], [CityCode], [CityDesc], [ProvinceCode]) VALUES (9, N'JP', N'Jakpus', N'DKI')
INSERT [dbo].[City] ([id], [CityCode], [CityDesc], [ProvinceCode]) VALUES (10, N'JS', N'Jaksel', N'DKI')
INSERT [dbo].[City] ([id], [CityCode], [CityDesc], [ProvinceCode]) VALUES (14, N'SL', N'Solo', N'JTG')
INSERT [dbo].[City] ([id], [CityCode], [CityDesc], [ProvinceCode]) VALUES (15, N'SM', N'Semarang', N'JTG')
SET IDENTITY_INSERT [dbo].[City] OFF
INSERT [dbo].[Orders] ([Order_No], [Order_Date], [Supplier_Code], [Amount]) VALUES (N'ORD-001', CAST(N'2019-01-01' AS Date), N'AB', 150.0000)
INSERT [dbo].[Orders] ([Order_No], [Order_Date], [Supplier_Code], [Amount]) VALUES (N'ORD-002', CAST(N'2019-04-01' AS Date), N'DG', 250.0000)
INSERT [dbo].[Orders] ([Order_No], [Order_Date], [Supplier_Code], [Amount]) VALUES (N'ORD-003', CAST(N'2019-05-01' AS Date), N'KL', 35.0000)
INSERT [dbo].[Orders] ([Order_No], [Order_Date], [Supplier_Code], [Amount]) VALUES (N'ORD-004', CAST(N'2019-08-01' AS Date), N'KL', 40.0000)
INSERT [dbo].[Orders] ([Order_No], [Order_Date], [Supplier_Code], [Amount]) VALUES (N'ORD-005', CAST(N'2019-02-08' AS Date), N'ST', 51.0000)
INSERT [dbo].[Orders] ([Order_No], [Order_Date], [Supplier_Code], [Amount]) VALUES (N'ORD-006', CAST(N'2019-02-12' AS Date), N'KL', 16.0000)
INSERT [dbo].[Orders] ([Order_No], [Order_Date], [Supplier_Code], [Amount]) VALUES (N'ORD-007', CAST(N'2019-02-13' AS Date), N'MN', 25.0000)
INSERT [dbo].[Orders] ([Order_No], [Order_Date], [Supplier_Code], [Amount]) VALUES (N'ORD-008', CAST(N'2019-02-15' AS Date), N'MN', 350.0000)
INSERT [dbo].[Orders] ([Order_No], [Order_Date], [Supplier_Code], [Amount]) VALUES (N'ORD-009', CAST(N'2019-02-20' AS Date), N'AB', 1200.0000)
SET IDENTITY_INSERT [dbo].[Provinces] ON 

INSERT [dbo].[Provinces] ([id], [ProvinceCode], [ProvinceDesc]) VALUES (2, N'DKI', N'DKI Jakarta')
INSERT [dbo].[Provinces] ([id], [ProvinceCode], [ProvinceDesc]) VALUES (3, N'JBR', N'Jabar')
INSERT [dbo].[Provinces] ([id], [ProvinceCode], [ProvinceDesc]) VALUES (4, N'JTG', N'Jateng')
SET IDENTITY_INSERT [dbo].[Provinces] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([id], [SupplierCode], [SupplierName], [Address], [ProvinceCode], [CityCode], [PIC]) VALUES (7, N'AB', N'gf', N'gf', N'JBR', N'BD', N'gf        ')
INSERT [dbo].[Supplier] ([id], [SupplierCode], [SupplierName], [Address], [ProvinceCode], [CityCode], [PIC]) VALUES (2, N'DG', N'Fujitsu', N'Sudir', N'JTG', N'SL', N'Bu        ')
INSERT [dbo].[Supplier] ([id], [SupplierCode], [SupplierName], [Address], [ProvinceCode], [CityCode], [PIC]) VALUES (4, N'KL', N'Jasam', N'senopa', N'JTG', N'SM', N'Bu        ')
INSERT [dbo].[Supplier] ([id], [SupplierCode], [SupplierName], [Address], [ProvinceCode], [CityCode], [PIC]) VALUES (6, N'MN', N'Pajdaran', N'elos', N'JBR', N'BG', N'Bupak     ')
INSERT [dbo].[Supplier] ([id], [SupplierCode], [SupplierName], [Address], [ProvinceCode], [CityCode], [PIC]) VALUES (1, N'ST', N'Indocyber', N'Daan Mogot', N'DKI', N'JB', N'Tani')
INSERT [dbo].[Supplier] ([id], [SupplierCode], [SupplierName], [Address], [ProvinceCode], [CityCode], [PIC]) VALUES (3, N'TPN', N'Taspen', N'Sudirman', N'DKI', N'JP', N'Pak       ')
INSERT [dbo].[Supplier] ([id], [SupplierCode], [SupplierName], [Address], [ProvinceCode], [CityCode], [PIC]) VALUES (5, N'TS', N'Test saved', N'Condet raya', N'JBR', N'BG', N'Bu Pakkkk ')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Provinces] FOREIGN KEY([ProvinceCode])
REFERENCES [dbo].[Provinces] ([ProvinceCode])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Provinces]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_City] FOREIGN KEY([CityCode])
REFERENCES [dbo].[City] ([CityCode])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_City]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Provinces] FOREIGN KEY([ProvinceCode])
REFERENCES [dbo].[Provinces] ([ProvinceCode])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_Provinces]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewSuppliers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewSuppliers'
GO
