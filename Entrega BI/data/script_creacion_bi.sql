-- CREACIÓN DEL ESQUEMA PARA BI SI NO EXISTE
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'DW')
BEGIN
    EXEC('CREATE SCHEMA DW');
END
GO

-- Tablas dimensionales (se mantienen igual)
CREATE TABLE DW.Dim_Tiempo (
    Dimt_fecha_id BIGINT PRIMARY KEY,
    Dimt_fecha_completa DATE,
    Dimt_anio BIGINT,
    Dimt_cuatrimestre BIGINT,
    Dimt_mes BIGINT,
    Dimt_dia BIGINT,
    Dimt_nombre_mes VARCHAR(255)
);
GO

CREATE TABLE DW.Dim_Ubicacion (
    Dimu_ubicacion_id BIGINT PRIMARY KEY,
    Dimu_provincia VARCHAR(255),
    Dimu_localidad VARCHAR(255)
);
GO

CREATE TABLE DW.Dim_Cliente (
    Dimcl_cliente_id BIGINT PRIMARY KEY,
    Dimcl_nombre VARCHAR(255),
    Dimcl_apellido VARCHAR(255),
    Dimcl_rango_etario VARCHAR(255)
);
GO

CREATE TABLE DW.Dim_Turno (
    Dimtur_turno_id BIGINT PRIMARY KEY,
    Dimtur_descripcion VARCHAR(250), -- Ej: "08:00 - 14:00"
    Dimtur_hora_inicio TIME,
    Dimtur_hora_fin TIME
);
GO

CREATE TABLE DW.Dim_Material (
    Dimm_material_id BIGINT PRIMARY KEY,
    Dimm_tipo_material VARCHAR(255), -- tela, madera, relleno
    Dimm_nombre_material VARCHAR(255)
);
GO

CREATE TABLE DW.Dim_Modelo_Sillon (
    Dimms_modelo_id BIGINT PRIMARY KEY,
    Dimms_modelo_nombre VARCHAR(250),
    Dimms_descripcion VARCHAR(250),
    Dimms_dimensiones VARCHAR(250)
);
GO

CREATE TABLE DW.Dim_Estado_Pedido (
    Dimep_estado_id BIGINT PRIMARY KEY,
    Dimep_estado VARCHAR(255)
);
GO

CREATE TABLE DW.Hecho_Venta (
    Hv_id BIGINT PRIMARY KEY IDENTITY(1,1),
    Hv_fecha_id BIGINT FOREIGN KEY REFERENCES DW.Dim_Tiempo(Dimt_fecha_id),
    Hv_ubicacion_id BIGINT FOREIGN KEY REFERENCES DW.Dim_Ubicacion(Dimu_ubicacion_id),
    Hv_cliente_id BIGINT FOREIGN KEY REFERENCES DW.Dim_Cliente(Dimcl_cliente_id),
    Hv_turno_id BIGINT FOREIGN KEY REFERENCES DW.Dim_Turno(Dimtur_turno_id),
    Hv_material_id BIGINT FOREIGN KEY REFERENCES DW.Dim_Material(Dimm_material_id),
    Hv_modelo_id BIGINT FOREIGN KEY REFERENCES DW.Dim_Modelo_Sillon(Dimms_modelo_id),
    Hv_estado_id BIGINT FOREIGN KEY REFERENCES DW.Dim_Estado_Pedido(Dimep_estado_id),
    Hv_cantidad BIGINT,
    Hv_total DECIMAL(8,2)
);
GO

-- ============================================
-- VISTAS DE CADA PUNTO DEL ENUNCIADO
-- ============================================

-- 1) Ganancias mensuales
CREATE VIEW GRUPO_42.vw_ganancias_mensuales AS
SELECT 
    s.sucursal_numero,
    FORMAT(f.factura_fecha_hora, 'yyyy-MM') AS periodo,
    SUM(f.factura_total) AS ingresos,
    SUM(c.compra_total) AS egresos
FROM GRUPO_42.sucursal s
LEFT JOIN GRUPO_42.factura f ON f.factura_sucursal_numero = s.sucursal_numero
LEFT JOIN GRUPO_42.compra c ON c.compra_sucursal_numero = s.sucursal_numero 
    AND FORMAT(c.compra_fecha, 'yyyy-MM') = FORMAT(f.factura_fecha_hora, 'yyyy-MM')
GROUP BY s.sucursal_numero, FORMAT(f.factura_fecha_hora, 'yyyy-MM');
GO

