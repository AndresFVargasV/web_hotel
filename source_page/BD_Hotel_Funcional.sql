/****** Object:  Database [hotel]    Script Date: 21/05/2023 0:17:48 ******/
CREATE DATABASE [hotel]  (EDITION = 'GeneralPurpose', SERVICE_OBJECTIVE = 'GP_S_Gen5_2', MAXSIZE = 32 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [hotel] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [hotel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hotel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hotel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hotel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hotel] SET ARITHABORT OFF 
GO
ALTER DATABASE [hotel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hotel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hotel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hotel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hotel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hotel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hotel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hotel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hotel] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [hotel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hotel] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [hotel] SET  MULTI_USER 
GO
ALTER DATABASE [hotel] SET ENCRYPTION ON
GO
ALTER DATABASE [hotel] SET QUERY_STORE = ON
GO
ALTER DATABASE [hotel] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[CuposDisponibles]    Script Date: 21/05/2023 0:17:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuposDisponibles](
	[ID] [int] NOT NULL,
	[Fecha] [date] NULL,
	[guia] [int] NULL,
	[Desayuno] [int] NULL,
	[Almuerzo] [int] NULL,
	[Cena] [int] NULL,
	[Transporte] [int] NULL,
	[Lavanderia] [int] NULL,
	[Parqueadero] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fechas_inactivas]    Script Date: 21/05/2023 0:17:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fechas_inactivas](
	[id] [int] NOT NULL,
	[tipo] [varchar](50) NULL,
	[fecha_inicio] [date] NULL,
	[fecha_fin] [date] NULL,
	[descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[habitaciones]    Script Date: 21/05/2023 0:17:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[habitaciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero_habitacion] [int] NULL,
	[tipo] [varchar](50) NULL,
	[acomodacion] [varchar](50) NULL,
	[camas_disponibles] [int] NULL,
	[price] [decimal](10, 2) NULL,
	[descripcion] [varchar](255) NULL,
 CONSTRAINT [PK__habitaci__3213E83FA0CABCC0] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reserva_compartida]    Script Date: 21/05/2023 0:17:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reserva_compartida](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero_habitacion] [int] NULL,
	[codigo_reserva] [varchar](50) NULL,
	[id_cliente] [int] NULL,
	[fecha_inicio] [datetime] NULL,
	[fecha_fin] [datetime] NULL,
	[desayuno] [bit] NULL,
	[almuerzo] [bit] NULL,
	[cena] [bit] NULL,
	[transporte] [bit] NULL,
	[parqueadero] [bit] NULL,
	[lavanderia] [bit] NULL,
	[guia] [bit] NULL,
	[descipcion] [varchar](50) NULL,
 CONSTRAINT [PK_reserva_compartida] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservas]    Script Date: 21/05/2023 0:17:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservas](
	[id_reserva] [int] IDENTITY(1,1) NOT NULL,
	[codigo_reserva] [varchar](100) NULL,
	[id_cliente] [int] NULL,
	[id_habitacion] [int] NULL,
	[fecha_inicio] [datetime] NULL,
	[fecha_fin] [datetime] NULL,
	[num_personas] [int] NULL,
	[desayuno] [bit] NULL,
	[almuerzo] [bit] NULL,
	[cena] [bit] NULL,
	[transporte] [bit] NULL,
	[parqueadero] [bit] NULL,
	[lavanderia] [bit] NULL,
	[guia] [bit] NULL,
	[descripcion] [text] NULL,
 CONSTRAINT [PK__reservas__423CBE5D8F69824F] PRIMARY KEY CLUSTERED 
(
	[id_reserva] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[reserva_compartida]  WITH CHECK ADD  CONSTRAINT [FK_reserva_compartida_habitaciones] FOREIGN KEY([numero_habitacion])
REFERENCES [dbo].[habitaciones] ([id])
GO
ALTER TABLE [dbo].[reserva_compartida] CHECK CONSTRAINT [FK_reserva_compartida_habitaciones]
GO
ALTER TABLE [dbo].[reservas]  WITH CHECK ADD  CONSTRAINT [FK_id_habitaciones] FOREIGN KEY([id_habitacion])
REFERENCES [dbo].[habitaciones] ([id])
GO
ALTER TABLE [dbo].[reservas] CHECK CONSTRAINT [FK_id_habitaciones]
GO
ALTER DATABASE [hotel] SET  READ_WRITE 
GO
