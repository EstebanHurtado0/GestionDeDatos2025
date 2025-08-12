USE [GD1C2025]

-- PARTE 1: borrado de tablas, funciones, procedures y esquema
-- PARTE 2: creación de esquema, tablas y fk
-- PARTE 3: creación de funciones
-- PARTE 4: creación de procedures
-- PARTE 5: ejecución de los procedures para migrar los datos


-- PARTE 1: borrado de tablas, funciones, procedures y esquema

-- BORRADO DE TABLAS

IF OBJECT_ID('GRUPO_42.material_x_sillon', 'U') IS NOT NULL DROP TABLE GRUPO_42.material_x_sillon;
IF OBJECT_ID('GRUPO_42.cualidad', 'U') IS NOT NULL DROP TABLE GRUPO_42.cualidad;
IF OBJECT_ID('GRUPO_42.detalle_compra', 'U') IS NOT NULL DROP TABLE GRUPO_42.detalle_compra;
IF OBJECT_ID('GRUPO_42.detalle_factura', 'U') IS NOT NULL DROP TABLE GRUPO_42.detalle_factura;
IF OBJECT_ID('GRUPO_42.detalle_pedido', 'U') IS NOT NULL DROP TABLE GRUPO_42.detalle_pedido;
IF OBJECT_ID('GRUPO_42.envio', 'U') IS NOT NULL DROP TABLE GRUPO_42.envio;
IF OBJECT_ID('GRUPO_42.factura', 'U') IS NOT NULL DROP TABLE GRUPO_42.factura;
IF OBJECT_ID('GRUPO_42.compra', 'U') IS NOT NULL DROP TABLE GRUPO_42.compra;
IF OBJECT_ID('GRUPO_42.pedido_cancelacion', 'U') IS NOT NULL DROP TABLE GRUPO_42.pedido_cancelacion;
IF OBJECT_ID('GRUPO_42.pedido', 'U') IS NOT NULL DROP TABLE GRUPO_42.pedido;
IF OBJECT_ID('GRUPO_42.sillon', 'U') IS NOT NULL DROP TABLE GRUPO_42.sillon;
IF OBJECT_ID('GRUPO_42.modelo', 'U') IS NOT NULL DROP TABLE GRUPO_42.modelo;
IF OBJECT_ID('GRUPO_42.medida', 'U') IS NOT NULL DROP TABLE GRUPO_42.medida;
IF OBJECT_ID('GRUPO_42.material', 'U') IS NOT NULL DROP TABLE GRUPO_42.material;
IF OBJECT_ID('GRUPO_42.tipo_material', 'U') IS NOT NULL DROP TABLE GRUPO_42.tipo_material;
IF OBJECT_ID('GRUPO_42.sucursal', 'U') IS NOT NULL DROP TABLE GRUPO_42.sucursal;
IF OBJECT_ID('GRUPO_42.proveedor', 'U') IS NOT NULL DROP TABLE GRUPO_42.proveedor;
IF OBJECT_ID('GRUPO_42.cliente', 'U') IS NOT NULL DROP TABLE GRUPO_42.cliente;
IF OBJECT_ID('GRUPO_42.localidad', 'U') IS NOT NULL DROP TABLE GRUPO_42.localidad;
IF OBJECT_ID('GRUPO_42.provincia', 'U') IS NOT NULL DROP TABLE GRUPO_42.provincia;

-- BORRADO DE FUNCIONES

IF OBJECT_ID('GRUPO_42.get_provincia_id', 'FN') IS NOT NULL DROP FUNCTION GRUPO_42.get_provincia_id;
IF OBJECT_ID('GRUPO_42.get_localidad_id', 'FN') IS NOT NULL DROP FUNCTION GRUPO_42.get_localidad_id;
IF OBJECT_ID('GRUPO_42.get_cliente_id', 'FN') IS NOT NULL DROP FUNCTION GRUPO_42.get_cliente_id;
IF OBJECT_ID('GRUPO_42.get_proveedor_id', 'FN') IS NOT NULL DROP FUNCTION GRUPO_42.get_proveedor_id;
IF OBJECT_ID('GRUPO_42.get_tipo_material_id', 'FN') IS NOT NULL DROP FUNCTION GRUPO_42.get_tipo_material_id;
IF OBJECT_ID('GRUPO_42.get_material_id', 'FN') IS NOT NULL DROP FUNCTION GRUPO_42.get_material_id;
IF OBJECT_ID('GRUPO_42.get_modelo_id', 'FN') IS NOT NULL DROP FUNCTION GRUPO_42.get_modelo_id;
IF OBJECT_ID('GRUPO_42.get_medida_id', 'FN') IS NOT NULL DROP FUNCTION GRUPO_42.get_medida_id;
IF OBJECT_ID('GRUPO_42.get_detalle_pedido_id', 'FN') IS NOT NULL DROP FUNCTION GRUPO_42.get_detalle_pedido_id;
IF OBJECT_ID('GRUPO_42.get_detalle_factura_id', 'FN') IS NOT NULL DROP FUNCTION GRUPO_42.get_detalle_factura_id;

-- BORRADO DE PROCEDURES

IF OBJECT_ID('GRUPO_42.migrar_provincia', 'P') IS NOT NULL DROP PROCEDURE GRUPO_42.migrar_provincia;
IF OBJECT_ID('GRUPO_42.migrar_localidad', 'P') IS NOT NULL DROP PROCEDURE GRUPO_42.migrar_localidad;
IF OBJECT_ID('GRUPO_42.migrar_sucursal', 'P') IS NOT NULL DROP PROCEDURE GRUPO_42.migrar_sucursal;
IF OBJECT_ID('GRUPO_42.migrar_cliente', 'P') IS NOT NULL DROP PROCEDURE GRUPO_42.migrar_cliente;
IF OBJECT_ID('GRUPO_42.migrar_proveedor', 'P') IS NOT NULL DROP PROCEDURE GRUPO_42.migrar_proveedor;
IF OBJECT_ID('GRUPO_42.migrar_tipo_material', 'P') IS NOT NULL DROP PROCEDURE GRUPO_42.migrar_tipo_material;
IF OBJECT_ID('GRUPO_42.migrar_material', 'P') IS NOT NULL DROP PROCEDURE GRUPO_42.migrar_material;
IF OBJECT_ID('GRUPO_42.migrar_modelo', 'P') IS NOT NULL DROP PROCEDURE GRUPO_42.migrar_modelo;
IF OBJECT_ID('GRUPO_42.migrar_medida', 'P') IS NOT NULL DROP PROCEDURE GRUPO_42.migrar_medida;
IF OBJECT_ID('GRUPO_42.migrar_sillon', 'P') IS NOT NULL DROP PROCEDURE GRUPO_42.migrar_sillon;
IF OBJECT_ID('GRUPO_42.migrar_material_x_sillon', 'P') IS NOT NULL DROP PROCEDURE GRUPO_42.migrar_material_x_sillon;
IF OBJECT_ID('GRUPO_42.migrar_pedido', 'P') IS NOT NULL DROP PROCEDURE GRUPO_42.migrar_pedido;
IF OBJECT_ID('GRUPO_42.migrar_factura', 'P') IS NOT NULL DROP PROCEDURE GRUPO_42.migrar_factura;
IF OBJECT_ID('GRUPO_42.migrar_compra', 'P') IS NOT NULL DROP PROCEDURE GRUPO_42.migrar_compra;
IF OBJECT_ID('GRUPO_42.migrar_detalle_pedido', 'P') IS NOT NULL DROP PROCEDURE GRUPO_42.migrar_detalle_pedido;
IF OBJECT_ID('GRUPO_42.migrar_detalle_compra', 'P') IS NOT NULL DROP PROCEDURE GRUPO_42.migrar_detalle_compra;
IF OBJECT_ID('GRUPO_42.migrar_detalle_factura', 'P') IS NOT NULL DROP PROCEDURE GRUPO_42.migrar_detalle_factura;
IF OBJECT_ID('GRUPO_42.migrar_envio', 'P') IS NOT NULL DROP PROCEDURE GRUPO_42.migrar_envio;
IF OBJECT_ID('GRUPO_42.migrar_pedido_cancelacion', 'P') IS NOT NULL DROP PROCEDURE GRUPO_42.migrar_pedido_cancelacion;
IF OBJECT_ID('GRUPO_42.migrar_cualidad', 'P') IS NOT NULL DROP PROCEDURE GRUPO_42.migrar_cualidad;
IF OBJECT_ID('GRUPO_42.migrar_todo', 'P') IS NOT NULL DROP PROCEDURE GRUPO_42.migrar_todo;

