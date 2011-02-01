USE tcc
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

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PRECO_LOTE]') AND parent_object_id = OBJECT_ID(N'[dbo].[LOTE]'))
ALTER TABLE [dbo].[LOTE] DROP CONSTRAINT [FK_PRECO_LOTE]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LOTE_LOTESPROPOSTA]') AND parent_object_id = OBJECT_ID(N'[dbo].[LOTES_PROPOSTA]'))
ALTER TABLE [dbo].[LOTES_PROPOSTA] DROP CONSTRAINT [FK_LOTE_LOTESPROPOSTA]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PROPOSTA_LOTESPROPOSTA]') AND parent_object_id = OBJECT_ID(N'[dbo].[LOTES_PROPOSTA]'))
ALTER TABLE [dbo].[LOTES_PROPOSTA] DROP CONSTRAINT [FK_PROPOSTA_LOTESPROPOSTA]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PROPOSTA_PARCELASPROPOSTA]') AND parent_object_id = OBJECT_ID(N'[dbo].[PARCELAS_PROPOSTA]'))
ALTER TABLE [dbo].[PARCELAS_PROPOSTA] DROP CONSTRAINT [FK_PROPOSTA_PARCELASPROPOSTA]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PORTADOR_PORTADORPROPOSTA]') AND parent_object_id = OBJECT_ID(N'[dbo].[PORTADOR_PROPOSTA]'))
ALTER TABLE [dbo].[PORTADOR_PROPOSTA] DROP CONSTRAINT [FK_PORTADOR_PORTADORPROPOSTA]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PROPOSTA_PORTADORPROPOSTA]') AND parent_object_id = OBJECT_ID(N'[dbo].[PORTADOR_PROPOSTA]'))
ALTER TABLE [dbo].[PORTADOR_PROPOSTA] DROP CONSTRAINT [FK_PROPOSTA_PORTADORPROPOSTA]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ENDERECO_PROMITENTE_COBR]') AND parent_object_id = OBJECT_ID(N'[dbo].[PROMITENTE]'))
ALTER TABLE [dbo].[PROMITENTE] DROP CONSTRAINT [FK_ENDERECO_PROMITENTE_COBR]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ENDERECO_PROMITENTE_RES]') AND parent_object_id = OBJECT_ID(N'[dbo].[PROMITENTE]'))
ALTER TABLE [dbo].[PROMITENTE] DROP CONSTRAINT [FK_ENDERECO_PROMITENTE_RES]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PROMITENTE_PROPOSTA]') AND parent_object_id = OBJECT_ID(N'[dbo].[PROPOSTA]'))
ALTER TABLE [dbo].[PROPOSTA] DROP CONSTRAINT [FK_PROMITENTE_PROPOSTA]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VENDEDOR_PROPOSTA]') AND parent_object_id = OBJECT_ID(N'[dbo].[PROPOSTA]'))
ALTER TABLE [dbo].[PROPOSTA] DROP CONSTRAINT [FK_VENDEDOR_PROPOSTA]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VENDEDOR_REFERENCIAVENDEDOR]') AND parent_object_id = OBJECT_ID(N'[dbo].[REFERENCIA_VENDEDOR]'))
ALTER TABLE [dbo].[REFERENCIA_VENDEDOR] DROP CONSTRAINT [FK_VENDEDOR_REFERENCIAVENDEDOR]
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

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ENDERECO_VENDEDOR]') AND parent_object_id = OBJECT_ID(N'[dbo].[VENDEDOR]'))
ALTER TABLE [dbo].[VENDEDOR] DROP CONSTRAINT [FK_ENDERECO_VENDEDOR]
GO

USE [tcc]
GO