-- 2) Factura promedio mensual
CREATE VIEW GRUPO_42.vw_factura_promedio_mensual AS
SELECT 
    p.provincia_nombre,
    DATEPART(YEAR, f.factura_fecha_hora) AS anio,
    CEILING(DATEPART(MONTH, f.factura_fecha_hora)/4.0) AS cuatrimestre,
    AVG(f.factura_total) AS factura_promedio
FROM GRUPO_42.factura f
JOIN GRUPO_42.sucursal s ON f.factura_sucursal_numero = s.sucursal_numero
JOIN GRUPO_42.provincia p ON s.sucursal_provincia_id = p.provincia_id
GROUP BY p.provincia_nombre, DATEPART(YEAR, f.factura_fecha_hora), CEILING(DATEPART(MONTH, f.factura_fecha_hora)/4.0);
GO

-- 3) Top modelos por cuatrimestre (versión corregida)
CREATE VIEW GRUPO_42.vw_top_modelos_por_cuatrimestre AS
WITH ventas_modelos AS (
    SELECT 
        m.modelo_id,
        l.localidad_nombre,
        DATEPART(YEAR, f.factura_fecha_hora) AS anio,
        CEILING(DATEPART(MONTH, f.factura_fecha_hora)/4.0) AS cuatrimestre,
        c.cliente_fecha_nacimiento,
        DATEDIFF(YEAR, c.cliente_fecha_nacimiento, GETDATE()) AS edad,
        COUNT(*) AS cantidad_ventas
    FROM GRUPO_42.factura f
    JOIN GRUPO_42.detalle_factura df ON df.detalle_factura_factura_numero = f.factura_numero
    JOIN GRUPO_42.detalle_pedido dp ON dp.detalle_pedido_id = df.detalle_factura_detalle_pedido_id
    JOIN GRUPO_42.sillon s ON dp.detalle_pedido_sillon_id = s.sillon_id
    JOIN GRUPO_42.modelo m ON s.sillon_modelo_id = m.modelo_id
    JOIN GRUPO_42.cliente c ON f.factura_cliente_id = c.cliente_id
    JOIN GRUPO_42.localidad l ON c.cliente_localidad_id = l.localidad_id
    GROUP BY m.modelo_id, l.localidad_nombre, f.factura_fecha_hora, c.cliente_fecha_nacimiento
)
SELECT TOP 3 WITH TIES
    modelo_id, localidad_nombre, anio, cuatrimestre,
    CASE 
        WHEN edad < 25 THEN '<25'
        WHEN edad BETWEEN 25 AND 35 THEN '25-35'
        WHEN edad BETWEEN 36 AND 50 THEN '36-50'
        ELSE '>50'
    END AS rango_etario,
    cantidad_ventas
FROM ventas_modelos
ORDER BY ROW_NUMBER() OVER (PARTITION BY localidad_nombre, anio, cuatrimestre, 
                             CASE 
                                WHEN edad < 25 THEN '<25'
                                WHEN edad BETWEEN 25 AND 35 THEN '25-35'
                                WHEN edad BETWEEN 36 AND 50 THEN '36-50'
                                ELSE '>50'
                             END
                           ORDER BY cantidad_ventas DESC);
GO

-- 4) Volumen de pedidos por turno
CREATE VIEW GRUPO_42.vw_volumen_pedidos_turno AS
SELECT 
    s.sucursal_numero,
    FORMAT(p.pedido_fecha, 'yyyy-MM') AS periodo,
    CASE 
        WHEN DATEPART(HOUR, f.factura_fecha_hora) BETWEEN 6 AND 13 THEN 'Mañana'
        WHEN DATEPART(HOUR, f.factura_fecha_hora) BETWEEN 14 AND 21 THEN 'Tarde'
        ELSE 'Noche'
    END AS turno,
    COUNT(DISTINCT p.pedido_numero) AS cantidad_pedidos
FROM GRUPO_42.pedido p
JOIN GRUPO_42.factura f ON p.pedido_numero = f.factura_pedido_numero
JOIN GRUPO_42.sucursal s ON p.pedido_sucursal_numero = s.sucursal_numero
GROUP BY s.sucursal_numero, FORMAT(p.pedido_fecha, 'yyyy-MM'), 
    CASE 
        WHEN DATEPART(HOUR, f.factura_fecha_hora) BETWEEN 6 AND 13 THEN 'Mañana'
        WHEN DATEPART(HOUR, f.factura_fecha_hora) BETWEEN 14 AND 21 THEN 'Tarde'
        ELSE 'Noche'
    END;
GO