-- BORRADO DE ESQUEMA

IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'GRUPO_42') DROP SCHEMA GRUPO_42
GO

-- PARTE 2: creación de esquema, tablas y fk

-- CREACION DEL ESQUEMA


CREATE SCHEMA GRUPO_42;
GO

-- CREACION DE TABLAS

create table GRUPO_42.cliente(
    cliente_id BIGINT PRIMARY KEY IDENTITY(1,1),
    cliente_provincia_id BIGINT,
    cliente_localidad_id BIGINT,
    cliente_dni BIGINT,
    cliente_nombre VARCHAR(255),
	cliente_apellido VARCHAR(255),
	cliente_fecha_nacimiento datetime,
	cliente_mail VARCHAR(255),
	cliente_direccion VARCHAR(255),
	cliente_telefono VARCHAR(255)
);

create table GRUPO_42.compra(
    compra_numero decimal(18,0) PRIMARY KEY ,
    compra_sucursal_numero BIGINT,
    compra_proveedor_id BIGINT,
    compra_fecha DATETIME,
    compra_total DECIMAL(18, 2)
);

CREATE TABLE GRUPO_42.cualidad(
    cualidad_id BIGINT PRIMARY KEY IDENTITY(1,1),
    cualidad_material_id BIGINT,
    cualidad_nombre VARCHAR(255),
    cualidad_valor VARCHAR(255)
);

create table GRUPO_42.detalle_compra(
    detalle_compra_id BIGINT PRIMARY KEY IDENTITY(1,1),
	detalle_compra_material_id BIGINT,
	detalle_compra_compra_numero DECIMAL(18,0),
	detalle_compra_material_cantidad DECIMAL(18,0),
    detalle_compra_material_precio DECIMAL(18,2),
	detalle_compra_subtotal DECIMAL(18,2)
);

CREATE TABLE GRUPO_42.detalle_factura(
    detalle_factura_id BIGINT PRIMARY KEY IDENTITY(1,1),
    detalle_factura_factura_numero BIGINT,
    detalle_factura_detalle_pedido_id BIGINT,
	detalle_numero BIGINT,
    detalle_factura_cantidad DECIMAL(18, 0),
    detalle_factura_precio_unitario DECIMAL(18, 2),
    detalle_factura_pedido_subtotal DECIMAL(18, 2)
);

CREATE TABLE GRUPO_42.detalle_pedido(
    detalle_pedido_id BIGINT PRIMARY KEY IDENTITY(1,1),
    detalle_pedido_pedido_numero DECIMAL(18, 0),
    detalle_pedido_sillon_id BIGINT,
	detalle_numero BIGINT,
    detalle_pedido_cantidad BIGINT,
    detalle_pedido_precio_unitario DECIMAL(18, 2),
    detalle_pedido_subtotal DECIMAL(18, 2)
);

create table GRUPO_42.envio(
    envio_numero BIGINT PRIMARY KEY ,
    envio_factura_numero BIGINT,
    envio_fecha_programada datetime,
    envio_fecha_entrega datetime,
    envio_importe_traslado DECIMAL(18,2),
	envio_importe_subida DECIMAL(18,2),
	envio_precio DECIMAL(18,2)
);

create table GRUPO_42.factura(
    factura_numero BIGINT PRIMARY KEY ,
    factura_cliente_id BIGINT,
    factura_sucursal_numero BIGINT,
	factura_pedido_numero DECIMAL(18, 0),
    factura_fecha_hora datetime,
    factura_total DECIMAL(38,2)
);

create table GRUPO_42.localidad(
    localidad_id BIGINT PRIMARY KEY IDENTITY(1,1),
    localidad_nombre VARCHAR(255),
    localidad_provincia_id BIGINT
);

create table GRUPO_42.material(
	material_id BIGINT PRIMARY KEY IDENTITY(1,1),
    material_tipo_material_id BIGINT,
	material_nombre VARCHAR(255),
	material_precio DECIMAL(38,2)
);

create table GRUPO_42.material_x_sillon(
    material_x_sillon_sillon_id BIGINT,
    material_x_sillon_material_id BIGINT
);

CREATE TABLE GRUPO_42.medida(
    medida_id BIGINT PRIMARY KEY IDENTITY(1,1),
    medida_profundidad DECIMAL(18,2),
    medida_ancho DECIMAL(18,2),
    medida_alto DECIMAL(18,2),
    medida_precio DECIMAL(18,2)
);

CREATE TABLE GRUPO_42.modelo(
    modelo_id BIGINT PRIMARY KEY ,
    modelo_precio DECIMAL(18,2),
    modelo_descripcion NVARCHAR(255)
);

CREATE TABLE GRUPO_42.pedido(
    pedido_numero DECIMAL(18, 0) PRIMARY KEY,
    pedido_sucursal_numero BIGINT,
    pedido_fecha DATETIME,
    pedido_cliente_id BIGINT,
    pedido_estado VARCHAR(255),
    pedido_total DECIMAL(18, 2)
);

CREATE TABLE GRUPO_42.pedido_cancelacion(
    pedido_cancelacion_id BIGINT PRIMARY KEY IDENTITY(1,1),
    pedido_cancelacion_pedido_numero DECIMAL(18, 0), 
    pedido_cancelacion_fecha DATETIME,
    pedido_cancelacion_motivo VARCHAR(255)
);

create table GRUPO_42.proveedor(
    proveedor_id BIGINT PRIMARY KEY IDENTITY(1,1),
    proveedor_provincia_id BIGINT,
    proveedor_localidad_id BIGINT,
    proveedor_razon_social VARCHAR(255),
    proveedor_cuit VARCHAR(255),
    proveedor_direccion VARCHAR(255),
    proveedor_telefono VARCHAR(255),
    proveedor_mail VARCHAR(255)
);

