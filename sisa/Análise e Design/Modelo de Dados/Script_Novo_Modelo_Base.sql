USE [tcc]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CIDADE_ENDERECO]') AND parent_object_id = OBJECT_ID(N'[dbo].[ENDERECO]'))
ALTER TABLE [dbo].[ENDERECO] DROP CONSTRAINT [FK_CIDADE_ENDERECO]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TIPOLOGRADOURO_ENDERECO]') AND parent_object_id = OBJECT_ID(N'[dbo].[ENDERECO]'))
ALTER TABLE [dbo].[ENDERECO] DROP CONSTRAINT [FK_TIPOLOGRADOURO_ENDERECO]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LOTEAMENTO_LOTE]') AND parent_object_id = OBJECT_ID(N'[dbo].[LOTE]'))
ALTER TABLE [dbo].[LOTE] DROP CONSTRAINT [FK_LOTEAMENTO_LOTE]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LOTE_LOTESPROPOSTA]') AND parent_object_id = OBJECT_ID(N'[dbo].[LOTES_PROPOSTA]'))
ALTER TABLE [dbo].[LOTES_PROPOSTA] DROP CONSTRAINT [FK_LOTE_LOTESPROPOSTA]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PROPOSTA_LOTESPROPOSTA]') AND parent_object_id = OBJECT_ID(N'[dbo].[LOTES_PROPOSTA]'))
ALTER TABLE [dbo].[LOTES_PROPOSTA] DROP CONSTRAINT [FK_PROPOSTA_LOTESPROPOSTA]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PROPOSTA_PARCELASPROPOSTA]') AND parent_object_id = OBJECT_ID(N'[dbo].[PARCELAS_SINAL_PROPOSTA]'))
ALTER TABLE [dbo].[PARCELAS_SINAL_PROPOSTA] DROP CONSTRAINT [FK_PROPOSTA_PARCELASPROPOSTA]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ENDERECO_PROMITENTE_COBR]') AND parent_object_id = OBJECT_ID(N'[dbo].[PROMITENTE]'))
ALTER TABLE [dbo].[PROMITENTE] DROP CONSTRAINT [FK_ENDERECO_PROMITENTE_COBR]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PROMITENTE_PROPOSTA]') AND parent_object_id = OBJECT_ID(N'[dbo].[PROPOSTA]'))
ALTER TABLE [dbo].[PROPOSTA] DROP CONSTRAINT [FK_PROMITENTE_PROPOSTA]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PROPOSTA_FINANCIAMENTO]') AND parent_object_id = OBJECT_ID(N'[dbo].[PROPOSTA]'))
ALTER TABLE [dbo].[PROPOSTA] DROP CONSTRAINT [FK_PROPOSTA_FINANCIAMENTO]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PROPOSTA_LOTEAMENTO]') AND parent_object_id = OBJECT_ID(N'[dbo].[PROPOSTA]'))
ALTER TABLE [dbo].[PROPOSTA] DROP CONSTRAINT [FK_PROPOSTA_LOTEAMENTO]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VENDEDOR_PROPOSTA]') AND parent_object_id = OBJECT_ID(N'[dbo].[PROPOSTA]'))
ALTER TABLE [dbo].[PROPOSTA] DROP CONSTRAINT [FK_VENDEDOR_PROPOSTA]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Transacao_Transacao]') AND parent_object_id = OBJECT_ID(N'[dbo].[TRANSACAO]'))
ALTER TABLE [dbo].[TRANSACAO] DROP CONSTRAINT [FK_Transacao_Transacao]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Perfil_TransacaoPerfil]') AND parent_object_id = OBJECT_ID(N'[dbo].[TRANSACAO_PERFIL]'))
ALTER TABLE [dbo].[TRANSACAO_PERFIL] DROP CONSTRAINT [FK_Perfil_TransacaoPerfil]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Transacao_TransacaoPerfil]') AND parent_object_id = OBJECT_ID(N'[dbo].[TRANSACAO_PERFIL]'))
ALTER TABLE [dbo].[TRANSACAO_PERFIL] DROP CONSTRAINT [FK_Transacao_TransacaoPerfil]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Perfil_UsuarioPerfil]') AND parent_object_id = OBJECT_ID(N'[dbo].[USUARIO_PERFIL]'))
ALTER TABLE [dbo].[USUARIO_PERFIL] DROP CONSTRAINT [FK_Perfil_UsuarioPerfil]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuario_UsuarioPerfil]') AND parent_object_id = OBJECT_ID(N'[dbo].[USUARIO_PERFIL]'))
ALTER TABLE [dbo].[USUARIO_PERFIL] DROP CONSTRAINT [FK_Usuario_UsuarioPerfil]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VENDEDOR_ENDERECO]') AND parent_object_id = OBJECT_ID(N'[dbo].[VENDEDOR]'))
ALTER TABLE [dbo].[VENDEDOR] DROP CONSTRAINT [FK_VENDEDOR_ENDERECO]
GO

