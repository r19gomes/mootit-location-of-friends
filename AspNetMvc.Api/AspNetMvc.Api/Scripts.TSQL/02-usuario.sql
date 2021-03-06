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

IF	EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuario_UsuarioTipoId_UsuarioTipo_UsuarioTipoId]') AND type in (N'F')) BEGIN
	ALTER TABLE [dbo].[UsuarioTipo]
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

IF	EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsuarioTipo_Usuario_CadastroUsuarioId_Usuario_Id]') AND type in (N'F')) BEGIN
	ALTER TABLE [dbo].[Usuario]
	DROP CONSTRAINT [FK_UsuarioTipo_Usuario_CadastroUsuarioId_Usuario_Id]
END
GO

IF	EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsuarioTipo_Usuario_AtualizacaoUsuarioId_Usuario_Id]') AND type in (N'F')) BEGIN
	ALTER TABLE [dbo].[Usuario]
	DROP CONSTRAINT [FK_UsuarioTipo_Usuario_AtualizacaoUsuarioId_Usuario_Id]
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

IF	EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuario_CadastroUsuarioId_Usuario_Id]') AND type in (N'F')) BEGIN
	ALTER TABLE [dbo].[Usuario]
	DROP CONSTRAINT [FK_Usuario_CadastroUsuarioId_Usuario_Id]
END
GO

IF	EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuario_CadastroUsuarioId_Usuario_UsuarioId]') AND type in (N'F')) BEGIN
	ALTER TABLE [dbo].[Usuario]
	DROP CONSTRAINT [FK_Usuario_CadastroUsuarioId_Usuario_UsuarioId]
END
GO

IF	EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuario_AtualizacaoUsuarioId_Usuario_Id]') AND type in (N'F')) BEGIN
	ALTER TABLE [dbo].[Usuario]
	DROP CONSTRAINT [FK_Usuario_AtualizacaoUsuarioId_Usuario_Id]
END
GO

IF	EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuario_AtualizacaoUsuarioId_Usuario_UsuarioId]') AND type in (N'F')) BEGIN
	ALTER TABLE [dbo].[Usuario]
	DROP CONSTRAINT [FK_Usuario_AtualizacaoUsuarioId_Usuario_UsuarioId]
END
GO

--
--	DROP PRIMARY KEY & DROP TABLE
--

IF	EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FK_Endereco_CadastroUsuarioId_Usuario_UsuarioId]') AND type in (N'F')) BEGIN
	ALTER TABLE [dbo].[Endereco]
	DROP CONSTRAINT [FK_Endereco_CadastroUsuarioId_Usuario_UsuarioId]
END
GO

IF	EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FK_Endereco_AtualizacaoUsuarioId_Usuario_UsuarioId]') AND type in (N'F')) BEGIN
	ALTER TABLE [dbo].[Endereco]
	DROP CONSTRAINT [FK_Endereco_AtualizacaoUsuarioId_Usuario_UsuarioId]
END
GO

IF	EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FK_Endereco_CadastroUsuarioId_Usuario_Id]') AND type in (N'F')) BEGIN
	ALTER TABLE [dbo].[Endereco]
	DROP CONSTRAINT [FK_Endereco_CadastroUsuarioId_Usuario_Id]
END
GO

IF	EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FK_Endereco_AtualizacaoUsuarioId_Usuario_Id]') AND type in (N'F')) BEGIN
	ALTER TABLE [dbo].[Endereco]
	DROP CONSTRAINT [FK_Endereco_AtualizacaoUsuarioId_Usuario_Id]
END
GO

IF	EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK_Usuario_Id]') AND type in (N'PK')) BEGIN
	ALTER TABLE [dbo].[Usuario]
	DROP CONSTRAINT [PK_Usuario_Id]
END
GO

IF	EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK_Usuario_UsuarioId]') AND type in (N'PK')) BEGIN
	ALTER TABLE [dbo].[Usuario]
	DROP CONSTRAINT [PK_Usuario_UsuarioId]
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario]') AND type in (N'U')) BEGIN
	DROP TABLE [dbo].[Usuario]
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