create table GRUPO_42.provincia(
    provincia_id BIGINT PRIMARY KEY IDENTITY(1,1),
    provincia_nombre VARCHAR(255)
);

CREATE TABLE GRUPO_42.sillon (
    sillon_id BIGINT PRIMARY KEY IDENTITY(1,1),
    sillon_codigo BIGINT,
    sillon_modelo_id BIGINT,
    sillon_medida_id BIGINT,
    sillon_precio DECIMAL(18,2)
);


create table GRUPO_42.sucursal(
    sucursal_numero BIGINT PRIMARY KEY,
    sucursal_provincia_id BIGINT,
    sucursal_localidad_id BIGINT,
    sucursal_direccion VARCHAR(255),
    sucursal_telefono VARCHAR(255),
    sucursal_mail VARCHAR(255)
);

CREATE TABLE GRUPO_42.tipo_material(
    tipo_material_id BIGINT PRIMARY KEY IDENTITY(1,1),
    tipo_material_nombre VARCHAR(255)
);


ALTER TABLE GRUPO_42.localidad
    ADD FOREIGN KEY (localidad_provincia_id) REFERENCES GRUPO_42.provincia(provincia_id);
GO

ALTER TABLE GRUPO_42.cliente
ADD FOREIGN KEY (cliente_provincia_id) REFERENCES GRUPO_42.provincia(provincia_id),
    FOREIGN KEY (cliente_localidad_id) REFERENCES GRUPO_42.localidad(localidad_id);
GO

ALTER TABLE GRUPO_42.proveedor
	ADD FOREIGN KEY(proveedor_provincia_id) REFERENCES GRUPO_42.provincia(provincia_id),
    FOREIGN KEY(proveedor_localidad_id) REFERENCES GRUPO_42.localidad(localidad_id);
GO

ALTER TABLE GRUPO_42.compra
    ADD FOREIGN KEY (compra_sucursal_numero) REFERENCES GRUPO_42.sucursal(sucursal_numero),
    FOREIGN KEY (compra_proveedor_id) REFERENCES GRUPO_42.proveedor(proveedor_id);
GO

ALTER TABLE GRUPO_42.sucursal
    ADD FOREIGN KEY (sucursal_provincia_id) REFERENCES GRUPO_42.provincia(provincia_id),
    FOREIGN KEY (sucursal_localidad_id) REFERENCES GRUPO_42.localidad(localidad_id);
GO

ALTER TABLE GRUPO_42.factura
ADD FOREIGN KEY (factura_cliente_id) REFERENCES GRUPO_42.cliente(cliente_id),
    FOREIGN KEY (factura_sucursal_numero) REFERENCES GRUPO_42.sucursal(sucursal_numero),
    FOREIGN KEY (factura_pedido_numero) REFERENCES GRUPO_42.pedido(pedido_numero);
GO

ALTER TABLE GRUPO_42.material
ADD FOREIGN KEY (material_tipo_material_id) REFERENCES GRUPO_42.tipo_material(tipo_material_id);
GO

ALTER TABLE GRUPO_42.material_x_sillon
    ADD FOREIGN KEY (material_x_sillon_sillon_id) REFERENCES GRUPO_42.sillon(sillon_id),
    FOREIGN KEY (material_x_sillon_material_id) REFERENCES GRUPO_42.material(material_id);
GO

ALTER TABLE GRUPO_42.cualidad
    ADD FOREIGN KEY (cualidad_material_id) REFERENCES GRUPO_42.material(material_id);
GO

ALTER TABLE GRUPO_42.detalle_compra
    ADD FOREIGN KEY (detalle_compra_material_id) REFERENCES GRUPO_42.material(material_id),
    FOREIGN KEY (detalle_compra_compra_numero) REFERENCES GRUPO_42.compra(compra_numero);
GO

ALTER TABLE GRUPO_42.detalle_factura
     ADD FOREIGN KEY (detalle_factura_factura_numero) REFERENCES GRUPO_42.factura(factura_numero),
    FOREIGN KEY (detalle_factura_detalle_pedido_id) REFERENCES GRUPO_42.detalle_pedido(detalle_pedido_id);
GO

ALTER TABLE GRUPO_42.pedido_cancelacion
    ADD FOREIGN KEY (pedido_cancelacion_pedido_numero) REFERENCES GRUPO_42.pedido(pedido_numero);
GO

ALTER TABLE GRUPO_42.pedido
    ADD FOREIGN KEY (pedido_sucursal_numero) REFERENCES GRUPO_42.sucursal(sucursal_numero),
    FOREIGN KEY (pedido_cliente_id) REFERENCES GRUPO_42.cliente(cliente_id);
GO

ALTER TABLE GRUPO_42.detalle_pedido
    ADD FOREIGN KEY (detalle_pedido_pedido_numero) REFERENCES GRUPO_42.pedido(pedido_numero),
    FOREIGN KEY (detalle_pedido_sillon_id) REFERENCES GRUPO_42.sillon(sillon_id);
GO

ALTER TABLE GRUPO_42.sillon
    ADD FOREIGN KEY (sillon_modelo_id) REFERENCES GRUPO_42.modelo(modelo_id),
    FOREIGN KEY (sillon_medida_id) REFERENCES GRUPO_42.medida(medida_id);
GO
ALTER TABLE GRUPO_42.envio
    ADD FOREIGN KEY (envio_factura_numero) REFERENCES GRUPO_42.factura(factura_numero);
GO

-- PARTE 3: creación de funciones

CREATE FUNCTION GRUPO_42.get_provincia_id(@nombre VARCHAR(255)) 
RETURNS BIGINT 
AS
BEGIN
	DECLARE @id BIGINT;
	SELECT @id = provincia_id FROM GRUPO_42.provincia  
    WHERE provincia_nombre = @nombre;
	RETURN @id;
END
GO

CREATE FUNCTION GRUPO_42.get_localidad_id(@nombre VARCHAR(255), @provincia_nombre VARCHAR(255)) 
RETURNS BIGINT 
AS
BEGIN
    DECLARE @provincia_id BIGINT;
	DECLARE @id BIGINT;

    SELECT @provincia_id = GRUPO_42.get_provincia_id(@provincia_nombre);
	SELECT @id = localidad_id FROM GRUPO_42.localidad 
    WHERE localidad_nombre = @nombre 
      AND localidad_provincia_id = @provincia_id;
	RETURN @id;
END
GO

CREATE FUNCTION GRUPO_42.get_cliente_id(@dni BIGINT, @nombre VARCHAR(255), @apellido VARCHAR(255), @provincia_nombre VARCHAR(255), @localidad_nombre VARCHAR(255), @direccion VARCHAR(255))
RETURNS BIGINT
AS
BEGIN
    DECLARE @provincia_id BIGINT = GRUPO_42.get_provincia_id(@provincia_nombre);
    DECLARE @localidad_id BIGINT = GRUPO_42.get_localidad_id(@localidad_nombre, @provincia_nombre);
    DECLARE @id BIGINT;

    SELECT @id = cliente_id FROM GRUPO_42.cliente 
    WHERE cliente_dni = @dni 
      AND cliente_nombre = @nombre 
      AND cliente_apellido = @apellido 
      AND cliente_provincia_id = @provincia_id
      AND cliente_localidad_id = @localidad_id
      AND cliente_direccion = @direccion;    
    RETURN @id;