USE [tcc]
GO

/****** Object:  Table [dbo].[CIDADE]    Script Date: 02/02/2011 21:53:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CIDADE]') AND type in (N'U'))
DROP TABLE [dbo].[CIDADE]
GO

/****** Object:  Table [dbo].[ENDERECO]    Script Date: 02/02/2011 21:53:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ENDERECO]') AND type in (N'U'))
DROP TABLE [dbo].[ENDERECO]
GO

/****** Object:  Table [dbo].[FINANCIAMENTO]    Script Date: 02/02/2011 21:53:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FINANCIAMENTO]') AND type in (N'U'))
DROP TABLE [dbo].[FINANCIAMENTO]
GO

/****** Object:  Table [dbo].[LOTE]    Script Date: 02/02/2011 21:53:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LOTE]') AND type in (N'U'))
DROP TABLE [dbo].[LOTE]
GO

/****** Object:  Table [dbo].[LOTEAMENTO]    Script Date: 02/02/2011 21:53:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LOTEAMENTO]') AND type in (N'U'))
DROP TABLE [dbo].[LOTEAMENTO]
GO

/****** Object:  Table [dbo].[LOTES_PROPOSTA]    Script Date: 02/02/2011 21:53:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LOTES_PROPOSTA]') AND type in (N'U'))
DROP TABLE [dbo].[LOTES_PROPOSTA]
GO

/****** Object:  Table [dbo].[PARCELAS_SINAL_PROPOSTA]    Script Date: 02/02/2011 21:53:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PARCELAS_SINAL_PROPOSTA]') AND type in (N'U'))
DROP TABLE [dbo].[PARCELAS_SINAL_PROPOSTA]
GO

/****** Object:  Table [dbo].[PERFIL]    Script Date: 02/02/2011 21:53:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PERFIL]') AND type in (N'U'))
DROP TABLE [dbo].[PERFIL]
GO

/****** Object:  Table [dbo].[PROMITENTE]    Script Date: 02/02/2011 21:53:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PROMITENTE]') AND type in (N'U'))
DROP TABLE [dbo].[PROMITENTE]
GO

/****** Object:  Table [dbo].[PROPOSTA]    Script Date: 02/02/2011 21:53:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PROPOSTA]') AND type in (N'U'))
DROP TABLE [dbo].[PROPOSTA]
GO

/****** Object:  Table [dbo].[TIPO_LOGRADOURO]    Script Date: 02/02/2011 21:53:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TIPO_LOGRADOURO]') AND type in (N'U'))
DROP TABLE [dbo].[TIPO_LOGRADOURO]
GO

/****** Object:  Table [dbo].[TRANSACAO]    Script Date: 02/02/2011 21:53:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TRANSACAO]') AND type in (N'U'))
DROP TABLE [dbo].[TRANSACAO]
GO

/****** Object:  Table [dbo].[TRANSACAO_PERFIL]    Script Date: 02/02/2011 21:53:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TRANSACAO_PERFIL]') AND type in (N'U'))
DROP TABLE [dbo].[TRANSACAO_PERFIL]
GO

/****** Object:  Table [dbo].[USUARIO]    Script Date: 02/02/2011 21:53:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USUARIO]') AND type in (N'U'))
DROP TABLE [dbo].[USUARIO]
GO

/****** Object:  Table [dbo].[USUARIO_PERFIL]    Script Date: 02/02/2011 21:53:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USUARIO_PERFIL]') AND type in (N'U'))
DROP TABLE [dbo].[USUARIO_PERFIL]
GO

/****** Object:  Table [dbo].[VENDEDOR]    Script Date: 02/02/2011 21:53:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VENDEDOR]') AND type in (N'U'))
DROP TABLE [dbo].[VENDEDOR]
GO

USE [tcc]
GO

/****** Object:  Table [dbo].[CIDADE]    Script Date: 02/02/2011 21:53:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CIDADE](
	[Cd_Cidade] [int] NOT NULL,
	[No_Cidade] [varchar](20) NOT NULL,
	[Cd_Uf] [varchar](2) NOT NULL,
	[Cd_Embratel] [varchar](4) NOT NULL,
	[Ch_Cid_Uf] [varchar](22) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cd_Cidade] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [tcc]
GO

/****** Object:  Table [dbo].[ENDERECO]    Script Date: 02/02/2011 21:53:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ENDERECO](
	[Nu_Cep] [varchar](8) NOT NULL,
	[Cd_Tipo] [varchar](2) NOT NULL,
	[Ds_Logradouro] [varchar](40) NOT NULL,
	[Ds_Bairro] [varchar](20) NOT NULL,
	[Cd_Cidade] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Nu_Cep] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [tcc]
GO

/****** Object:  Table [dbo].[FINANCIAMENTO]    Script Date: 02/02/2011 21:53:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FINANCIAMENTO](
	[Qtd_Parcelas] [int] NOT NULL,
	[Perc_Financiamento] [numeric](15, 5) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Qtd_Parcelas] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [tcc]
GO

/****** Object:  Table [dbo].[LOTE]    Script Date: 02/02/2011 21:53:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[LOTE](
	[Nu_Lotm] [varchar](3) NOT NULL,
	[Nu_Quadra] [varchar](3) NOT NULL,
	[Nu_Lote] [varchar](3) NOT NULL,
	[Ds_Conf_Frente] [varchar](20) NOT NULL,
	[Ds_Conf_Fundo] [varchar](20) NOT NULL,
	[Ds_Conf_Direita] [varchar](20) NOT NULL,
	[Ds_Conf_Esquerda] [varchar](20) NOT NULL,
	[Nu_Area] [numeric](15, 2) NOT NULL,
	[Nu_Dist_Esquina] [numeric](15, 2) NOT NULL,
	[Cd_preco] [varchar](2) NOT NULL,
	[situacao] [varchar](1) NOT NULL,
	[Ds_Dim_Frente] [varchar](20) NOT NULL,
	[Ds_Dim_Fundo] [varchar](20) NOT NULL,
	[Ds_Dim_Direita] [varchar](20) NOT NULL,
	[Ds_Dim_Esquerda] [varchar](20) NOT NULL,
	[valorM2] [numeric](15, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Nu_Lotm] ASC,
	[Nu_Quadra] ASC,
	[Nu_Lote] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [tcc]
GO

/****** Object:  Table [dbo].[LOTEAMENTO]    Script Date: 02/02/2011 21:53:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[LOTEAMENTO](
	[Nu_Lotm] [varchar](3) NOT NULL,
	[Ds_Lotm] [varchar](100) NOT NULL,
 CONSTRAINT [PK_LOTEAMENTO] PRIMARY KEY NONCLUSTERED 
(
	[Nu_Lotm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [tcc]
GO

/****** Object:  Table [dbo].[LOTES_PROPOSTA]    Script Date: 02/02/2011 21:53:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[LOTES_PROPOSTA](
	[Nu_Proposta] [varchar](5) NOT NULL,
	[Nu_Lote] [varchar](3) NOT NULL,
	[Nu_Quadra] [varchar](3) NOT NULL,
	[Nu_Lotm] [varchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Nu_Proposta] ASC,
	[Nu_Lote] ASC,
	[Nu_Quadra] ASC,
	[Nu_Lotm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [tcc]
GO

/****** Object:  Table [dbo].[PARCELAS_SINAL_PROPOSTA]    Script Date: 02/02/2011 21:53:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PARCELAS_SINAL_PROPOSTA](
	[Nu_Proposta] [varchar](5) NOT NULL,
	[Nu_Parcela] [int] NOT NULL,
	[tipo_pagto] [varchar](15) NULL,
	[num_doc] [varchar](10) NOT NULL,
	[valor] [numeric](10, 2) NULL,
	[data_vencimento] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Nu_Proposta] ASC,
	[Nu_Parcela] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [tcc]
GO

/****** Object:  Table [dbo].[PERFIL]    Script Date: 02/02/2011 21:53:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PERFIL](
	[Id] [int] NOT NULL,
	[Descricao] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Perfil_Acesso] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [tcc]
GO

/****** Object:  Table [dbo].[PROMITENTE]    Script Date: 02/02/2011 21:53:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PROMITENTE](
	[Cd_Pro] [varchar](5) NOT NULL,
	[Nome_Promitente] [varchar](40) NOT NULL,
	[dominio_Estado_Civil] [varchar](1) NOT NULL,
	[dominio_Sexo] [varchar](1) NOT NULL,
	[Nu_Rg] [varchar](10) NOT NULL,
	[Ds_Org_Emiss] [varchar](6) NOT NULL,
	[Dt_Exp_Rg] [datetime] NOT NULL,
	[Nu_CGC_CPF] [varchar](15) NOT NULL,
	[Dt_Nasc] [datetime] NOT NULL,
	[Fl_Dep] [varchar](1) NOT NULL,
	[Nu_Fone_Res] [varchar](11) NOT NULL,
	[Nu_Cep_Cobr] [varchar](8) NOT NULL,
	[Nu_Fone_Cobr] [varchar](11) NOT NULL,
	[Ds_Profissao] [varchar](20) NOT NULL,
	[situacao] [varchar](1) NOT NULL,
	[nacionalidade] [varchar](50) NULL,
	[nu_end_residencial] [varchar](8) NULL,
	[nome_responsavel] [varchar](40) NULL,
	[Nu_CGC_CPF_Responsavel] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cd_Pro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [tcc]
GO

/****** Object:  Table [dbo].[PROPOSTA]    Script Date: 02/02/2011 21:53:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PROPOSTA](
	[Nu_Proposta] [varchar](5) NOT NULL,
	[Cd_Promitente] [varchar](5) NULL,
	[No_Conjuge] [varchar](40) NOT NULL,
	[Vl_Vista] [numeric](15, 2) NOT NULL,
	[Vl_Sinal] [numeric](15, 2) NOT NULL,
	[Qt_Prest] [int] NOT NULL,
	[Vl_Prest] [numeric](15, 2) NOT NULL,
	[Ds_Obs] [varchar](60) NOT NULL,
	[situacao] [varchar](1) NOT NULL,
	[Cd_Vend] [varchar](3) NOT NULL,
	[Dt_Emissao] [datetime] NOT NULL,
	[Dt_Pri_Prest] [datetime] NOT NULL,
	[Fl_Dep] [varchar](1) NOT NULL,
	[Nu_CGC_CPF_Menor] [varchar](15) NOT NULL,
	[Fl_Pagto_aVista] [varchar](1) NOT NULL,
	[Nu_Lotm] [varchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Nu_Proposta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [tcc]
GO

/****** Object:  Table [dbo].[TIPO_LOGRADOURO]    Script Date: 02/02/2011 21:53:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TIPO_LOGRADOURO](
	[Cd_Tipo] [varchar](2) NOT NULL,
	[Ds_Tipo] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cd_Tipo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [tcc]
GO

/****** Object:  Table [dbo].[TRANSACAO]    Script Date: 02/02/2011 21:53:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TRANSACAO](
	[Id] [int] NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Url] [varchar](200) NULL,
	[Ordem] [tinyint] NOT NULL,
	[Ativa] [bit] NOT NULL,
	[Id_Pai] [int] NULL,
 CONSTRAINT [PK_Transacao] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Transacao] UNIQUE NONCLUSTERED 
(
	[Nome] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [tcc]
GO

/****** Object:  Table [dbo].[TRANSACAO_PERFIL]    Script Date: 02/02/2011 21:53:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TRANSACAO_PERFIL](
	[Id_Perfil] [int] NOT NULL,
	[Id_Transacao] [int] NOT NULL,
 CONSTRAINT [PK_Transacao_Perfil] PRIMARY KEY CLUSTERED 
(
	[Id_Transacao] ASC,
	[Id_Perfil] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [tcc]
GO

/****** Object:  Table [dbo].[USUARIO]    Script Date: 02/02/2011 21:53:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[USUARIO](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](30) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Senha] [varchar](20) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_Usuario] UNIQUE NONCLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [tcc]
GO

/****** Object:  Table [dbo].[USUARIO_PERFIL]    Script Date: 02/02/2011 21:53:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[USUARIO_PERFIL](
	[Id_Usuario] [int] NOT NULL,
	[Id_Perfil] [int] NOT NULL,
 CONSTRAINT [PK_Usuario_Perfil] PRIMARY KEY CLUSTERED 
(
	[Id_Usuario] ASC,
	[Id_Perfil] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [tcc]
GO

/****** Object:  Table [dbo].[VENDEDOR]    Script Date: 02/02/2011 21:53:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[VENDEDOR](
	[Cd_vend] [varchar](3) NOT NULL,
	[Ds_Razao_Nome] [varchar](40) NOT NULL,
	[Nu_Fone] [varchar](11) NOT NULL,
	[Nu_CGC_CPF] [varchar](15) NOT NULL,
	[No_Fantasia] [varchar](40) NOT NULL,
	[situacao] [varchar](1) NOT NULL,
	[Nu_cep] [varchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cd_vend] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[ENDERECO]  WITH CHECK ADD  CONSTRAINT [FK_CIDADE_ENDERECO] FOREIGN KEY([Cd_Cidade])
REFERENCES [dbo].[CIDADE] ([Cd_Cidade])
GO

ALTER TABLE [dbo].[ENDERECO] CHECK CONSTRAINT [FK_CIDADE_ENDERECO]
GO

ALTER TABLE [dbo].[ENDERECO]  WITH CHECK ADD  CONSTRAINT [FK_TIPOLOGRADOURO_ENDERECO] FOREIGN KEY([Cd_Tipo])
REFERENCES [dbo].[TIPO_LOGRADOURO] ([Cd_Tipo])
GO

ALTER TABLE [dbo].[ENDERECO] CHECK CONSTRAINT [FK_TIPOLOGRADOURO_ENDERECO]
GO

ALTER TABLE [dbo].[LOTE]  WITH CHECK ADD  CONSTRAINT [FK_LOTEAMENTO_LOTE] FOREIGN KEY([Nu_Lotm])
REFERENCES [dbo].[LOTEAMENTO] ([Nu_Lotm])
GO

ALTER TABLE [dbo].[LOTE] CHECK CONSTRAINT [FK_LOTEAMENTO_LOTE]
GO

ALTER TABLE [dbo].[LOTES_PROPOSTA]  WITH CHECK ADD  CONSTRAINT [FK_LOTE_LOTESPROPOSTA] FOREIGN KEY([Nu_Lotm], [Nu_Quadra], [Nu_Lote])
REFERENCES [dbo].[LOTE] ([Nu_Lotm], [Nu_Quadra], [Nu_Lote])
GO

ALTER TABLE [dbo].[LOTES_PROPOSTA] CHECK CONSTRAINT [FK_LOTE_LOTESPROPOSTA]
GO

ALTER TABLE [dbo].[LOTES_PROPOSTA]  WITH CHECK ADD  CONSTRAINT [FK_PROPOSTA_LOTESPROPOSTA] FOREIGN KEY([Nu_Proposta])
REFERENCES [dbo].[PROPOSTA] ([Nu_Proposta])
GO

ALTER TABLE [dbo].[LOTES_PROPOSTA] CHECK CONSTRAINT [FK_PROPOSTA_LOTESPROPOSTA]
GO

ALTER TABLE [dbo].[PARCELAS_SINAL_PROPOSTA]  WITH CHECK ADD  CONSTRAINT [FK_PROPOSTA_PARCELASPROPOSTA] FOREIGN KEY([Nu_Proposta])
REFERENCES [dbo].[PROPOSTA] ([Nu_Proposta])
GO

ALTER TABLE [dbo].[PARCELAS_SINAL_PROPOSTA] CHECK CONSTRAINT [FK_PROPOSTA_PARCELASPROPOSTA]
GO

ALTER TABLE [dbo].[PROMITENTE]  WITH CHECK ADD  CONSTRAINT [FK_ENDERECO_PROMITENTE_COBR] FOREIGN KEY([Nu_Cep_Cobr])
REFERENCES [dbo].[ENDERECO] ([Nu_Cep])
GO

ALTER TABLE [dbo].[PROMITENTE] CHECK CONSTRAINT [FK_ENDERECO_PROMITENTE_COBR]
GO

ALTER TABLE [dbo].[PROPOSTA]  WITH CHECK ADD  CONSTRAINT [FK_PROMITENTE_PROPOSTA] FOREIGN KEY([Cd_Promitente])
REFERENCES [dbo].[PROMITENTE] ([Cd_Pro])
GO

ALTER TABLE [dbo].[PROPOSTA] CHECK CONSTRAINT [FK_PROMITENTE_PROPOSTA]
GO

ALTER TABLE [dbo].[PROPOSTA]  WITH CHECK ADD  CONSTRAINT [FK_PROPOSTA_FINANCIAMENTO] FOREIGN KEY([Qt_Prest])
REFERENCES [dbo].[FINANCIAMENTO] ([Qtd_Parcelas])
GO

ALTER TABLE [dbo].[PROPOSTA] CHECK CONSTRAINT [FK_PROPOSTA_FINANCIAMENTO]
GO

ALTER TABLE [dbo].[PROPOSTA]  WITH CHECK ADD  CONSTRAINT [FK_PROPOSTA_LOTEAMENTO] FOREIGN KEY([Nu_Lotm])
REFERENCES [dbo].[LOTEAMENTO] ([Nu_Lotm])
GO

ALTER TABLE [dbo].[PROPOSTA] CHECK CONSTRAINT [FK_PROPOSTA_LOTEAMENTO]
GO

ALTER TABLE [dbo].[PROPOSTA]  WITH CHECK ADD  CONSTRAINT [FK_VENDEDOR_PROPOSTA] FOREIGN KEY([Cd_Vend])
REFERENCES [dbo].[VENDEDOR] ([Cd_vend])
GO

ALTER TABLE [dbo].[PROPOSTA] CHECK CONSTRAINT [FK_VENDEDOR_PROPOSTA]
GO

ALTER TABLE [dbo].[TRANSACAO]  WITH CHECK ADD  CONSTRAINT [FK_Transacao_Transacao] FOREIGN KEY([Id_Pai])
REFERENCES [dbo].[TRANSACAO] ([Id])
GO

ALTER TABLE [dbo].[TRANSACAO] CHECK CONSTRAINT [FK_Transacao_Transacao]
GO

ALTER TABLE [dbo].[TRANSACAO_PERFIL]  WITH CHECK ADD  CONSTRAINT [FK_Perfil_TransacaoPerfil] FOREIGN KEY([Id_Perfil])
REFERENCES [dbo].[PERFIL] ([Id])
GO

ALTER TABLE [dbo].[TRANSACAO_PERFIL] CHECK CONSTRAINT [FK_Perfil_TransacaoPerfil]
GO

ALTER TABLE [dbo].[TRANSACAO_PERFIL]  WITH CHECK ADD  CONSTRAINT [FK_Transacao_TransacaoPerfil] FOREIGN KEY([Id_Transacao])
REFERENCES [dbo].[TRANSACAO] ([Id])
GO

ALTER TABLE [dbo].[TRANSACAO_PERFIL] CHECK CONSTRAINT [FK_Transacao_TransacaoPerfil]
GO

ALTER TABLE [dbo].[USUARIO_PERFIL]  WITH CHECK ADD  CONSTRAINT [FK_Perfil_UsuarioPerfil] FOREIGN KEY([Id_Perfil])
REFERENCES [dbo].[PERFIL] ([Id])
GO

ALTER TABLE [dbo].[USUARIO_PERFIL] CHECK CONSTRAINT [FK_Perfil_UsuarioPerfil]
GO

ALTER TABLE [dbo].[USUARIO_PERFIL]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_UsuarioPerfil] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[USUARIO] ([Id])
GO

ALTER TABLE [dbo].[USUARIO_PERFIL] CHECK CONSTRAINT [FK_Usuario_UsuarioPerfil]
GO

ALTER TABLE [dbo].[VENDEDOR]  WITH CHECK ADD  CONSTRAINT [FK_VENDEDOR_ENDERECO] FOREIGN KEY([Nu_cep])
REFERENCES [dbo].[ENDERECO] ([Nu_Cep])
GO

ALTER TABLE [dbo].[VENDEDOR] CHECK CONSTRAINT [FK_VENDEDOR_ENDERECO]
GO


