/*
   quarta-feira, 20 de junho de 201815:46:18
   User: 
   Server: DESKTOP-JLGBVQK\SQLEXPRESS2014
   Database: Mootit_Rede
   Application: 
*/

USE MOOTIT_REDE
GO

SET NOCOUNT ON;

----	
----	FOREIGN KEY
----

IF	EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsuarioTipo_CadastroUsuarioId_Usuario_UsuarioId]') AND type in (N'F')) BEGIN
	ALTER TABLE [dbo].[UsuarioTipo]
	DROP CONSTRAINT [FK_UsuarioTipo_CadastroUsuarioId_Usuario_UsuarioId]
END
GO

IF	EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuario_UsuarioTipoId_UsuarioTipo_Id]') AND type in (N'F')) BEGIN
	ALTER TABLE [dbo].[Usuario]
	DROP CONSTRAINT [FK_Usuario_UsuarioTipoId_UsuarioTipo_Id]
END
GO

IF	EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuario_UsuarioTipoId_UsuarioTipo_UsuarioTipoId]') AND type in (N'F')) BEGIN
	ALTER TABLE [dbo].[Usuario]
	DROP CONSTRAINT [FK_Usuario_UsuarioTipoId_UsuarioTipo_UsuarioTipoId]
END
GO

IF	EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsuarioTipo_CadastroUsuarioId_Usuario_Id]') AND type in (N'F')) BEGIN
	ALTER TABLE [dbo].[UsuarioTipo]
	DROP CONSTRAINT [FK_UsuarioTipo_CadastroUsuarioId_Usuario_Id]
END
GO

IF	EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsuarioTipo_AtualizacaoUsuarioId_Usuario_Id]') AND type in (N'F')) BEGIN
	ALTER TABLE [dbo].[UsuarioTipo]
	DROP CONSTRAINT [FK_UsuarioTipo_AtualizacaoUsuarioId_Usuario_Id]
END
GO

--
--	DROP PRIMARY KEY & DROP TABLE
--

IF	EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK_UsuarioTipo_UsuarioTipoId]') AND type in (N'PK')) BEGIN
	ALTER TABLE [dbo].[UsuarioTipo]
	DROP CONSTRAINT [PK_UsuarioTipo_UsuarioTipoId]
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsuarioTipo]') AND type in (N'U')) BEGIN
	DROP TABLE [dbo].[UsuarioTipo]
END
GO

--
--	CREATE TABLE
--

USE [Mootit_Rede]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[UsuarioTipo]
(
	[UsuarioTipoId] int identity(1,1) not null
,	[Nome] varchar(50) not null
,	[FlagStatus] bit not null
,	[CadastroDataHora] datetime not null
,	[CadastroUsuarioId] int not null
,	[AtualizacaoDataHora] datetime null
,	[AtualizacaoUsuarioId] int null
,	CONSTRAINT [PK_UsuarioTipo_Id] PRIMARY KEY CLUSTERED 
	(
		[UsuarioTipoId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

IF EXISTS(SELECT * FROM sys.tables WHERE name = 'Usuario') BEGIN
	ALTER TABLE [dbo].[UsuarioTipo] ADD
	CONSTRAINT [FK_UsuarioTipo_CadastroUsuarioId_Usuario_UsuarioId] FOREIGN KEY
	(	
		[CadastroUsuarioId]
	) REFERENCES [dbo].[Usuario] (
		[UsuarioId]
	) 
END
GO

IF EXISTS(SELECT * FROM sys.tables WHERE name = 'Usuario') BEGIN
	ALTER TABLE [dbo].[UsuarioTipo] ADD
	CONSTRAINT [FK_UsuarioTipo_AtualizacaoUsuarioId_Usuario_UsuarioId] FOREIGN KEY
	(	
		[AtualizacaoUsuarioId]
	) REFERENCES [dbo].[Usuario] (
		[UsuarioId]
	) 
end
GO