END
GO

CREATE FUNCTION GRUPO_42.get_proveedor_id(@razon_social VARCHAR(255), @cuit VARCHAR(255), @provincia_nombre VARCHAR(255), @localidad_nombre VARCHAR(255), @direccion VARCHAR(255))
RETURNS BIGINT
AS
BEGIN
    DECLARE @provincia_id BIGINT = GRUPO_42.get_provincia_id(@provincia_nombre);
    DECLARE @localidad_id BIGINT = GRUPO_42.get_localidad_id(@localidad_nombre, @provincia_nombre);
    DECLARE @id BIGINT;

    SELECT @id = proveedor_id
    FROM GRUPO_42.proveedor
    WHERE proveedor_razon_social = @razon_social
      AND proveedor_cuit = @cuit
      AND proveedor_provincia_id = @provincia_id
      AND proveedor_localidad_id = @localidad_id
      AND proveedor_direccion = @direccion;
    RETURN @id;
END
GO

CREATE FUNCTION GRUPO_42.get_tipo_material_id (@nombre VARCHAR(255))
RETURNS BIGINT
AS
BEGIN
    DECLARE @id BIGINT;
    SELECT @id = tipo_material_id 
    FROM GRUPO_42.tipo_material 
    WHERE tipo_material_nombre = @nombre;
    RETURN @id;
END
GO

CREATE FUNCTION GRUPO_42.get_material_id(@nombre VARCHAR(255), @tipo_material_nombre VARCHAR(255))
RETURNS BIGINT
AS
BEGIN
    DECLARE @tipo_material_id BIGINT = GRUPO_42.get_tipo_material_id(@tipo_material_nombre);
    DECLARE @id BIGINT;
    SELECT @id = material_id FROM GRUPO_42.material 
    WHERE material_nombre = @nombre 
      AND material_tipo_material_id = @tipo_material_id;
    RETURN @id;
END
GO

CREATE FUNCTION GRUPO_42.get_medida_id (@profundidad DECIMAL(18,2), @ancho DECIMAL(18,2), @alto DECIMAL(18,2))
RETURNS BIGINT
AS
BEGIN
    DECLARE @id BIGINT;
    SELECT @id = medida_id FROM GRUPO_42.medida 
    WHERE medida_profundidad = @profundidad 
      AND medida_ancho = @ancho 
      AND medida_alto = @alto;
    RETURN @id;
END
GO

CREATE FUNCTION GRUPO_42.get_detalle_pedido_id (
    @pedido_numero DECIMAL(18,0),
    @sillon_id BIGINT,
    @cantidad BIGINT,
    @precio_unitario DECIMAL(18,2)
)
RETURNS BIGINT
AS
BEGIN
    DECLARE @id BIGINT;
    SELECT @id = detalle_pedido_id
    FROM GRUPO_42.detalle_pedido
    WHERE detalle_pedido_pedido_numero = @pedido_numero
      AND detalle_pedido_sillon_id = @sillon_id
      AND detalle_pedido_cantidad = @cantidad
      AND detalle_pedido_precio_unitario = @precio_unitario;
    RETURN @id;
END
GO

CREATE FUNCTION GRUPO_42.get_detalle_factura_id(
    @factura_numero BIGINT,
    @detalle_pedido_id BIGINT,
    @cantidad DECIMAL(18,0),
    @precio_unitario DECIMAL(18,2)
)
RETURNS BIGINT
AS
BEGIN
    DECLARE @id BIGINT;
    SELECT @id = detalle_factura_id
    FROM GRUPO_42.detalle_factura
    WHERE detalle_factura_factura_numero = @factura_numero
      AND detalle_factura_detalle_pedido_id = @detalle_pedido_id
      AND detalle_factura_cantidad = @cantidad
      AND detalle_factura_precio_unitario = @precio_unitario;
    RETURN @id;
END
GO

-- PARTE 4: creación de procedures

-- 1. Provincias
CREATE PROCEDURE GRUPO_42.migrar_provincia
AS
BEGIN
    INSERT INTO GRUPO_42.provincia (provincia_nombre)
    SELECT DISTINCT Sucursal_Provincia FROM gd_esquema.Maestra WHERE Sucursal_Provincia IS NOT NULL
    UNION
    SELECT DISTINCT Cliente_Provincia FROM gd_esquema.Maestra WHERE Cliente_Provincia IS NOT NULL
    UNION
    SELECT DISTINCT Proveedor_Provincia FROM gd_esquema.Maestra WHERE Proveedor_Provincia IS NOT NULL
    EXCEPT
    SELECT provincia_nombre FROM GRUPO_42.provincia;
END
GO

-- 2. Localidades
CREATE PROCEDURE GRUPO_42.migrar_localidad
AS
BEGIN
    -- Sucursal
    INSERT INTO GRUPO_42.localidad (localidad_nombre, localidad_provincia_id)
    SELECT DISTINCT m.Sucursal_Localidad, GRUPO_42.get_provincia_id(m.Sucursal_Provincia)
    FROM gd_esquema.Maestra m
    WHERE m.Sucursal_Localidad IS NOT NULL 
      AND m.Sucursal_Provincia IS NOT NULL
      AND NOT EXISTS (
          SELECT 1 
          FROM GRUPO_42.localidad l
          WHERE l.localidad_nombre = m.Sucursal_Localidad
            AND l.localidad_provincia_id = GRUPO_42.get_provincia_id(m.Sucursal_Provincia)
      );

    -- Cliente
    INSERT INTO GRUPO_42.localidad (localidad_nombre, localidad_provincia_id)
    SELECT DISTINCT m.Cliente_Localidad, GRUPO_42.get_provincia_id(m.Cliente_Provincia)
    FROM gd_esquema.Maestra m
    WHERE m.Cliente_Localidad IS NOT NULL 
      AND m.Cliente_Provincia IS NOT NULL
      AND NOT EXISTS (
          SELECT 1 
          FROM GRUPO_42.localidad l
          WHERE l.localidad_nombre = m.Cliente_Localidad
            AND l.localidad_provincia_id = GRUPO_42.get_provincia_id(m.Cliente_Provincia)
      );

    -- Proveedor
    INSERT INTO GRUPO_42.localidad (localidad_nombre, localidad_provincia_id)
    SELECT DISTINCT m.Proveedor_Localidad, GRUPO_42.get_provincia_id(m.Proveedor_Provincia)
    FROM gd_esquema.Maestra m
    WHERE m.Proveedor_Localidad IS NOT NULL 
      AND m.Proveedor_Provincia IS NOT NULL
      AND NOT EXISTS (
          SELECT 1 
          FROM GRUPO_42.localidad l
          WHERE l.localidad_nombre = m.Proveedor_Localidad
            AND l.localidad_provincia_id = GRUPO_42.get_provincia_id(m.Proveedor_Provincia)
      );
END
GO