/****** Object:  Table [dbo].[CIDADE]    Script Date: 01/30/2011 22:59:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CIDADE]') AND type in (N'U'))
DROP TABLE [dbo].[CIDADE]
GO

/****** Object:  Table [dbo].[ENDERECO]    Script Date: 01/30/2011 22:59:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ENDERECO]') AND type in (N'U'))
DROP TABLE [dbo].[ENDERECO]
GO

/****** Object:  Table [dbo].[FINANCIAMENTO]    Script Date: 01/30/2011 22:59:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FINANCIAMENTO]') AND type in (N'U'))
DROP TABLE [dbo].[FINANCIAMENTO]
GO

/****** Object:  Table [dbo].[LOTE]    Script Date: 01/30/2011 22:59:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LOTE]') AND type in (N'U'))
DROP TABLE [dbo].[LOTE]
GO

/****** Object:  Table [dbo].[LOTEAMENTO]    Script Date: 01/30/2011 22:59:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LOTEAMENTO]') AND type in (N'U'))
DROP TABLE [dbo].[LOTEAMENTO]
GO

/****** Object:  Table [dbo].[LOTES_PROPOSTA]    Script Date: 01/30/2011 22:59:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LOTES_PROPOSTA]') AND type in (N'U'))
DROP TABLE [dbo].[LOTES_PROPOSTA]
GO

/****** Object:  Table [dbo].[PARCELAS_PROPOSTA]    Script Date: 01/30/2011 22:59:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PARCELAS_PROPOSTA]') AND type in (N'U'))
DROP TABLE [dbo].[PARCELAS_PROPOSTA]
GO

/****** Object:  Table [dbo].[PERFIL]    Script Date: 01/30/2011 22:59:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PERFIL]') AND type in (N'U'))
DROP TABLE [dbo].[PERFIL]
GO

/****** Object:  Table [dbo].[PORTADOR]    Script Date: 01/30/2011 22:59:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PORTADOR]') AND type in (N'U'))
DROP TABLE [dbo].[PORTADOR]
GO

/****** Object:  Table [dbo].[PORTADOR_PROPOSTA]    Script Date: 01/30/2011 22:59:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PORTADOR_PROPOSTA]') AND type in (N'U'))
DROP TABLE [dbo].[PORTADOR_PROPOSTA]
GO

/****** Object:  Table [dbo].[PRECO]    Script Date: 01/30/2011 22:59:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PRECO]') AND type in (N'U'))
DROP TABLE [dbo].[PRECO]
GO

/****** Object:  Table [dbo].[PROMITENTE]    Script Date: 01/30/2011 22:59:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PROMITENTE]') AND type in (N'U'))
DROP TABLE [dbo].[PROMITENTE]
GO

/****** Object:  Table [dbo].[PROPOSTA]    Script Date: 01/30/2011 22:59:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PROPOSTA]') AND type in (N'U'))
DROP TABLE [dbo].[PROPOSTA]
GO

/****** Object:  Table [dbo].[REFERENCIA_VENDEDOR]    Script Date: 01/30/2011 22:59:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REFERENCIA_VENDEDOR]') AND type in (N'U'))
DROP TABLE [dbo].[REFERENCIA_VENDEDOR]
GO

/****** Object:  Table [dbo].[TAB_FLAG]    Script Date: 01/30/2011 22:59:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TAB_FLAG]') AND type in (N'U'))
DROP TABLE [dbo].[TAB_FLAG]
GO

/****** Object:  Table [dbo].[TIPO_LOGRADOURO]    Script Date: 01/30/2011 22:59:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TIPO_LOGRADOURO]') AND type in (N'U'))
DROP TABLE [dbo].[TIPO_LOGRADOURO]
GO

/****** Object:  Table [dbo].[TRANSACAO]    Script Date: 01/30/2011 22:59:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TRANSACAO]') AND type in (N'U'))
DROP TABLE [dbo].[TRANSACAO]
GO

/****** Object:  Table [dbo].[TRANSACAO_PERFIL]    Script Date: 01/30/2011 22:59:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TRANSACAO_PERFIL]') AND type in (N'U'))
DROP TABLE [dbo].[TRANSACAO_PERFIL]
GO

/****** Object:  Table [dbo].[USUARIO]    Script Date: 01/30/2011 22:59:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USUARIO]') AND type in (N'U'))
DROP TABLE [dbo].[USUARIO]
GO

/****** Object:  Table [dbo].[USUARIO_PERFIL]    Script Date: 01/30/2011 22:59:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USUARIO_PERFIL]') AND type in (N'U'))
DROP TABLE [dbo].[USUARIO_PERFIL]
GO

/****** Object:  Table [dbo].[VENDEDOR]    Script Date: 01/30/2011 22:59:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VENDEDOR]') AND type in (N'U'))
DROP TABLE [dbo].[VENDEDOR]
GO

USE [tcc]
GO

/****** Object:  Table [dbo].[CIDADE]    Script Date: 01/30/2011 22:59:53 ******/
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

