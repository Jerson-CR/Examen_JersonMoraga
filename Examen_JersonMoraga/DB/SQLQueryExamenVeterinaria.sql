USE [Veterinaria]
GO
/****** Object:  Table [dbo].[Control_Citas]    Script Date: 28/04/2023 08:28:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Control_Citas](
	[ID_Mascota] [int] NULL,
	[Proxima_fecha] [varchar](50) NULL,
	[Medico_Asignado] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mae_Mascotas]    Script Date: 28/04/2023 08:28:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mae_Mascotas](
	[ID_Mascota] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Mascota] [varchar](50) NULL,
	[Tipo_Mascota] [varchar](50) NULL,
	[Comida_Favorita] [varchar](50) NULL,
 CONSTRAINT [PK_ID_Mascota] PRIMARY KEY CLUSTERED 
(
	[ID_Mascota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Nombre_Mascota] UNIQUE NONCLUSTERED 
(
	[Nombre_Mascota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mae_Usuarios]    Script Date: 28/04/2023 08:28:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mae_Usuarios](
	[Login_Usuario] [varchar](50) NOT NULL,
	[Clave_Usuario] [varchar](30) NOT NULL,
	[Nombre_Usuario] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Login_Usuario] PRIMARY KEY CLUSTERED 
(
	[Login_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Control_Citas]  WITH CHECK ADD  CONSTRAINT [FK_ID_Mascota] FOREIGN KEY([ID_Mascota])
REFERENCES [dbo].[Mae_Mascotas] ([ID_Mascota])
GO
ALTER TABLE [dbo].[Control_Citas] CHECK CONSTRAINT [FK_ID_Mascota]
GO
/****** Object:  StoredProcedure [dbo].[sp_BorrarMae_Usuarios]    Script Date: 28/04/2023 08:28:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_BorrarMae_Usuarios]

@Login_Usuario varchar(50)
as
begin 
Delete Mae_Usuarios where Login_Usuario = @Login_Usuario
end
GO
/****** Object:  StoredProcedure [dbo].[SP_IngresarMae_Usuarios]    Script Date: 28/04/2023 08:28:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_IngresarMae_Usuarios]

@Login_Usuario varchar (50),
@Clave_Usuario varchar (30),
@Nombre_Usuario varchar(50)
as 
begin
insert into Mae_Usuarios(Login_Usuario,Clave_Usuario,Nombre_Usuario) values (@Login_Usuario,@Clave_Usuario,@Nombre_Usuario)
end 
GO
/****** Object:  StoredProcedure [dbo].[SP_ListadoMae_Usuarios]    Script Date: 28/04/2023 08:28:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_ListadoMae_Usuarios]

as 
begin 
select * from Mae_Usuarios
end 
GO
/****** Object:  StoredProcedure [dbo].[ValidarLogin]    Script Date: 28/04/2023 08:28:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ValidarLogin]

@Login_Usuari varchar (50) = '',
@Clave_Usuario varchar (30) = ''

as 
begin
select Login_Usuario, Clave_Usuario from Mae_Usuarios where Login_Usuario=@Login_Usuari and Clave_Usuario = @Clave_Usuario
end 
GO