-- 3. Sucursal
CREATE PROCEDURE GRUPO_42.migrar_sucursal
AS
BEGIN
    WITH SucursalesUnicas AS (
        SELECT DISTINCT
            Sucursal_NroSucursal,
            Sucursal_Provincia,
            Sucursal_Localidad,
            Sucursal_Direccion,
            Sucursal_telefono,
            Sucursal_mail
        FROM gd_esquema.Maestra
        WHERE Sucursal_NroSucursal IS NOT NULL
    )
    INSERT INTO GRUPO_42.sucursal (
        sucursal_numero,
        sucursal_provincia_id,
        sucursal_localidad_id,
        sucursal_direccion,
        sucursal_telefono,
        sucursal_mail
    )
    SELECT
        s.Sucursal_NroSucursal,
        GRUPO_42.get_provincia_id(s.Sucursal_Provincia),
        GRUPO_42.get_localidad_id(s.Sucursal_Localidad, s.Sucursal_Provincia),
        s.Sucursal_Direccion,
        s.Sucursal_telefono,
        s.Sucursal_mail
    FROM SucursalesUnicas s
    WHERE NOT EXISTS (
        SELECT 1 FROM GRUPO_42.sucursal su
        WHERE su.sucursal_numero = s.Sucursal_NroSucursal
    );
END
GO
    
-- 4. Cliente
CREATE PROCEDURE GRUPO_42.migrar_cliente
AS
BEGIN
    WITH ClientesUnicos AS (
        SELECT DISTINCT
            Cliente_Dni,
            Cliente_Nombre,
            Cliente_Apellido,
            Cliente_Provincia,
            Cliente_Localidad,
            Cliente_FechaNacimiento,
            Cliente_Mail,
            Cliente_Direccion,
            Cliente_Telefono
        FROM gd_esquema.Maestra
        WHERE Cliente_Dni IS NOT NULL
    )
    INSERT INTO GRUPO_42.cliente (
        cliente_provincia_id,
        cliente_localidad_id,
        cliente_dni,
        cliente_nombre,
        cliente_apellido,
        cliente_fecha_nacimiento,
        cliente_mail,
        cliente_direccion,
        cliente_telefono
    )
    SELECT
        GRUPO_42.get_provincia_id(c.Cliente_Provincia),
        GRUPO_42.get_localidad_id(c.Cliente_Localidad, c.Cliente_Provincia),
        c.Cliente_Dni,
        c.Cliente_Nombre,
        c.Cliente_Apellido,
        c.Cliente_FechaNacimiento,
        c.Cliente_Mail,
        c.Cliente_Direccion,
        c.Cliente_Telefono
    FROM ClientesUnicos c
    WHERE NOT EXISTS (
        SELECT 1 FROM GRUPO_42.cliente cl
        WHERE cl.cliente_dni = c.Cliente_Dni
    );
END
GO

-- 5. Proveedor
CREATE PROCEDURE GRUPO_42.migrar_proveedor
AS
BEGIN
    WITH ProveedoresUnicos AS (
        SELECT DISTINCT
            Proveedor_RazonSocial,
            Proveedor_CUIT,
            Proveedor_Provincia,
            Proveedor_Localidad,
            Proveedor_Direccion,
            Proveedor_Telefono,
            Proveedor_Mail
        FROM gd_esquema.Maestra
        WHERE Proveedor_CUIT IS NOT NULL
    )
    INSERT INTO GRUPO_42.proveedor (
        proveedor_provincia_id,
        proveedor_localidad_id,
        proveedor_razon_social,
        proveedor_cuit,
        proveedor_direccion,
        proveedor_telefono,
        proveedor_mail
    )
    SELECT
        GRUPO_42.get_provincia_id(p.Proveedor_Provincia),
        GRUPO_42.get_localidad_id(p.Proveedor_Localidad, p.Proveedor_Provincia),
        p.Proveedor_RazonSocial,
        p.Proveedor_CUIT,
        p.Proveedor_Direccion,
        p.Proveedor_Telefono,
        p.Proveedor_Mail
    FROM ProveedoresUnicos p
    WHERE NOT EXISTS (
        SELECT 1 FROM GRUPO_42.proveedor pr
        WHERE pr.proveedor_cuit = p.Proveedor_CUIT
    );
END
GO

-- 6. Tipo Material
CREATE PROCEDURE GRUPO_42.migrar_tipo_material
AS
BEGIN
    INSERT INTO GRUPO_42.tipo_material (tipo_material_nombre)
    SELECT DISTINCT Material_Tipo
    FROM gd_esquema.Maestra
    WHERE Material_Tipo IS NOT NULL
      AND NOT EXISTS (
          SELECT 1 FROM GRUPO_42.tipo_material tm WHERE tm.tipo_material_nombre = gd_esquema.Maestra.Material_Tipo
      );
END
GO

-- 7. Material 
CREATE PROCEDURE GRUPO_42.migrar_material
AS
BEGIN 
INSERT INTO GRUPO_42.material(material_tipo_material_id, material_nombre, material_precio)
SELECT DISTINCT
    GRUPO_42.get_tipo_material_id(m.Material_Tipo),
    m.Material_Nombre,
    m.Material_Precio
FROM gd_esquema.Maestra m
WHERE m.Material_Nombre IS NOT NULL AND m.Material_Nombre IS NOT NULL
AND NOT EXISTS(
    SELECT 1 FROM GRUPO_42.material mat
    WHERE mat.Material_Nombre = m.Material_Nombre
    AND mat.material_tipo_material_id = GRUPO_42.get_tipo_material_id(m.Material_Tipo)

);
END 
GO

-- 8. Modelo
CREATE PROCEDURE GRUPO_42.migrar_modelo
AS
BEGIN
    INSERT INTO GRUPO_42.modelo (modelo_id, modelo_precio, modelo_descripcion)
    SELECT DISTINCT
        m.Sillon_Modelo_Codigo,
        m.Sillon_Modelo_Precio,
        m.Sillon_Modelo_Descripcion
    FROM gd_esquema.Maestra m
    WHERE m.Sillon_Modelo_Codigo IS NOT NULL
      AND NOT EXISTS (
          SELECT 1 FROM GRUPO_42.modelo mo WHERE mo.modelo_id = m.Sillon_Modelo_Codigo
      );
END
GO

-- 9. Medida
CREATE PROCEDURE GRUPO_42.migrar_medida
AS
BEGIN
    INSERT INTO GRUPO_42.medida (medida_profundidad, medida_ancho, medida_alto, medida_precio)
    SELECT DISTINCT
        m.Sillon_Medida_Profundidad, 
        m.Sillon_Medida_Ancho, 
        m.Sillon_Medida_Alto, 
        m.Sillon_Medida_Precio
    FROM gd_esquema.Maestra m
    WHERE m.Sillon_Medida_Profundidad IS NOT NULL
      AND m.Sillon_Medida_Ancho IS NOT NULL 
      AND m.Sillon_Medida_Alto IS NOT NULL 
      AND NOT EXISTS (
          SELECT 1 
          FROM GRUPO_42.medida med
          WHERE med.Medida_Profundidad = m.Sillon_Medida_Profundidad
            AND med.Medida_Ancho = m.Sillon_Medida_Ancho
            AND med.Medida_Alto = m.Sillon_Medida_Alto 
      );
END
GO