/****** Object:  Table [dbo].[ENDERECO]    Script Date: 01/30/2011 22:59:53 ******/
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

/****** Object:  Table [dbo].[FINANCIAMENTO]    Script Date: 01/30/2011 22:59:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[FINANCIAMENTO](
	[Nu_Meses] [varchar](2) NULL,
	[Pc_Finan] [numeric](15, 5) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [tcc]
GO

/****** Object:  Table [dbo].[LOTE]    Script Date: 01/30/2011 22:59:53 ******/
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
	[Nu_Contr] [varchar](5) NOT NULL,
	[Nu_Dim_Frente] [numeric](15, 2) NOT NULL,
	[Ds_Conf_Frente] [varchar](20) NOT NULL,
	[Nu_Dim_Fundo] [numeric](15, 2) NOT NULL,
	[Ds_Conf_Fundo] [varchar](20) NOT NULL,
	[Nu_Dim_Direita] [numeric](10, 2) NOT NULL,
	[Ds_Conf_Direita] [varchar](20) NOT NULL,
	[Nu_Dim_Esquerda] [numeric](15, 2) NOT NULL,
	[Ds_Conf_Esquerda] [varchar](20) NOT NULL,
	[Nu_Area] [numeric](15, 2) NOT NULL,
	[Nu_Dist_Esquina] [numeric](15, 2) NOT NULL,
	[Cd_preco] [varchar](2) NOT NULL,
	[Fl_Sit] [varchar](1) NOT NULL,
	[Dt_Alter] [datetime] NOT NULL,
	[Cd_Uso] [varchar](1) NOT NULL,
	[Cd_Pro] [varchar](5) NOT NULL,
	[Cd_Etapa] [varchar](1) NOT NULL,
	[Ds_Dim_Frente] [varchar](20) NOT NULL,
	[Ds_Dim_Fundo] [varchar](20) NOT NULL,
	[Ds_Dim_Direita] [varchar](20) NOT NULL,
	[Ds_Dim_Esquerda] [varchar](20) NOT NULL,
	[Nu_Lotm_Cont] [varchar](3) NOT NULL,
	[Fl_Edificacao] [varchar](1) NOT NULL,
	[Ch_Contr] [varchar](8) NOT NULL,
	[Ch_Lote] [varchar](9) NULL,
	[Fl_Sit_Rel] [varchar](1) NOT NULL,
	[Vl_Acrescimo] [numeric](15, 2) NOT NULL,
	[Ds_Obs_Edific] [varchar](120) NOT NULL,
	[Cd_Zona] [varchar](2) NOT NULL,
	[Cd_Preco2] [varchar](2) NOT NULL,
	[Seq_Imovel] [varchar](8) NOT NULL,
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

/****** Object:  Table [dbo].[LOTEAMENTO]    Script Date: 01/30/2011 22:59:53 ******/
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

/****** Object:  Table [dbo].[LOTES_PROPOSTA]    Script Date: 01/30/2011 22:59:53 ******/
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

/****** Object:  Table [dbo].[PARCELAS_PROPOSTA]    Script Date: 01/30/2011 22:59:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PARCELAS_PROPOSTA](
	[Nu_Proposta] [varchar](5) NOT NULL,
	[Nu_Parcela] [int] NOT NULL,
	[No_Banco] [varchar](15) NULL,
	[Nu_Cheque] [varchar](10) NOT NULL,
	[Vl_Cheque] [numeric](10, 2) NULL,
	[Dt_Cheque] [datetime] NULL,
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

/****** Object:  Table [dbo].[PERFIL]    Script Date: 01/30/2011 22:59:53 ******/
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

