
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/16/2024 20:32:58
-- Generated from EDMX file: F:\DEPI_Project\closing_store\closing_store\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Closing_store];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__product__catgory__5CD6CB2B]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[products] DROP CONSTRAINT [FK__product__catgory__5CD6CB2B];
GO
IF OBJECT_ID(N'[dbo].[FK__customer___custo__403A8C7D]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[customer_address] DROP CONSTRAINT [FK__customer___custo__403A8C7D];
GO
IF OBJECT_ID(N'[dbo].[FK__customer__role_i__05D8E0BE]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[customers] DROP CONSTRAINT [FK__customer__role_i__05D8E0BE];
GO
IF OBJECT_ID(N'[dbo].[FK__review__customer__4316F928]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[reviews] DROP CONSTRAINT [FK__review__customer__4316F928];
GO
IF OBJECT_ID(N'[dbo].[FK__transacti__custo__5629CD9C]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[transactions] DROP CONSTRAINT [FK__transacti__custo__5629CD9C];
GO
IF OBJECT_ID(N'[dbo].[FK__visa__customer_i__3D5E1FD2]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[visas] DROP CONSTRAINT [FK__visa__customer_i__3D5E1FD2];
GO
IF OBJECT_ID(N'[dbo].[FK__customer___produ__4AB81AF0]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[customer_buy_product] DROP CONSTRAINT [FK__customer___produ__4AB81AF0];
GO
IF OBJECT_ID(N'[dbo].[FK__customer___staff__38996AB5]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[customer_service] DROP CONSTRAINT [FK__customer___staff__38996AB5];
GO
IF OBJECT_ID(N'[dbo].[FK__delivers___deliv__5165187F]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[delivers_location] DROP CONSTRAINT [FK__delivers___deliv__5165187F];
GO
IF OBJECT_ID(N'[dbo].[FK__transacti__deliv__5441852A]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[transactions] DROP CONSTRAINT [FK__transacti__deliv__5441852A];
GO
IF OBJECT_ID(N'[dbo].[FK__orders__transact__160F4887]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[orders] DROP CONSTRAINT [FK__orders__transact__160F4887];
GO
IF OBJECT_ID(N'[dbo].[FK__product__supplie__47DBAE45]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[products] DROP CONSTRAINT [FK__product__supplie__47DBAE45];
GO
IF OBJECT_ID(N'[dbo].[FK__transacti__sales__5535A963]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[transactions] DROP CONSTRAINT [FK__transacti__sales__5535A963];
GO
IF OBJECT_ID(N'[dbo].[FK__transacti__trans__59063A47]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[transactions_items] DROP CONSTRAINT [FK__transacti__trans__59063A47];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[customers];
GO
IF OBJECT_ID(N'[dbo].[customer_address]', 'U') IS NOT NULL
    DROP TABLE [dbo].[customer_address];
GO
IF OBJECT_ID(N'[dbo].[customer_buy_product]', 'U') IS NOT NULL
    DROP TABLE [dbo].[customer_buy_product];
GO
IF OBJECT_ID(N'[dbo].[customer_service]', 'U') IS NOT NULL
    DROP TABLE [dbo].[customer_service];
GO
IF OBJECT_ID(N'[dbo].[delivers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[delivers];
GO
IF OBJECT_ID(N'[dbo].[delivers_location]', 'U') IS NOT NULL
    DROP TABLE [dbo].[delivers_location];
GO
IF OBJECT_ID(N'[dbo].[orders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[orders];
GO
IF OBJECT_ID(N'[dbo].[products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[products];
GO
IF OBJECT_ID(N'[dbo].[reviews]', 'U') IS NOT NULL
    DROP TABLE [dbo].[reviews];
GO
IF OBJECT_ID(N'[dbo].[roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[roles];
GO
IF OBJECT_ID(N'[dbo].[sales_history]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sales_history];
GO
IF OBJECT_ID(N'[dbo].[staffs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[staffs];
GO
IF OBJECT_ID(N'[dbo].[suppliers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[suppliers];
GO
IF OBJECT_ID(N'[dbo].[transactions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[transactions];
GO
IF OBJECT_ID(N'[dbo].[transactions_items]', 'U') IS NOT NULL
    DROP TABLE [dbo].[transactions_items];
GO
IF OBJECT_ID(N'[dbo].[visas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[visas];
GO
IF OBJECT_ID(N'[dbo].[getallorders2]', 'U') IS NOT NULL
    DROP TABLE [dbo].[getallorders2];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] varchar(50)  NULL
);
GO

-- Creating table 'customers'
CREATE TABLE [dbo].[customers] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] varchar(50)  NULL,
    [gender] varchar(10)  NULL,
    [password] varchar(50)  NULL,
    [email] varchar(50)  NULL,
    [phone] varchar(20)  NULL,
    [UserName] varchar(50)  NULL,
    [role_id] int  NULL,
    [Address] varchar(50)  NULL
);
GO

-- Creating table 'customer_address'
CREATE TABLE [dbo].[customer_address] (
    [address] varchar(50)  NOT NULL,
    [customer_id] int  NULL
);
GO

-- Creating table 'customer_buy_product'
CREATE TABLE [dbo].[customer_buy_product] (
    [customer_id] int  NOT NULL,
    [product_id] int  NULL
);
GO

-- Creating table 'customer_service'
CREATE TABLE [dbo].[customer_service] (
    [id] int  NOT NULL,
    [complain] varchar(max)  NULL,
    [staff_id] int  NULL
);
GO

-- Creating table 'delivers'
CREATE TABLE [dbo].[delivers] (
    [id] int IDENTITY(1,1) NOT NULL,
    [date] datetime  NULL,
    [status] bit  NULL
);
GO

-- Creating table 'delivers_location'
CREATE TABLE [dbo].[delivers_location] (
    [location] varchar(100)  NOT NULL,
    [delivery_id] int  NULL
);
GO

-- Creating table 'orders'
CREATE TABLE [dbo].[orders] (
    [order_id] int IDENTITY(1,1) NOT NULL,
    [pro_name] varchar(50)  NULL,
    [qty] int  NULL,
    [order_date] datetime  NULL,
    [transaction_id] int  NULL,
    [pro_id] int  NULL,
    [pro_price] int  NULL,
    [order_total] int  NULL
);
GO

-- Creating table 'products'
CREATE TABLE [dbo].[products] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] varchar(50)  NULL,
    [price] int  NULL,
    [quantity] int  NULL,
    [image] nvarchar(max)  NULL,
    [size] varchar(20)  NULL,
    [color] varchar(50)  NULL,
    [description] varchar(max)  NULL,
    [supplier_id] int  NULL,
    [catgory_id] int  NULL
);
GO

-- Creating table 'reviews'
CREATE TABLE [dbo].[reviews] (
    [id] int IDENTITY(1,1) NOT NULL,
    [title] varchar(50)  NULL,
    [date] datetime  NULL,
    [rate] decimal(18,0)  NULL,
    [description] varchar(max)  NULL,
    [customer_id] int  NULL
);
GO

-- Creating table 'roles'
CREATE TABLE [dbo].[roles] (
    [id] int  NOT NULL,
    [role_name] varchar(50)  NULL
);
GO

-- Creating table 'sales_history'
CREATE TABLE [dbo].[sales_history] (
    [id] int IDENTITY(1,1) NOT NULL,
    [date] datetime  NULL,
    [total_price] int  NULL
);
GO

-- Creating table 'staffs'
CREATE TABLE [dbo].[staffs] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] varchar(50)  NULL,
    [password] varchar(50)  NULL,
    [email] varchar(50)  NULL,
    [phone] varchar(20)  NULL
);
GO

-- Creating table 'suppliers'
CREATE TABLE [dbo].[suppliers] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] varchar(50)  NULL,
    [email] varchar(50)  NULL,
    [phone] varchar(20)  NULL
);
GO

-- Creating table 'transactions'
CREATE TABLE [dbo].[transactions] (
    [id] int IDENTITY(1,1) NOT NULL,
    [date] datetime  NULL,
    [total_price] int  NULL,
    [delivery_id] int  NULL,
    [sales_history_id] int  NULL,
    [customer_id] int  NULL
);
GO

-- Creating table 'transactions_items'
CREATE TABLE [dbo].[transactions_items] (
    [items] varchar(50)  NOT NULL,
    [transaction_id] int  NULL
);
GO

-- Creating table 'visas'
CREATE TABLE [dbo].[visas] (
    [id] int IDENTITY(1,1) NOT NULL,
    [credit_num] varchar(30)  NULL,
    [Exp_date_month] varchar(2)  NULL,
    [Exp_date_year] varchar(2)  NULL,
    [cvv] varchar(3)  NULL,
    [customer_id] int  NULL
);
GO

-- Creating table 'getallorders2'
CREATE TABLE [dbo].[getallorders2] (
    [id] int  NOT NULL,
    [customer] varchar(50)  NULL,
    [phone] varchar(20)  NULL,
    [Address] varchar(50)  NULL,
    [product_name] varchar(50)  NULL,
    [pro_price] int  NULL,
    [qty] int  NULL,
    [order_total] int  NULL,
    [Total] int  NULL,
    [date] datetime  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'customers'
ALTER TABLE [dbo].[customers]
ADD CONSTRAINT [PK_customers]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [address] in table 'customer_address'
ALTER TABLE [dbo].[customer_address]
ADD CONSTRAINT [PK_customer_address]
    PRIMARY KEY CLUSTERED ([address] ASC);
GO

-- Creating primary key on [customer_id] in table 'customer_buy_product'
ALTER TABLE [dbo].[customer_buy_product]
ADD CONSTRAINT [PK_customer_buy_product]
    PRIMARY KEY CLUSTERED ([customer_id] ASC);
GO

-- Creating primary key on [id] in table 'customer_service'
ALTER TABLE [dbo].[customer_service]
ADD CONSTRAINT [PK_customer_service]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'delivers'
ALTER TABLE [dbo].[delivers]
ADD CONSTRAINT [PK_delivers]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [location] in table 'delivers_location'
ALTER TABLE [dbo].[delivers_location]
ADD CONSTRAINT [PK_delivers_location]
    PRIMARY KEY CLUSTERED ([location] ASC);
GO

-- Creating primary key on [order_id] in table 'orders'
ALTER TABLE [dbo].[orders]
ADD CONSTRAINT [PK_orders]
    PRIMARY KEY CLUSTERED ([order_id] ASC);
GO

-- Creating primary key on [id] in table 'products'
ALTER TABLE [dbo].[products]
ADD CONSTRAINT [PK_products]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'reviews'
ALTER TABLE [dbo].[reviews]
ADD CONSTRAINT [PK_reviews]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'roles'
ALTER TABLE [dbo].[roles]
ADD CONSTRAINT [PK_roles]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'sales_history'
ALTER TABLE [dbo].[sales_history]
ADD CONSTRAINT [PK_sales_history]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'staffs'
ALTER TABLE [dbo].[staffs]
ADD CONSTRAINT [PK_staffs]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'suppliers'
ALTER TABLE [dbo].[suppliers]
ADD CONSTRAINT [PK_suppliers]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'transactions'
ALTER TABLE [dbo].[transactions]
ADD CONSTRAINT [PK_transactions]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [items] in table 'transactions_items'
ALTER TABLE [dbo].[transactions_items]
ADD CONSTRAINT [PK_transactions_items]
    PRIMARY KEY CLUSTERED ([items] ASC);
GO

-- Creating primary key on [id] in table 'visas'
ALTER TABLE [dbo].[visas]
ADD CONSTRAINT [PK_visas]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'getallorders2'
ALTER TABLE [dbo].[getallorders2]
ADD CONSTRAINT [PK_getallorders2]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [catgory_id] in table 'products'
ALTER TABLE [dbo].[products]
ADD CONSTRAINT [FK__product__catgory__5CD6CB2B]
    FOREIGN KEY ([catgory_id])
    REFERENCES [dbo].[Categories]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__product__catgory__5CD6CB2B'
CREATE INDEX [IX_FK__product__catgory__5CD6CB2B]
ON [dbo].[products]
    ([catgory_id]);
GO

-- Creating foreign key on [customer_id] in table 'customer_address'
ALTER TABLE [dbo].[customer_address]
ADD CONSTRAINT [FK__customer___custo__403A8C7D]
    FOREIGN KEY ([customer_id])
    REFERENCES [dbo].[customers]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__customer___custo__403A8C7D'
CREATE INDEX [IX_FK__customer___custo__403A8C7D]
ON [dbo].[customer_address]
    ([customer_id]);
GO

-- Creating foreign key on [role_id] in table 'customers'
ALTER TABLE [dbo].[customers]
ADD CONSTRAINT [FK__customer__role_i__05D8E0BE]
    FOREIGN KEY ([role_id])
    REFERENCES [dbo].[roles]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__customer__role_i__05D8E0BE'
CREATE INDEX [IX_FK__customer__role_i__05D8E0BE]
ON [dbo].[customers]
    ([role_id]);
GO

-- Creating foreign key on [customer_id] in table 'reviews'
ALTER TABLE [dbo].[reviews]
ADD CONSTRAINT [FK__review__customer__4316F928]
    FOREIGN KEY ([customer_id])
    REFERENCES [dbo].[customers]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__review__customer__4316F928'
CREATE INDEX [IX_FK__review__customer__4316F928]
ON [dbo].[reviews]
    ([customer_id]);
GO

-- Creating foreign key on [customer_id] in table 'transactions'
ALTER TABLE [dbo].[transactions]
ADD CONSTRAINT [FK__transacti__custo__5629CD9C]
    FOREIGN KEY ([customer_id])
    REFERENCES [dbo].[customers]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__transacti__custo__5629CD9C'
CREATE INDEX [IX_FK__transacti__custo__5629CD9C]
ON [dbo].[transactions]
    ([customer_id]);
GO

-- Creating foreign key on [customer_id] in table 'visas'
ALTER TABLE [dbo].[visas]
ADD CONSTRAINT [FK__visa__customer_i__3D5E1FD2]
    FOREIGN KEY ([customer_id])
    REFERENCES [dbo].[customers]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__visa__customer_i__3D5E1FD2'
CREATE INDEX [IX_FK__visa__customer_i__3D5E1FD2]
ON [dbo].[visas]
    ([customer_id]);
GO

-- Creating foreign key on [product_id] in table 'customer_buy_product'
ALTER TABLE [dbo].[customer_buy_product]
ADD CONSTRAINT [FK__customer___produ__4AB81AF0]
    FOREIGN KEY ([product_id])
    REFERENCES [dbo].[products]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__customer___produ__4AB81AF0'
CREATE INDEX [IX_FK__customer___produ__4AB81AF0]
ON [dbo].[customer_buy_product]
    ([product_id]);
GO

-- Creating foreign key on [staff_id] in table 'customer_service'
ALTER TABLE [dbo].[customer_service]
ADD CONSTRAINT [FK__customer___staff__38996AB5]
    FOREIGN KEY ([staff_id])
    REFERENCES [dbo].[staffs]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__customer___staff__38996AB5'
CREATE INDEX [IX_FK__customer___staff__38996AB5]
ON [dbo].[customer_service]
    ([staff_id]);
GO

-- Creating foreign key on [delivery_id] in table 'delivers_location'
ALTER TABLE [dbo].[delivers_location]
ADD CONSTRAINT [FK__delivers___deliv__5165187F]
    FOREIGN KEY ([delivery_id])
    REFERENCES [dbo].[delivers]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__delivers___deliv__5165187F'
CREATE INDEX [IX_FK__delivers___deliv__5165187F]
ON [dbo].[delivers_location]
    ([delivery_id]);
GO

-- Creating foreign key on [delivery_id] in table 'transactions'
ALTER TABLE [dbo].[transactions]
ADD CONSTRAINT [FK__transacti__deliv__5441852A]
    FOREIGN KEY ([delivery_id])
    REFERENCES [dbo].[delivers]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__transacti__deliv__5441852A'
CREATE INDEX [IX_FK__transacti__deliv__5441852A]
ON [dbo].[transactions]
    ([delivery_id]);
GO

-- Creating foreign key on [transaction_id] in table 'orders'
ALTER TABLE [dbo].[orders]
ADD CONSTRAINT [FK__orders__transact__160F4887]
    FOREIGN KEY ([transaction_id])
    REFERENCES [dbo].[transactions]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__orders__transact__160F4887'
CREATE INDEX [IX_FK__orders__transact__160F4887]
ON [dbo].[orders]
    ([transaction_id]);
GO

-- Creating foreign key on [supplier_id] in table 'products'
ALTER TABLE [dbo].[products]
ADD CONSTRAINT [FK__product__supplie__47DBAE45]
    FOREIGN KEY ([supplier_id])
    REFERENCES [dbo].[suppliers]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__product__supplie__47DBAE45'
CREATE INDEX [IX_FK__product__supplie__47DBAE45]
ON [dbo].[products]
    ([supplier_id]);
GO

-- Creating foreign key on [sales_history_id] in table 'transactions'
ALTER TABLE [dbo].[transactions]
ADD CONSTRAINT [FK__transacti__sales__5535A963]
    FOREIGN KEY ([sales_history_id])
    REFERENCES [dbo].[sales_history]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__transacti__sales__5535A963'
CREATE INDEX [IX_FK__transacti__sales__5535A963]
ON [dbo].[transactions]
    ([sales_history_id]);
GO

-- Creating foreign key on [transaction_id] in table 'transactions_items'
ALTER TABLE [dbo].[transactions_items]
ADD CONSTRAINT [FK__transacti__trans__59063A47]
    FOREIGN KEY ([transaction_id])
    REFERENCES [dbo].[transactions]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__transacti__trans__59063A47'
CREATE INDEX [IX_FK__transacti__trans__59063A47]
ON [dbo].[transactions_items]
    ([transaction_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------