-- 10. Sillon
CREATE PROCEDURE GRUPO_42.migrar_sillon
AS
BEGIN
    ;WITH SillonCombinaciones AS (
        SELECT DISTINCT
            m.Sillon_Codigo,
            m.Sillon_Modelo_Codigo,
            m.Sillon_Medida_Profundidad,
            m.Sillon_Medida_Ancho,
            m.Sillon_Medida_Alto,
            m.Detalle_Pedido_Precio AS Sillon_Precio
        FROM gd_esquema.Maestra m
        WHERE m.Sillon_Codigo IS NOT NULL
          AND m.Sillon_Modelo_Codigo IS NOT NULL
          AND m.Sillon_Medida_Profundidad IS NOT NULL
          AND m.Sillon_Medida_Ancho IS NOT NULL
          AND m.Sillon_Medida_Alto IS NOT NULL
          AND m.Detalle_Pedido_Precio IS NOT NULL
    )
    INSERT INTO GRUPO_42.sillon (
        sillon_codigo,
        sillon_modelo_id,
        sillon_medida_id,
        sillon_precio
    )
    SELECT
        Sillon_Codigo,
        Sillon_Modelo_Codigo,
        GRUPO_42.get_medida_id(Sillon_Medida_Profundidad, Sillon_Medida_Ancho, Sillon_Medida_Alto),
        Sillon_Precio
    FROM SillonCombinaciones
    WHERE NOT EXISTS (
        SELECT 1 FROM GRUPO_42.sillon s
        WHERE s.sillon_codigo = SillonCombinaciones.Sillon_Codigo
          AND s.sillon_modelo_id = SillonCombinaciones.Sillon_Modelo_Codigo
          AND s.sillon_medida_id = GRUPO_42.get_medida_id(SillonCombinaciones.Sillon_Medida_Profundidad, SillonCombinaciones.Sillon_Medida_Ancho, SillonCombinaciones.Sillon_Medida_Alto)
          AND s.sillon_precio = SillonCombinaciones.Sillon_Precio
    );
END
GO

-- 11. Material x Sillon
CREATE PROCEDURE GRUPO_42.migrar_material_x_sillon
AS
BEGIN
    INSERT INTO GRUPO_42.material_x_sillon (material_x_sillon_sillon_id, material_x_sillon_material_id)
    SELECT DISTINCT
        s.sillon_id,
        GRUPO_42.get_material_id(m.Material_Nombre, m.Material_Tipo)
    FROM gd_esquema.Maestra m
    INNER JOIN GRUPO_42.sillon s
      ON s.sillon_codigo = m.Sillon_Codigo
     AND s.sillon_modelo_id = m.Sillon_Modelo_Codigo
     AND s.sillon_medida_id = GRUPO_42.get_medida_id(m.Sillon_Medida_Profundidad, m.Sillon_Medida_Ancho, m.Sillon_Medida_Alto)
     AND s.sillon_precio = m.Detalle_Pedido_Precio
    WHERE m.Sillon_Codigo IS NOT NULL
      AND GRUPO_42.get_material_id(m.Material_Nombre, m.Material_Tipo) IS NOT NULL
      AND NOT EXISTS (
          SELECT 1 
          FROM GRUPO_42.material_x_sillon ms 
          WHERE ms.material_x_sillon_sillon_id = s.sillon_id
            AND ms.material_x_sillon_material_id = GRUPO_42.get_material_id(m.Material_Nombre, m.Material_Tipo)
      );
END
GO

-- 12. Pedido
CREATE PROCEDURE GRUPO_42.migrar_pedido
AS
BEGIN
    INSERT INTO GRUPO_42.pedido (
        pedido_numero,
        pedido_sucursal_numero,
        pedido_fecha,
        pedido_cliente_id,
        pedido_estado,
        pedido_total
    )
    SELECT DISTINCT
        m.Pedido_Numero,
        m.Sucursal_NroSucursal,
        m.Pedido_Fecha,
        GRUPO_42.get_cliente_id(m.Cliente_Dni, m.Cliente_Nombre, m.Cliente_Apellido, m.Cliente_Provincia, m.Cliente_Localidad, m.Cliente_Direccion),
        m.Pedido_Estado,
        m.Pedido_Total
    FROM gd_esquema.Maestra m
    WHERE m.Pedido_Numero IS NOT NULL
      AND NOT EXISTS (
          SELECT 1 
          FROM GRUPO_42.pedido p 
          WHERE p.Pedido_Numero = m.Pedido_Numero
      );
END
GO

-- 13. Factura
CREATE PROCEDURE GRUPO_42.migrar_factura
AS
BEGIN
    WITH FacturasConNumeracion AS (
        SELECT 
            Factura_Numero,
            Cliente_Dni,
            Cliente_Nombre,
            Cliente_Apellido,
            Cliente_Provincia,
            Cliente_Localidad,
            Cliente_Direccion,
            Sucursal_NroSucursal,
            Pedido_Numero,
            Factura_Fecha,
            Factura_Total,
            ROW_NUMBER() OVER (PARTITION BY Factura_Numero ORDER BY Factura_Fecha DESC) AS RowNum
        FROM gd_esquema.Maestra
        WHERE Factura_Numero IS NOT NULL
    )
    INSERT INTO GRUPO_42.factura (
        factura_numero,
        factura_cliente_id,
        factura_sucursal_numero,
        factura_pedido_numero,
        factura_fecha_hora,
        factura_total
    )
    SELECT
        f.Factura_Numero,
        GRUPO_42.get_cliente_id(f.Cliente_Dni, f.Cliente_Nombre, f.Cliente_Apellido, 
                               f.Cliente_Provincia, f.Cliente_Localidad, f.Cliente_Direccion),
        f.Sucursal_NroSucursal,
        f.Pedido_Numero,
        f.Factura_Fecha,
        f.Factura_Total
    FROM FacturasConNumeracion f
    WHERE f.RowNum = 1 
      AND NOT EXISTS (
          SELECT 1 FROM GRUPO_42.factura fa
          WHERE fa.factura_numero = f.Factura_Numero
      );
END
GO

-- 14. Compra
CREATE PROCEDURE GRUPO_42.migrar_compra
AS
BEGIN
    WITH ComprasUnicas AS (
        SELECT DISTINCT
            Compra_Numero,
            Sucursal_NroSucursal,
            Proveedor_RazonSocial,
            Proveedor_CUIT,
            Proveedor_Provincia,
            Proveedor_Localidad,
            Proveedor_Direccion,
            Compra_Fecha,
            Compra_Total
        FROM gd_esquema.Maestra
        WHERE Compra_Numero IS NOT NULL
    )
    INSERT INTO GRUPO_42.compra (
        compra_numero,
        compra_sucursal_numero,
        compra_proveedor_id,
        compra_fecha,
        compra_total
    )
    SELECT
        c.Compra_Numero,
        c.Sucursal_NroSucursal,
        GRUPO_42.get_proveedor_id(c.Proveedor_RazonSocial, c.Proveedor_CUIT, 
                                 c.Proveedor_Provincia, c.Proveedor_Localidad, c.Proveedor_Direccion),
        c.Compra_Fecha,
        c.Compra_Total
    FROM ComprasUnicas c
    WHERE NOT EXISTS (
        SELECT 1 FROM GRUPO_42.compra co
        WHERE co.compra_numero = c.Compra_Numero
    );
END
GO

