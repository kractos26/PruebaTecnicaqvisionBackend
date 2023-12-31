USE [Travel]
GO
ALTER TABLE [dbo].[Libro] DROP CONSTRAINT [FK_Libro_Editorial]
GO
ALTER TABLE [dbo].[AutorLibro] DROP CONSTRAINT [FK_AutorLibro_Libro]
GO
ALTER TABLE [dbo].[AutorLibro] DROP CONSTRAINT [FK_AutorLibro_Autor]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 23/06/2023 2:20:14 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Libro]') AND type in (N'U'))
DROP TABLE [dbo].[Libro]
GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 23/06/2023 2:20:14 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Editorial]') AND type in (N'U'))
DROP TABLE [dbo].[Editorial]
GO
/****** Object:  Table [dbo].[AutorLibro]    Script Date: 23/06/2023 2:20:14 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AutorLibro]') AND type in (N'U'))
DROP TABLE [dbo].[AutorLibro]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 23/06/2023 2:20:14 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Autor]') AND type in (N'U'))
DROP TABLE [dbo].[Autor]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 23/06/2023 2:20:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[AutorId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](45) NULL,
	[Apellido] [nvarchar](45) NULL,
 CONSTRAINT [PK_Autor] PRIMARY KEY CLUSTERED 
(
	[AutorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AutorLibro]    Script Date: 23/06/2023 2:20:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutorLibro](
	[AutorId] [int] NULL,
	[Libro_ISBN] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 23/06/2023 2:20:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editorial](
	[EditorialId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](45) NULL,
	[Sede] [nvarchar](45) NULL,
 CONSTRAINT [PK_Editorial] PRIMARY KEY CLUSTERED 
(
	[EditorialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 23/06/2023 2:20:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[Libro_ISBN] [int] IDENTITY(1,1) NOT NULL,
	[EditorialId] [int] NULL,
	[Titulo] [nvarchar](45) NULL,
	[Sinopsis] [text] NULL,
	[Npaginas] [varchar](45) NULL,
 CONSTRAINT [PK_Libro] PRIMARY KEY CLUSTERED 
(
	[Libro_ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Autor] ON 

INSERT [dbo].[Autor] ([AutorId], [Nombre], [Apellido]) VALUES (1, N'Autor', N'Escribiendo')
SET IDENTITY_INSERT [dbo].[Autor] OFF
GO
INSERT [dbo].[AutorLibro] ([AutorId], [Libro_ISBN]) VALUES (1, 1)
GO
SET IDENTITY_INSERT [dbo].[Editorial] ON 

INSERT [dbo].[Editorial] ([EditorialId], [Nombre], [Sede]) VALUES (1, N'Editorial', N'Centro')
SET IDENTITY_INSERT [dbo].[Editorial] OFF
GO
SET IDENTITY_INSERT [dbo].[Libro] ON 

INSERT [dbo].[Libro] ([Libro_ISBN], [EditorialId], [Titulo], [Sinopsis], [Npaginas]) VALUES (1, 1, N'Libro1', N'Leyendo', N'30')
SET IDENTITY_INSERT [dbo].[Libro] OFF
GO
ALTER TABLE [dbo].[AutorLibro]  WITH CHECK ADD  CONSTRAINT [FK_AutorLibro_Autor] FOREIGN KEY([AutorId])
REFERENCES [dbo].[Autor] ([AutorId])
GO
ALTER TABLE [dbo].[AutorLibro] CHECK CONSTRAINT [FK_AutorLibro_Autor]
GO
ALTER TABLE [dbo].[AutorLibro]  WITH CHECK ADD  CONSTRAINT [FK_AutorLibro_Libro] FOREIGN KEY([Libro_ISBN])
REFERENCES [dbo].[Libro] ([Libro_ISBN])
GO
ALTER TABLE [dbo].[AutorLibro] CHECK CONSTRAINT [FK_AutorLibro_Libro]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Editorial] FOREIGN KEY([EditorialId])
REFERENCES [dbo].[Editorial] ([EditorialId])
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro_Editorial]
GO