/****** Object:  Table [dbo].[PORTADOR]    Script Date: 01/30/2011 22:59:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PORTADOR](
	[Cd_Port] [varchar](3) NOT NULL,
	[Ds_Razao_Social] [varchar](40) NOT NULL,
	[No_Port] [varchar](15) NOT NULL,
	[Nu_Agencia] [varchar](5) NOT NULL,
	[Nu_CC] [varchar](10) NOT NULL,
	[Tp_Conta] [varchar](2) NOT NULL,
	[Nu_Fone] [varchar](10) NOT NULL,
	[Cd_Banco] [varchar](3) NOT NULL,
	[Fl_Contabil] [varchar](1) NOT NULL,
	[Fl_Proposta] [varchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cd_Port] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [tcc]
GO

/****** Object:  Table [dbo].[PORTADOR_PROPOSTA]    Script Date: 01/30/2011 22:59:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PORTADOR_PROPOSTA](
	[Nu_Proposta] [varchar](5) NOT NULL,
	[Cd_Port] [varchar](3) NOT NULL,
 CONSTRAINT [PK_PORTADOR_PROPOSTA] PRIMARY KEY CLUSTERED 
(
	[Nu_Proposta] ASC,
	[Cd_Port] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [tcc]
GO

/****** Object:  Table [dbo].[PRECO]    Script Date: 01/30/2011 22:59:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PRECO](
	[Cd_Preco] [varchar](2) NOT NULL,
	[Pc_Sinal] [numeric](15, 2) NOT NULL,
	[Pc_Prest] [numeric](15, 2) NOT NULL,
	[Pc_Interc] [numeric](15, 2) NOT NULL,
	[Vl_M2] [numeric](15, 5) NOT NULL,
	[Cd_Ind] [varchar](2) NOT NULL,
	[Dt_Ind] [datetime] NOT NULL,
	[Ds_Tipo_Lote] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cd_Preco] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [tcc]
GO

/****** Object:  Table [dbo].[PROMITENTE]    Script Date: 01/30/2011 22:59:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PROMITENTE](
	[Cd_Pro] [varchar](5) NOT NULL,
	[No_Promitente] [varchar](40) NOT NULL,
	[Fl_Est_Civ] [varchar](1) NOT NULL,
	[Fl_Sexo] [varchar](1) NOT NULL,
	[Nu_Rg] [varchar](10) NOT NULL,
	[Ds_Org_Emiss] [varchar](6) NOT NULL,
	[Dt_Exp_Rg] [datetime] NOT NULL,
	[Nu_CGC_CPF] [varchar](15) NOT NULL,
	[Dt_Nasc] [datetime] NOT NULL,
	[Fl_Dep] [varchar](1) NOT NULL,
	[Nu_Cep_Res] [varchar](8) NOT NULL,
	[Nu_End_Res] [varchar](15) NULL,
	[Ds_Compl_End_Res] [varchar](30) NULL,
	[Nu_Fone_Res] [varchar](11) NOT NULL,
	[No_Menor] [varchar](40) NOT NULL,
	[Fl_Nacd] [varchar](1) NOT NULL,
	[Nu_Cep_Cobr] [varchar](8) NOT NULL,
	[Nu_End_Cobr] [varchar](15) NULL,
	[Ds_Compl_End_Cobr] [varchar](30) NULL,
	[Nu_Fone_Cobr] [varchar](11) NOT NULL,
	[Ds_Profissao] [varchar](20) NOT NULL,
	[Fl_Sit] [varchar](1) NOT NULL,
	[Nu_CGC_CPF_Menor] [varchar](15) NOT NULL,
	[Fl_End_SISA] [varchar](1) NOT NULL,
	[Fl_Trans_F] [varchar](1) NOT NULL,
	[Dt_Alteracao] [datetime] NOT NULL,
	[Ds_Tratamento] [varchar](11) NOT NULL,
 CONSTRAINT [PK__PROMITEN__6C0332BA3C69FB99] PRIMARY KEY CLUSTERED 
(
	[Cd_Pro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [tcc]
GO

/****** Object:  Table [dbo].[PROPOSTA]    Script Date: 01/30/2011 22:59:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PROPOSTA](
	[Nu_Proposta] [varchar](5) NOT NULL,
	[Cd_Pro] [varchar](5) NULL,
	[No_Conjuge] [varchar](40) NOT NULL,
	[Vl_Vista] [numeric](15, 2) NOT NULL,
	[Vl_Sinal] [numeric](15, 2) NOT NULL,
	[Qt_Prest] [int] NOT NULL,
	[Vl_Prest] [numeric](15, 2) NOT NULL,
	[Ds_Obs] [varchar](60) NOT NULL,
	[Fl_Sit] [varchar](1) NOT NULL,
	[Cd_Vend] [varchar](3) NOT NULL,
	[Dt_Emissao] [datetime] NOT NULL,
	[Vl_Recebido] [numeric](15, 2) NOT NULL,
	[Ds_Recebido] [varchar](15) NOT NULL,
	[Dt_Prest] [datetime] NOT NULL,
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

/****** Object:  Table [dbo].[REFERENCIA_VENDEDOR]    Script Date: 01/30/2011 22:59:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[REFERENCIA_VENDEDOR](
	[Cd_Vend] [varchar](3) NOT NULL,
	[Cd_Ref] [int] NOT NULL,
	[Fl_Tipo_Ref] [char](1) NOT NULL,
	[No_Ref] [varchar](40) NOT NULL,
	[Nu_Fone_Ref] [varchar](11) NULL,
 CONSTRAINT [PK_REFERENCIA_VENDEDOR] PRIMARY KEY CLUSTERED 
(
	[Cd_Vend] ASC,
	[Cd_Ref] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [tcc]
GO

/****** Object:  Table [dbo].[TAB_FLAG]    Script Date: 01/30/2011 22:59:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TAB_FLAG](
	[Cd_Entidade] [varchar](5) NOT NULL,
	[Cd_Campo] [varchar](5) NOT NULL,
	[Cd_Pesquisa] [varchar](5) NOT NULL,
	[Ds_Flag] [varchar](20) NOT NULL,
	[Ch_Tab_Flag] [varchar](11) NULL,
	[Ch_Ent_Campo] [varchar](10) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [tcc]
GO

/****** Object:  Table [dbo].[TIPO_LOGRADOURO]    Script Date: 01/30/2011 22:59:53 ******/
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