-- 15. Detalle Pedido
CREATE PROCEDURE GRUPO_42.migrar_detalle_pedido
AS
BEGIN
    WITH DetallesUnicos AS (
    SELECT DISTINCT
        m.Pedido_Numero,
        m.Sillon_Codigo,
        m.Sillon_Modelo_Codigo,
        m.Sillon_Medida_Profundidad,
        m.Sillon_Medida_Ancho,
        m.Sillon_Medida_Alto,
        m.Detalle_Pedido_Cantidad,
        m.Detalle_Pedido_Precio,
        m.Detalle_Pedido_SubTotal
    FROM gd_esquema.Maestra m
    WHERE m.Pedido_Numero IS NOT NULL
      AND m.Sillon_Codigo IS NOT NULL
), DetallesNumerados AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY Pedido_Numero 
            ORDER BY Sillon_Codigo, Detalle_Pedido_Cantidad, Detalle_Pedido_Precio
        ) AS detalle_numero
    FROM DetallesUnicos
)
    INSERT INTO GRUPO_42.detalle_pedido (
        detalle_pedido_pedido_numero,
        detalle_pedido_sillon_id,
        detalle_pedido_cantidad,
        detalle_pedido_precio_unitario,
        detalle_pedido_subtotal,
        detalle_numero
    )
    SELECT
        d.Pedido_Numero,
        s.sillon_id,
        d.Detalle_Pedido_Cantidad,
        d.Detalle_Pedido_Precio,
        d.Detalle_Pedido_SubTotal,
        d.detalle_numero
    FROM DetallesNumerados d
    INNER JOIN GRUPO_42.sillon s 
        ON s.sillon_codigo = d.Sillon_Codigo
        AND s.sillon_modelo_id = d.Sillon_Modelo_Codigo
        AND s.sillon_medida_id = GRUPO_42.get_medida_id(d.Sillon_Medida_Profundidad, d.Sillon_Medida_Ancho, d.Sillon_Medida_Alto)
        AND s.sillon_precio = d.Detalle_Pedido_Precio
    WHERE NOT EXISTS (
        SELECT 1 FROM GRUPO_42.detalle_pedido dp
        WHERE dp.detalle_pedido_pedido_numero = d.Pedido_Numero
          AND dp.detalle_numero = d.detalle_numero
    );
END
GO

-- 16. Detalle Compra 
CREATE PROCEDURE GRUPO_42.migrar_detalle_compra
AS
BEGIN
    WITH DetallesCompraUnicos AS (
        SELECT DISTINCT
            Compra_Numero,
            Material_Nombre,
            Material_Tipo,
            Detalle_Compra_Cantidad,
            Detalle_Compra_Precio,
            Detalle_Compra_SubTotal
        FROM gd_esquema.Maestra
        WHERE Compra_Numero IS NOT NULL
          AND Material_Nombre IS NOT NULL
    )
    INSERT INTO GRUPO_42.detalle_compra (
        detalle_compra_material_id,
        detalle_compra_compra_numero,
        detalle_compra_material_cantidad,
        detalle_compra_material_precio,
        detalle_compra_subtotal
    )
    SELECT
        GRUPO_42.get_material_id(d.Material_Nombre, d.Material_Tipo),
        d.Compra_Numero,
        d.Detalle_Compra_Cantidad,
        d.Detalle_Compra_Precio,
        d.Detalle_Compra_SubTotal
    FROM DetallesCompraUnicos d
    WHERE NOT EXISTS (
        SELECT 1 FROM GRUPO_42.detalle_compra dc
        WHERE dc.detalle_compra_compra_numero = d.Compra_Numero
          AND dc.detalle_compra_material_id = GRUPO_42.get_material_id(d.Material_Nombre, d.Material_Tipo)
    );
END
GO

-- 17. Detalle Factura
CREATE PROCEDURE GRUPO_42.migrar_detalle_factura
AS
BEGIN
    WITH FactDetallesNumerados AS (
        SELECT 
            m.*,
            ROW_NUMBER() OVER (
                PARTITION BY m.Pedido_Numero 
                ORDER BY m.Detalle_Factura_Cantidad, m.Detalle_Factura_Precio
            ) AS detalle_numero
        FROM gd_esquema.Maestra m
        WHERE m.Factura_Numero IS NOT NULL
          AND m.Pedido_Numero IS NOT NULL
          AND m.Detalle_Factura_Precio IS NOT NULL
    )
    INSERT INTO GRUPO_42.detalle_factura (
        detalle_factura_factura_numero,
        detalle_factura_detalle_pedido_id,
        detalle_factura_cantidad,
        detalle_factura_precio_unitario,
        detalle_factura_pedido_subtotal,
        detalle_numero
    )
    SELECT
        Factura_Numero,
        dp.detalle_pedido_id,
        f.Detalle_Factura_Cantidad,
        f.Detalle_Factura_Precio,
        f.Detalle_Factura_SubTotal,
        f.detalle_numero
    FROM FactDetallesNumerados f
    JOIN GRUPO_42.detalle_pedido dp
      ON dp.detalle_pedido_pedido_numero = f.Pedido_Numero
     AND dp.detalle_numero = f.detalle_numero
    WHERE NOT EXISTS (
        SELECT 1 FROM GRUPO_42.detalle_factura df
        WHERE df.detalle_factura_factura_numero = f.Factura_Numero
          AND df.detalle_numero = f.detalle_numero
    );
END
GO

-- 18. Envio 
CREATE PROCEDURE GRUPO_42.migrar_envio
AS
BEGIN
    INSERT INTO GRUPO_42.envio(envio_numero, envio_factura_numero, envio_fecha_programada, envio_fecha_entrega, envio_importe_traslado, envio_importe_subida,envio_precio)
    SELECT DISTINCT
        m.Envio_numero,
        m.Factura_numero,
        m.Envio_Fecha_Programada,
        m.Envio_Fecha,
        m.Envio_ImporteTraslado,
        m.Envio_importeSubida,
        m.Envio_Total
    FROM gd_esquema.Maestra m 
    WHERE m.Envio_numero IS NOT NULL
      AND m.Factura_numero IS NOT NULL
      AND EXISTS (
          SELECT 1 FROM GRUPO_42.factura f WHERE f.factura_numero = m.Factura_numero
      )
      AND NOT EXISTS(
          SELECT 1 FROM GRUPO_42.envio e
          WHERE e.envio_numero = m.Envio_numero
      );
END 
GO

-- 19. Pedido Cancelacion
CREATE PROCEDURE GRUPO_42.migrar_pedido_cancelacion
AS
BEGIN
    INSERT INTO GRUPO_42.pedido_cancelacion (
        pedido_cancelacion_pedido_numero,
        pedido_cancelacion_fecha,
        pedido_cancelacion_motivo
    )
    SELECT DISTINCT
        m.Pedido_Numero,
        m.Pedido_Cancelacion_Fecha,
        m.Pedido_Cancelacion_Motivo
    FROM gd_esquema.Maestra m
    WHERE m.Pedido_Numero IS NOT NULL
      AND m.Pedido_Cancelacion_Fecha IS NOT NULL
      AND m.Pedido_Cancelacion_Motivo IS NOT NULL
      AND NOT EXISTS (
          SELECT 1
          FROM GRUPO_42.pedido_cancelacion pc
          WHERE pc.pedido_cancelacion_pedido_numero =  m.Pedido_Numero
            AND pc.pedido_cancelacion_fecha = m.Pedido_Cancelacion_Fecha
            AND pc.pedido_cancelacion_motivo = m.Pedido_Cancelacion_Motivo
      );
