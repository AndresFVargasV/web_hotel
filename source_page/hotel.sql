/****** Object: Database [bd_hotel] ******/
CREATE DATABASE [bd_hotel]  (EDITION = 'GeneralPurpose', SERVICE_OBJECTIVE = 'GP_S_Gen5_2', MAXSIZE = 32 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO

ALTER DATABASE [bd_hotel] SET COMPATIBILITY_LEVEL = 150
GO

ALTER DATABASE [bd_hotel] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [bd_hotel] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [bd_hotel] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [bd_hotel] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [bd_hotel] SET ARITHABORT OFF 
GO

ALTER DATABASE [bd_hotel] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [bd_hotel] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [bd_hotel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [bd_hotel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [bd_hotel] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [bd_hotel] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [bd_hotel] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [bd_hotel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [bd_hotel] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO

ALTER DATABASE [bd_hotel] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [bd_hotel] SET READ_COMMITTED_SNAPSHOT ON 
GO

ALTER DATABASE [bd_hotel] SET MULTI_USER 
GO

ALTER DATABASE [bd_hotel] SET ENCRYPTION ON
GO

ALTER DATABASE [bd_hotel] SET QUERY_STORE = ON
GO

ALTER DATABASE [bd_hotel] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO

/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO

-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO

/****** Object: Table [dbo].[clientes] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
    [id_cliente] [int] NOT NULL,
    [tipo_doc] [varchar](50) NULL,
    [doc] [varchar](50) NULL,
    [nombre] [varchar](100) NULL,
    [apellido] [varchar](100) NULL,
    [telefono] [varchar](20) NULL,
    [mail] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
    [id_cliente] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object: Table [dbo].[CuposDisponibles] ******/
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

/****** Object: Table [dbo].[fechas_inactivas] ******/
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

/****** Object: Table [dbo].[habitaciones] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[habitaciones](
    [id] [int] NOT NULL,
    [numero_habitacion] [int] NULL,
    [tipo] [varchar](50) NULL,
    [acomodacion] [varchar](50) NULL,
    [camas_disponibles] [int] NULL,
    [price] [decimal](10, 2) NULL,
    [descripcion] [varchar](255) NULL,
    [estado] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
    [id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object: Table [dbo].[reservas] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservas](
    [id_reserva] [int] IDENTITY(1,1) NOT NULL,
    [codigo_reserva] [varchar](100) NULL,
    [id_cliente] [int] NULL,
    [fecha_inicio] [datetime] NULL,
    [fecha_fin] [datetime] NULL,
    [num_personas] [int] NULL,
    [desayuno] [bit] NULL,
    [almuerzo] [bit] NULL,
    [cena] [bit] NULL,
    [transporte] [bit] NULL,
    [parqueadero] [bit] NULL,
    [lavanderia] [bit] NULL,
    [descripcion] [text] NULL,
    [guia] [bit] NULL,
 CONSTRAINT [PK__reservas__423CBE5D8F69824F] PRIMARY KEY CLUSTERED 
(
    [id_reserva] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object: Table [dbo].[reservas_habitaciones] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservas_habitaciones](
    [id_reserva] [int] NOT NULL,
    [id_habitacion] [int] NOT NULL,
    CONSTRAINT [PK_reservas_habitaciones] PRIMARY KEY CLUSTERED 
    (
        [id_reserva] ASC,
        [id_habitacion] ASC
    ),
    CONSTRAINT [FK_reservas_habitaciones_reservas] FOREIGN KEY ([id_reserva]) REFERENCES [dbo].[reservas] ([id_reserva]),
    CONSTRAINT [FK_reservas_habitaciones_habitaciones] FOREIGN KEY ([id_habitacion]) REFERENCES [dbo].[habitaciones] ([id])
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[reservas_habitaciones] CHECK CONSTRAINT [FK_reservas_habitaciones_habitaciones]
GO

ALTER TABLE [dbo].[reservas_habitaciones] CHECK CONSTRAINT [FK_reservas_habitaciones_reservas]
GO
