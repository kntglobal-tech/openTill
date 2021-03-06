USE [master]
GO
/****** Object:  Database [POS_Initial]    Script Date: 3/8/2014 3:24:57 PM ******/
CREATE DATABASE [POS_Initial]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'POS_Initial', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\POS_Initial.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'POS_Initial_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\POS_Initial_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [POS_Initial] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [POS_Initial].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [POS_Initial] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [POS_Initial] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [POS_Initial] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [POS_Initial] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [POS_Initial] SET ARITHABORT OFF 
GO
ALTER DATABASE [POS_Initial] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [POS_Initial] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [POS_Initial] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [POS_Initial] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [POS_Initial] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [POS_Initial] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [POS_Initial] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [POS_Initial] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [POS_Initial] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [POS_Initial] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [POS_Initial] SET  DISABLE_BROKER 
GO
ALTER DATABASE [POS_Initial] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [POS_Initial] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [POS_Initial] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [POS_Initial] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [POS_Initial] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [POS_Initial] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [POS_Initial] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [POS_Initial] SET RECOVERY FULL 
GO
ALTER DATABASE [POS_Initial] SET  MULTI_USER 
GO
ALTER DATABASE [POS_Initial] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [POS_Initial] SET DB_CHAINING OFF 
GO
ALTER DATABASE [POS_Initial] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [POS_Initial] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'POS_Initial', N'ON'
GO
USE [POS_Initial]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 3/8/2014 3:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Street] [varchar](75) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[StateId] [int] NOT NULL,
	[ZipId] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 3/8/2014 3:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](75) NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/8/2014 3:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Category_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 3/8/2014 3:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FName] [varchar](50) NOT NULL,
	[LName] [varchar](50) NOT NULL,
	[PositionId] [int] NOT NULL,
	[AddressId] [int] NOT NULL,
	[PhoneId] [int] NOT NULL,
	[Wage] [money] NOT NULL,
	[SSN] [int] NOT NULL,
	[BirthDate] [date] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[PasswordHash] [uniqueidentifier] NULL,
	[PinHash] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Phone]    Script Date: 3/8/2014 3:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Phone](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PhoneNumber] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Phone] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Position]    Script Date: 3/8/2014 3:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Position](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/8/2014 3:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[UPC] [varchar](100) NOT NULL,
	[BrandId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[StoreCost] [money] NOT NULL,
	[SellingPrice] [money] NOT NULL,
	[OnHand] [int] NOT NULL,
	[MinOnHand] [int] NOT NULL,
	[HasDeposit] [bit] NOT NULL,
	[IsTaxable] [bit] NOT NULL,
	[MinimumAge] [tinyint] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[UPC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 3/8/2014 3:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductUPC] [varchar](100) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_CategoryList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 3/8/2014 3:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateOfSale] [datetime] NOT NULL,
	[Total] [money] NOT NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SaleItem]    Script Date: 3/8/2014 3:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SaleItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SaleId] [int] NOT NULL,
	[ProductId] [varchar](100) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_SaleItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[State]    Script Date: 3/8/2014 3:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[State](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullStateName] [varchar](50) NOT NULL,
	[AbbreviatedStateName] [char](2) NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ZipCode]    Script Date: 3/8/2014 3:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZipCode](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ZipCode] [varchar](20) NOT NULL,
 CONSTRAINT [PK_ZipCode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name]) VALUES (1, N'Generic')
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Description]) VALUES (1, N'Produce', N'Fruits and Vegetable type food stuffs')
INSERT [dbo].[Category] ([Id], [Name], [Description]) VALUES (2, N'Dairy', N'You know what dair is.')
INSERT [dbo].[Category] ([Id], [Name], [Description]) VALUES (3, N'Cigarette', N'Cancer sticks')
INSERT [dbo].[Category] ([Id], [Name], [Description]) VALUES (4, N'Beer', N'Most popular drink in the world.')
INSERT [dbo].[Category] ([Id], [Name], [Description]) VALUES (5, N'Chips', N'Various chip products')
INSERT [dbo].[Category] ([Id], [Name], [Description]) VALUES (6, N'Magazine', N'Magazines for outstanding citizens.')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (1, N'Alabama', N'AL')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (2, N'Alaska', N'AK')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (3, N'Arizona', N'AZ')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (4, N'Arkansas', N'AR')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (5, N'California', N'CA')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (6, N'Colorado', N'CO')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (7, N'Conneticut', N'CT')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (8, N'Deleware', N'DE')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (9, N'Florida', N'FL')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (10, N'Georgia', N'GA')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (11, N'Hawaii', N'HI')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (12, N'Idaho', N'ID')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (13, N'Illinois', N'IL')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (14, N'Indiana', N'IN')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (15, N'Iowa', N'IA')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (16, N'Kansas', N'KS')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (17, N'Kentucky', N'KY')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (18, N'Louisiana', N'LA')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (19, N'Maine', N'ME')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (20, N'Maryland', N'MD')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (21, N'Massachusetts', N'MA')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (22, N'Michigan', N'MI')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (23, N'Minnesota', N'MN')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (24, N'Mississippi', N'MS')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (25, N'Missouri', N'MO')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (26, N'Montana', N'MT')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (27, N'Nebraska', N'NE')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (28, N'Nevada', N'NV')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (29, N'New Hampshire', N'NH')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (30, N'New Jersey', N'NJ')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (31, N'New Mexico', N'NM')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (32, N'New York', N'NY')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (33, N'North Carolina', N'NC')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (34, N'North Dakota', N'ND')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (35, N'Ohio', N'OH')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (36, N'Oklahoma', N'OK')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (37, N'Oregon', N'OR')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (38, N'Pennsylvania', N'PA')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (39, N'Rhode Island', N'RI')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (40, N'South Carolina', N'SC')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (41, N'South Dakota', N'SD')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (42, N'Tennessee', N'TN')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (43, N'Texas', N'TX')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (44, N'Utah', N'UT')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (45, N'Vermont', N'VT')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (46, N'Virginia', N'VA')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (47, N'Washington', N'WA')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (48, N'West Virginia', N'WV')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (49, N'Wisconsin', N'WI')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (50, N'Wyoming', N'WY')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (51, N'American Samoa', N'AS')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (52, N'Disctrict of Columbia', N'DC')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (53, N'Federated States of Micronesia', N'FM')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (54, N'Guam', N'GU')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (55, N'Marshall Islands', N'MH')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (56, N'Northern Mariana Islands', N'MP')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (57, N'Palau', N'PW')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (58, N'Puerto Rico', N'PR')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (59, N'Virgin Islands', N'VI')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (60, N'Armed Forces Africa', N'AE')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (61, N'Armed Forces Americas', N'AA')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (62, N'Armed Forces Canada', N'AE')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (63, N'Armed Forces Europe', N'AE')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (64, N'Armed Forces Middle East', N'AE')
INSERT [dbo].[State] ([Id], [FullStateName], [AbbreviatedStateName]) VALUES (65, N'Armed Forces Pacific', N'AP')
SET IDENTITY_INSERT [dbo].[State] OFF
/****** Object:  Index [IX_Brand]    Script Date: 3/8/2014 3:24:57 PM ******/
ALTER TABLE [dbo].[Brand] ADD  CONSTRAINT [IX_Brand] UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Category]    Script Date: 3/8/2014 3:24:57 PM ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [IX_Category] UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Employee]    Script Date: 3/8/2014 3:24:57 PM ******/
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [IX_Employee] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_MinimumAge]  DEFAULT ((0)) FOR [MinimumAge]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_State]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_ZipCode] FOREIGN KEY([ZipId])
REFERENCES [dbo].[ZipCode] ([Id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_ZipCode]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Address]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Phone] FOREIGN KEY([PhoneId])
REFERENCES [dbo].[Phone] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Phone]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Position] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Position] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Position]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_CategoryList_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_CategoryList_Category]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_CategoryList_Product] FOREIGN KEY([ProductUPC])
REFERENCES [dbo].[Product] ([UPC])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_CategoryList_Product]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Employee]
GO
ALTER TABLE [dbo].[SaleItem]  WITH CHECK ADD  CONSTRAINT [FK_SaleItem_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([UPC])
GO
ALTER TABLE [dbo].[SaleItem] CHECK CONSTRAINT [FK_SaleItem_Product]
GO
ALTER TABLE [dbo].[SaleItem]  WITH CHECK ADD  CONSTRAINT [FK_SaleItem_Sale] FOREIGN KEY([SaleId])
REFERENCES [dbo].[Sale] ([Id])
GO
ALTER TABLE [dbo].[SaleItem] CHECK CONSTRAINT [FK_SaleItem_Sale]
GO
USE [master]
GO
ALTER DATABASE [POS_Initial] SET  READ_WRITE 
GO