END
GO

-- 20. Cualidad
CREATE PROCEDURE GRUPO_42.migrar_cualidad
AS
BEGIN
    -- TELA COLOR
    INSERT INTO GRUPO_42.cualidad (cualidad_material_id, cualidad_nombre, cualidad_valor)
    SELECT DISTINCT
        mat.material_id,
        'Color',
        m.Tela_Color
    FROM (
        SELECT DISTINCT Material_Nombre, Material_Tipo, Material_Precio, Tela_Color
        FROM gd_esquema.Maestra
        WHERE Tela_Color IS NOT NULL
    ) m
    INNER JOIN GRUPO_42.material mat
        ON mat.material_nombre = m.Material_Nombre
       AND mat.material_tipo_material_id = GRUPO_42.get_tipo_material_id(m.Material_Tipo)
       AND mat.material_precio = m.Material_Precio
    WHERE m.Tela_Color IS NOT NULL
      AND NOT EXISTS (
        SELECT 1 FROM GRUPO_42.cualidad c
        WHERE c.cualidad_material_id = mat.material_id
          AND c.cualidad_nombre = 'Color'
          AND c.cualidad_valor = m.Tela_Color
      );

    -- TELA TEXTURA
    INSERT INTO GRUPO_42.cualidad (cualidad_material_id, cualidad_nombre, cualidad_valor)
    SELECT DISTINCT
        mat.material_id,
        'Textura',
        m.Tela_Textura
    FROM (
        SELECT DISTINCT Material_Nombre, Material_Tipo, Material_Precio, Tela_Textura
        FROM gd_esquema.Maestra
        WHERE Tela_Textura IS NOT NULL
    ) m
    INNER JOIN GRUPO_42.material mat
        ON mat.material_nombre = m.Material_Nombre
       AND mat.material_tipo_material_id = GRUPO_42.get_tipo_material_id(m.Material_Tipo)
       AND mat.material_precio = m.Material_Precio
    WHERE m.Tela_Textura IS NOT NULL
      AND NOT EXISTS (
        SELECT 1 FROM GRUPO_42.cualidad c
        WHERE c.cualidad_material_id = mat.material_id
          AND c.cualidad_nombre = 'Textura'
          AND c.cualidad_valor = m.Tela_Textura
      );

    -- MADERA COLOR
    INSERT INTO GRUPO_42.cualidad (cualidad_material_id, cualidad_nombre, cualidad_valor)
    SELECT DISTINCT
        mat.material_id,
        'Color',
        m.Madera_Color
    FROM (
        SELECT DISTINCT Material_Nombre, Material_Tipo, Material_Precio, Madera_Color
        FROM gd_esquema.Maestra
        WHERE Madera_Color IS NOT NULL
    ) m
    INNER JOIN GRUPO_42.material mat
        ON mat.material_nombre = m.Material_Nombre
       AND mat.material_tipo_material_id = GRUPO_42.get_tipo_material_id(m.Material_Tipo)
       AND mat.material_precio = m.Material_Precio
    WHERE m.Madera_Color IS NOT NULL
      AND NOT EXISTS (
        SELECT 1 FROM GRUPO_42.cualidad c
        WHERE c.cualidad_material_id = mat.material_id
          AND c.cualidad_nombre = 'Color'
          AND c.cualidad_valor = m.Madera_Color
      );

    -- MADERA DUREZA
    INSERT INTO GRUPO_42.cualidad (cualidad_material_id, cualidad_nombre, cualidad_valor)
    SELECT DISTINCT
        mat.material_id,
        'Dureza',
        m.Madera_Dureza
    FROM (
        SELECT DISTINCT Material_Nombre, Material_Tipo, Material_Precio, Madera_Dureza
        FROM gd_esquema.Maestra
        WHERE Madera_Dureza IS NOT NULL
    ) m
    INNER JOIN GRUPO_42.material mat
        ON mat.material_nombre = m.Material_Nombre
       AND mat.material_tipo_material_id = GRUPO_42.get_tipo_material_id(m.Material_Tipo)
       AND mat.material_precio = m.Material_Precio
    WHERE m.Madera_Dureza IS NOT NULL
      AND NOT EXISTS (
        SELECT 1 FROM GRUPO_42.cualidad c
        WHERE c.cualidad_material_id = mat.material_id
          AND c.cualidad_nombre = 'Dureza'
          AND c.cualidad_valor = m.Madera_Dureza
      );

    -- RELLENO DENSIDAD
    INSERT INTO GRUPO_42.cualidad (cualidad_material_id, cualidad_nombre, cualidad_valor)
    SELECT DISTINCT
        mat.material_id,
        'Densidad',
        CAST(m.Relleno_Densidad AS VARCHAR(255))
    FROM (
        SELECT DISTINCT Material_Nombre, Material_Tipo, Material_Precio, Relleno_Densidad
        FROM gd_esquema.Maestra
        WHERE Relleno_Densidad IS NOT NULL
    ) m
    INNER JOIN GRUPO_42.material mat
        ON mat.material_nombre = m.Material_Nombre
       AND mat.material_tipo_material_id = GRUPO_42.get_tipo_material_id(m.Material_Tipo)
       AND mat.material_precio = m.Material_Precio
    WHERE m.Relleno_Densidad IS NOT NULL
      AND NOT EXISTS (
        SELECT 1 FROM GRUPO_42.cualidad c
        WHERE c.cualidad_material_id = mat.material_id
          AND c.cualidad_nombre = 'Densidad'
          AND c.cualidad_valor = CAST(m.Relleno_Densidad AS VARCHAR(255))
      );

END
GO

-- TODO
CREATE PROCEDURE GRUPO_42.migrar_todo
AS
BEGIN
    SET NOCOUNT ON;
    EXEC GRUPO_42.migrar_provincia;
    EXEC GRUPO_42.migrar_localidad;
    EXEC GRUPO_42.migrar_sucursal;
    EXEC GRUPO_42.migrar_cliente;
    EXEC GRUPO_42.migrar_proveedor;
    EXEC GRUPO_42.migrar_tipo_material;
    EXEC GRUPO_42.migrar_material;
    EXEC GRUPO_42.migrar_modelo;
    EXEC GRUPO_42.migrar_medida;
    EXEC GRUPO_42.migrar_sillon;
    EXEC GRUPO_42.migrar_material_x_sillon;
    EXEC GRUPO_42.migrar_pedido;
    EXEC GRUPO_42.migrar_factura;
    EXEC GRUPO_42.migrar_compra;
    EXEC GRUPO_42.migrar_detalle_pedido;
    EXEC GRUPO_42.migrar_detalle_compra;
    EXEC GRUPO_42.migrar_detalle_factura;
    EXEC GRUPO_42.migrar_envio;
    EXEC GRUPO_42.migrar_pedido_cancelacion;
    EXEC GRUPO_42.migrar_cualidad;
END
GO

-- PARTE 5: ejecución de los procedures para migrar los datos
EXEC GRUPO_42.migrar_todo;