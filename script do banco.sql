USE [PINDUCAS_farm]
GO
/****** Object:  Table [dbo].[Calhas]    Script Date: 21/05/2024 22:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calhas](
	[id_calha] [int] IDENTITY(1,1) NOT NULL,
	[quantidade_suportes] [int] NOT NULL,
	[ocupada] [bit] NOT NULL,
	[id_suporte] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_calha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cargos]    Script Date: 21/05/2024 22:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargos](
	[id_cargo] [int] IDENTITY(1,1) NOT NULL,
	[cargo] [varchar](45) NOT NULL,
	[permissoes] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 21/05/2024 22:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome_cliente] [varchar](100) NULL,
	[cpf] [float] NOT NULL,
	[telefone] [varchar](11) NOT NULL,
	[assinante] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 21/05/2024 22:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[id_compra] [int] IDENTITY(1,1) NOT NULL,
	[id_produto] [int] NOT NULL,
	[id_fornecedor] [int] NOT NULL,
	[id_estoque] [int] NOT NULL,
	[quantidade_compra] [int] NULL,
	[valor_unitario] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Endereco_funcionarios]    Script Date: 21/05/2024 22:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Endereco_funcionarios](
	[id_endereco] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[ativo] [bit] NOT NULL,
	[logradouro] [varchar](90) NOT NULL,
	[cidade] [varchar](45) NOT NULL,
	[numero] [varchar](45) NOT NULL,
	[cep] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_endereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estoque]    Script Date: 21/05/2024 22:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estoque](
	[id_estoque] [int] IDENTITY(1,1) NOT NULL,
	[id_produto] [int] NOT NULL,
	[quantidade_entrada] [int] NULL,
	[quantidade_saida] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_estoque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estoque_Produto]    Script Date: 21/05/2024 22:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estoque_Produto](
	[id_estoque_produto] [int] IDENTITY(1,1) NOT NULL,
	[id_producao] [int] NOT NULL,
	[quantidade] [int] NOT NULL,
	[quantidade_vendido] [int] NOT NULL,
	[id_produto] [int] NULL,
	[nome_lote] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_estoque_produto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fornecedor]    Script Date: 21/05/2024 22:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fornecedor](
	[id_fornecedor] [int] IDENTITY(1,1) NOT NULL,
	[cnpj] [varchar](14) NOT NULL,
	[nome] [varchar](45) NOT NULL,
	[fone] [varchar](11) NULL,
	[email] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_fornecedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cnpj] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funcionarios]    Script Date: 21/05/2024 22:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcionarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[cpf] [varchar](11) NOT NULL,
	[senha] [varchar](20) NOT NULL,
	[nome] [varchar](45) NOT NULL,
	[ddd] [varchar](2) NOT NULL,
	[fone] [varchar](9) NOT NULL,
	[email] [varchar](45) NOT NULL,
	[id_endereco] [int] NOT NULL,
	[id_cargo] [int] NOT NULL,
	[superior] [int] NULL,
	[idade] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cpf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producao]    Script Date: 21/05/2024 22:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producao](
	[id_producao] [int] IDENTITY(1,1) NOT NULL,
	[id_estoque] [int] NOT NULL,
	[quantidade_inicial] [int] NOT NULL,
	[quantidade_produzido] [int] NOT NULL,
	[id_calha] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produto]    Script Date: 21/05/2024 22:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produto](
	[id_produto] [int] IDENTITY(1,1) NOT NULL,
	[nome_produto] [varchar](45) NOT NULL,
	[descricao] [varchar](90) NULL,
	[temperatura_plantio] [int] NOT NULL,
	[dias_para_colheita] [int] NOT NULL,
	[prazo_validade] [int] NULL,
	[tipo_produto] [int] NOT NULL,
	[preco] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_produto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suporte_Calhas]    Script Date: 21/05/2024 22:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suporte_Calhas](
	[id_suporte] [int] IDENTITY(1,1) NOT NULL,
	[capacidade_calhas] [int] NOT NULL,
	[andares] [int] NOT NULL,
	[ocupada] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_suporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 21/05/2024 22:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[senha] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venda]    Script Date: 21/05/2024 22:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venda](
	[id_venda] [int] IDENTITY(1,1) NOT NULL,
	[id_estoque_produto] [int] NOT NULL,
	[quantidade] [int] NOT NULL,
	[valor_venda] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_venda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Calhas]  WITH CHECK ADD  CONSTRAINT [fk_calhas_suporte] FOREIGN KEY([id_suporte])
REFERENCES [dbo].[Suporte_Calhas] ([id_suporte])
GO
ALTER TABLE [dbo].[Calhas] CHECK CONSTRAINT [fk_calhas_suporte]
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [fk_compra_estoque] FOREIGN KEY([id_estoque])
REFERENCES [dbo].[Estoque] ([id_estoque])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [fk_compra_estoque]
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [fk_compra_fornecedor] FOREIGN KEY([id_fornecedor])
REFERENCES [dbo].[Fornecedor] ([id_fornecedor])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [fk_compra_fornecedor]
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [fk_compra_produto] FOREIGN KEY([id_produto])
REFERENCES [dbo].[Produto] ([id_produto])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [fk_compra_produto]
GO
ALTER TABLE [dbo].[Endereco_funcionarios]  WITH CHECK ADD  CONSTRAINT [fk_endereco_funcionarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Funcionarios] ([id_usuario])
GO
ALTER TABLE [dbo].[Endereco_funcionarios] CHECK CONSTRAINT [fk_endereco_funcionarios]
GO
ALTER TABLE [dbo].[Estoque]  WITH CHECK ADD  CONSTRAINT [fk_estoque_produto] FOREIGN KEY([id_produto])
REFERENCES [dbo].[Produto] ([id_produto])
GO
ALTER TABLE [dbo].[Estoque] CHECK CONSTRAINT [fk_estoque_produto]
GO
ALTER TABLE [dbo].[Estoque_Produto]  WITH CHECK ADD FOREIGN KEY([id_produto])
REFERENCES [dbo].[Produto] ([id_produto])
GO
ALTER TABLE [dbo].[Estoque_Produto]  WITH CHECK ADD  CONSTRAINT [fk_estoquep_producao] FOREIGN KEY([id_producao])
REFERENCES [dbo].[Producao] ([id_producao])
GO
ALTER TABLE [dbo].[Estoque_Produto] CHECK CONSTRAINT [fk_estoquep_producao]
GO
ALTER TABLE [dbo].[Funcionarios]  WITH CHECK ADD  CONSTRAINT [fk_funcionarios_cargo] FOREIGN KEY([id_cargo])
REFERENCES [dbo].[Cargos] ([id_cargo])
GO
ALTER TABLE [dbo].[Funcionarios] CHECK CONSTRAINT [fk_funcionarios_cargo]
GO
ALTER TABLE [dbo].[Funcionarios]  WITH CHECK ADD  CONSTRAINT [fk_funcionarios_endereco] FOREIGN KEY([id_endereco])
REFERENCES [dbo].[Endereco_funcionarios] ([id_endereco])
GO
ALTER TABLE [dbo].[Funcionarios] CHECK CONSTRAINT [fk_funcionarios_endereco]
GO
ALTER TABLE [dbo].[Producao]  WITH CHECK ADD  CONSTRAINT [fk_producao_calha] FOREIGN KEY([id_calha])
REFERENCES [dbo].[Calhas] ([id_calha])
GO
ALTER TABLE [dbo].[Producao] CHECK CONSTRAINT [fk_producao_calha]
GO
ALTER TABLE [dbo].[Producao]  WITH CHECK ADD  CONSTRAINT [fk_producao_estoque] FOREIGN KEY([id_estoque])
REFERENCES [dbo].[Estoque] ([id_estoque])
GO
ALTER TABLE [dbo].[Producao] CHECK CONSTRAINT [fk_producao_estoque]
GO
ALTER TABLE [dbo].[Venda]  WITH CHECK ADD  CONSTRAINT [fk_venda_estoque] FOREIGN KEY([id_estoque_produto])
REFERENCES [dbo].[Estoque_Produto] ([id_estoque_produto])
GO
ALTER TABLE [dbo].[Venda] CHECK CONSTRAINT [fk_venda_estoque]
GO