/****** Object:  Table [dbo].[TRANSACAO]    Script Date: 01/30/2011 22:59:53 ******/
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

/****** Object:  Table [dbo].[TRANSACAO_PERFIL]    Script Date: 01/30/2011 22:59:53 ******/
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

/****** Object:  Table [dbo].[USUARIO]    Script Date: 01/30/2011 22:59:53 ******/
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

/****** Object:  Table [dbo].[USUARIO_PERFIL]    Script Date: 01/30/2011 22:59:53 ******/
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

/****** Object:  Table [dbo].[VENDEDOR]    Script Date: 01/30/2011 22:59:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[VENDEDOR](
	[Cd_vend] [varchar](3) NOT NULL,
	[Ds_Razao_Nome] [varchar](40) NOT NULL,
	[Nu_Cep] [varchar](8) NOT NULL,
	[Nu_End] [varchar](15) NULL,
	[Ds_Compl_End] [varchar](30) NULL,
	[Nu_Fone] [varchar](11) NOT NULL,
	[Fl_Sexo] [varchar](1) NOT NULL,
	[Nu_Rg] [numeric](10, 0) NOT NULL,
	[Ds_Org_Emiss] [varchar](6) NOT NULL,
	[Dt_Exp_Rg] [datetime] NOT NULL,
	[Nu_CGC_CPF] [varchar](15) NOT NULL,
	[Dt_nasc] [datetime] NOT NULL,
	[Pc_Comissao_1] [numeric](15, 2) NOT NULL,
	[Pc_Comissao_2] [numeric](15, 2) NOT NULL,
	[Nu_Rg_Prof] [varchar](10) NOT NULL,
	[Nu_Serie] [varchar](7) NOT NULL,
	[Nu_Creci] [varchar](5) NOT NULL,
	[Nu_Inss] [varchar](10) NOT NULL,
	[Nu_Cim] [varchar](8) NOT NULL,
	[Fl_Est_Civ] [varchar](1) NOT NULL,
	[No_Fantasia] [varchar](40) NOT NULL,
	[Nu_Core] [varchar](6) NOT NULL,
	[Fl_Sit] [varchar](1) NOT NULL,
	[Fl_sinal] [varchar](1) NOT NULL,
	[Nu_Insc] [varchar](18) NOT NULL,
	[Fl_Supervisor] [varchar](1) NOT NULL,
	[Cd_Supervisor] [varchar](3) NOT NULL,
 CONSTRAINT [PK__VENDEDOR__F538D12E24927208] PRIMARY KEY CLUSTERED 
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

ALTER TABLE [dbo].[LOTE]  WITH CHECK ADD  CONSTRAINT [FK_PRECO_LOTE] FOREIGN KEY([Cd_preco])
REFERENCES [dbo].[PRECO] ([Cd_Preco])
GO

ALTER TABLE [dbo].[LOTE] CHECK CONSTRAINT [FK_PRECO_LOTE]
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

ALTER TABLE [dbo].[PARCELAS_PROPOSTA]  WITH CHECK ADD  CONSTRAINT [FK_PROPOSTA_PARCELASPROPOSTA] FOREIGN KEY([Nu_Proposta])
REFERENCES [dbo].[PROPOSTA] ([Nu_Proposta])
GO

ALTER TABLE [dbo].[PARCELAS_PROPOSTA] CHECK CONSTRAINT [FK_PROPOSTA_PARCELASPROPOSTA]
GO

ALTER TABLE [dbo].[PORTADOR_PROPOSTA]  WITH CHECK ADD  CONSTRAINT [FK_PORTADOR_PORTADORPROPOSTA] FOREIGN KEY([Cd_Port])
REFERENCES [dbo].[PORTADOR] ([Cd_Port])
GO

ALTER TABLE [dbo].[PORTADOR_PROPOSTA] CHECK CONSTRAINT [FK_PORTADOR_PORTADORPROPOSTA]
GO

ALTER TABLE [dbo].[PORTADOR_PROPOSTA]  WITH CHECK ADD  CONSTRAINT [FK_PROPOSTA_PORTADORPROPOSTA] FOREIGN KEY([Nu_Proposta])
REFERENCES [dbo].[PROPOSTA] ([Nu_Proposta])
GO

ALTER TABLE [dbo].[PORTADOR_PROPOSTA] CHECK CONSTRAINT [FK_PROPOSTA_PORTADORPROPOSTA]
GO

ALTER TABLE [dbo].[PROMITENTE]  WITH CHECK ADD  CONSTRAINT [FK_ENDERECO_PROMITENTE_COBR] FOREIGN KEY([Nu_Cep_Cobr])
REFERENCES [dbo].[ENDERECO] ([Nu_Cep])
GO

ALTER TABLE [dbo].[PROMITENTE] CHECK CONSTRAINT [FK_ENDERECO_PROMITENTE_COBR]
GO

ALTER TABLE [dbo].[PROMITENTE]  WITH CHECK ADD  CONSTRAINT [FK_ENDERECO_PROMITENTE_RES] FOREIGN KEY([Nu_Cep_Res])
REFERENCES [dbo].[ENDERECO] ([Nu_Cep])
GO

ALTER TABLE [dbo].[PROMITENTE] CHECK CONSTRAINT [FK_ENDERECO_PROMITENTE_RES]
GO

ALTER TABLE [dbo].[PROPOSTA]  WITH CHECK ADD  CONSTRAINT [FK_PROMITENTE_PROPOSTA] FOREIGN KEY([Cd_Pro])
REFERENCES [dbo].[PROMITENTE] ([Cd_Pro])
GO

ALTER TABLE [dbo].[PROPOSTA] CHECK CONSTRAINT [FK_PROMITENTE_PROPOSTA]
GO

ALTER TABLE [dbo].[PROPOSTA]  WITH CHECK ADD  CONSTRAINT [FK_VENDEDOR_PROPOSTA] FOREIGN KEY([Cd_Vend])
REFERENCES [dbo].[VENDEDOR] ([Cd_vend])
GO

ALTER TABLE [dbo].[PROPOSTA] CHECK CONSTRAINT [FK_VENDEDOR_PROPOSTA]
GO

ALTER TABLE [dbo].[REFERENCIA_VENDEDOR]  WITH CHECK ADD  CONSTRAINT [FK_VENDEDOR_REFERENCIAVENDEDOR] FOREIGN KEY([Cd_Vend])
REFERENCES [dbo].[VENDEDOR] ([Cd_vend])
GO

ALTER TABLE [dbo].[REFERENCIA_VENDEDOR] CHECK CONSTRAINT [FK_VENDEDOR_REFERENCIAVENDEDOR]
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

ALTER TABLE [dbo].[VENDEDOR]  WITH CHECK ADD  CONSTRAINT [FK_ENDERECO_VENDEDOR] FOREIGN KEY([Nu_Cep])
REFERENCES [dbo].[ENDERECO] ([Nu_Cep])
GO

ALTER TABLE [dbo].[VENDEDOR] CHECK CONSTRAINT [FK_ENDERECO_VENDEDOR]
GO