-- 5) Conversión de pedidos
CREATE VIEW GRUPO_42.vw_conversion_pedidos AS
SELECT 
    s.sucursal_numero,
    DATEPART(YEAR, p.pedido_fecha) AS anio,
    CEILING(DATEPART(MONTH, p.pedido_fecha)/4.0) AS cuatrimestre,
    p.pedido_estado,
    COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY s.sucursal_numero, DATEPART(YEAR, p.pedido_fecha), CEILING(DATEPART(MONTH, p.pedido_fecha)/4.0)) AS porcentaje
FROM GRUPO_42.pedido p
JOIN GRUPO_42.sucursal s ON p.pedido_sucursal_numero = s.sucursal_numero
GROUP BY s.sucursal_numero, DATEPART(YEAR, p.pedido_fecha), CEILING(DATEPART(MONTH, p.pedido_fecha)/4.0), p.pedido_estado;
GO

-- 6) Tiempo promedio de fabricación
CREATE VIEW GRUPO_42.vw_tiempo_promedio_fabricacion AS
SELECT 
    s.sucursal_numero,
    DATEPART(YEAR, f.factura_fecha_hora) AS anio,
    CEILING(DATEPART(MONTH, f.factura_fecha_hora)/4.0) AS cuatrimestre,
    AVG(DATEDIFF(DAY, p.pedido_fecha, f.factura_fecha_hora)) AS tiempo_promedio_dias
FROM GRUPO_42.factura f
JOIN GRUPO_42.pedido p ON f.factura_pedido_numero = p.pedido_numero
JOIN GRUPO_42.sucursal s ON f.factura_sucursal_numero = s.sucursal_numero
GROUP BY s.sucursal_numero, DATEPART(YEAR, f.factura_fecha_hora), CEILING(DATEPART(MONTH, f.factura_fecha_hora)/4.0);
GO

-- 7) Promedio de compras
CREATE VIEW GRUPO_42.vw_promedio_compras AS
SELECT 
    FORMAT(compra_fecha, 'yyyy-MM') AS periodo,
    AVG(compra_total) AS promedio_compras
FROM GRUPO_42.compra
GROUP BY FORMAT(compra_fecha, 'yyyy-MM');
GO

-- 8) Compras por tipo de material
CREATE VIEW GRUPO_42.vw_compras_por_tipo_material AS
SELECT 
    s.sucursal_numero,
    tm.tipo_material_nombre,
    DATEPART(YEAR, c.compra_fecha) AS anio,
    CEILING(DATEPART(MONTH, c.compra_fecha)/4.0) AS cuatrimestre,
    SUM(dc.detalle_compra_subtotal) AS total_gastado
FROM GRUPO_42.detalle_compra dc
JOIN GRUPO_42.compra c ON c.compra_numero = dc.detalle_compra_compra_numero
JOIN GRUPO_42.sucursal s ON c.compra_sucursal_numero = s.sucursal_numero
JOIN GRUPO_42.material m ON dc.detalle_compra_material_id = m.material_id
JOIN GRUPO_42.tipo_material tm ON m.material_tipo_material_id = tm.tipo_material_id
GROUP BY s.sucursal_numero, tm.tipo_material_nombre, DATEPART(YEAR, c.compra_fecha), CEILING(DATEPART(MONTH, c.compra_fecha)/4.0);
GO

-- 9) Cumplimiento de envíos
CREATE VIEW GRUPO_42.vw_cumplimiento_envios AS
SELECT 
    FORMAT(e.envio_fecha_programada, 'yyyy-MM') AS periodo,
    COUNT(CASE WHEN e.envio_fecha_entrega <= e.envio_fecha_programada THEN 1 END) * 100.0 / COUNT(*) AS porcentaje_cumplido
FROM GRUPO_42.envio e
GROUP BY FORMAT(e.envio_fecha_programada, 'yyyy-MM');
GO

-- 10) Top 3 localidades con mayor costo de envío
CREATE VIEW GRUPO_42.vw_top3_localidades_envio AS
SELECT TOP 3
    l.localidad_nombre,
    AVG(e.envio_precio) AS promedio_envio
FROM GRUPO_42.envio e
JOIN GRUPO_42.factura f ON e.envio_factura_numero = f.factura_numero
JOIN GRUPO_42.cliente c ON f.factura_cliente_id = c.cliente_id
JOIN GRUPO_42.localidad l ON c.cliente_localidad_id = l.localidad_id
GROUP BY l.localidad_nombre
ORDER BY AVG(e.envio_precio) DESC;
GO