CREATE TABLE [dbo].[Usuario] 
(
	[UsuarioId] int identity not null
,	[Nome] varchar(200) not null
,	[Apelido] varchar(50) null
,	[Email] varchar(200) null
,	[Login] varchar(30) null
,	[Senha] varchar(20) null
,	[UsuarioTipoId] int null
,	[CadastroDataHora] datetime not null
,	[CadastroUsuarioId] int not null
,	[AtualizacaoDataHora] datetime null
,	[AtualizacaoUsuarioId] int null
,	CONSTRAINT [PK_Usuario_Id] PRIMARY KEY CLUSTERED 
	(
		[UsuarioId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Usuario] ADD
CONSTRAINT [FK_Usuario_CadastroUsuarioId_Usuario_UsuarioId] FOREIGN KEY
(	
	[CadastroUsuarioId]
) REFERENCES [dbo].[Usuario] (
	[UsuarioId]
) 
GO

ALTER TABLE [dbo].[Usuario] ADD
CONSTRAINT [FK_Usuario_AtualizacaoUsuarioId_Usuario_UsuarioId] FOREIGN KEY
(	
	[AtualizacaoUsuarioId]
) REFERENCES [dbo].[Usuario] (
	[UsuarioId]
) 
GO

ALTER TABLE [dbo].[Usuario] ADD
CONSTRAINT [FK_Usuario_UsuarioTipoId_UsuarioTipo_UsuarioTipoId] FOREIGN KEY
(	
	[UsuarioTipoId]
) REFERENCES [dbo].[UsuarioTipo] (
	[UsuarioTipoId]
) 
GO

IF EXISTS(SELECT * FROM sys.tables WHERE name = 'Usuario') 
BEGIN
	DECLARE
		@USUARIO_ID INT 
	,	@USUARIO_NOME VARCHAR(200)

	SET @USUARIO_ID = 0;
	SET @USUARIO_NOME = 'Admin'
	IF NOT EXISTS(SELECT * FROM Usuario where UsuarioId > 0 AND Nome = @USUARIO_NOME) 
	BEGIN
		INSERT [dbo].Usuario 
		(
			Nome
		,	Apelido
		,	Email
		,	Login
		,	Senha
		,	CadastroDataHora
		,	CadastroUsuarioId
		,	AtualizacaoDataHora
		,	AtualizacaoUsuarioId
		)
		SELECT 
			Nome = @USUARIO_NOME
		,	Apelido = 'Verde'
		,	Email = 'verde@teste.com.br'
		,	Login = 'SANDRA'
		,	Senha = '123'
		,	CadastroDataHora = getdate()
		,	CadastroUsuarioId = 1
		,	AtualizacaoDataHora = null
		,	AtualizacaoUsuarioId = null
		;
		SET @USUARIO_ID = SCOPE_IDENTITY();
	END


	SET @USUARIO_ID = 0;
	SET @USUARIO_NOME = 'Sandra Costa Verde'
	IF NOT EXISTS(SELECT * FROM Usuario where UsuarioId > 0 AND Nome = @USUARIO_NOME) 
	BEGIN
		INSERT [dbo].Usuario 
		(
			Nome
		,	Apelido
		,	Email
		,	Login
		,	Senha
		,	CadastroDataHora
		,	CadastroUsuarioId
		,	AtualizacaoDataHora
		,	AtualizacaoUsuarioId
		)
		SELECT 
			Nome = @USUARIO_NOME
		,	Apelido = 'Verde'
		,	Email = 'verde@teste.com.br'
		,	Login = 'SANDRA'
		,	Senha = '123'
		,	CadastroDataHora = getdate()
		,	CadastroUsuarioId = 1
		,	AtualizacaoDataHora = null
		,	AtualizacaoUsuarioId = null
		;
		SET @USUARIO_NOME = SCOPE_IDENTITY();
	END

END
GO