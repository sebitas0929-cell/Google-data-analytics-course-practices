-- =============================================================================
-- PROYECTO: Análisis de Ventas E-Commerce (Shopee)
-- FASE 2: Consultas Analíticas en Google BigQuery
-- TABLA ORIGEN: `ecommerce-analytics-shopee.shopee_ecommerce_analytics.stg_shopee_products_v1`
-- =============================================================================

-- -----------------------------------------------------------------------------
-- 1. Top 5 Categorías con Mayor Facturación Estimada
-- Identifica las categorías que aportan el mayor volumen de ventas e ingresos.
-- -----------------------------------------------------------------------------
SELECT 
  Product_Category,
  SUM(Ventas_Limpias) AS Unidades_Totales_Vendidas,
  ROUND(SUM(Estimado_Ingresos_Totales), 2) AS Ingresos_Totales_RM
FROM `ecommerce-analytics-shopee.shopee_ecommerce_analytics.stg_shopee_products_v1`
GROUP BY Product_Category
ORDER BY Ingresos_Totales_RM DESC
LIMIT 5;

-- -----------------------------------------------------------------------------
-- 2. Concentración Geográfica de Facturación (Top Regiones)
-- Analiza la distribución de ingresos y cantidad de productos ofertados por estado.
-- -----------------------------------------------------------------------------
SELECT 
  Product_Place,
  COUNT(Product_Name) AS Cantidad_Productos,
  SUM(Ventas_Limpias) AS Unidades_Vendidas,
  ROUND(SUM(Estimado_Ingresos_Totales), 2) AS Ingresos_Totales_RM
FROM `ecommerce-analytics-shopee.shopee_ecommerce_analytics.stg_shopee_products_v1`
WHERE Product_Place IS NOT NULL
GROUP BY Product_Place
ORDER BY Ingresos_Totales_RM DESC
LIMIT 5;

-- -----------------------------------------------------------------------------
-- 3. Ticket Promedio y Precio Máximo por Categoría
-- Muestra el precio base promedio de las categorías para entender la gama de productos.
-- -----------------------------------------------------------------------------
SELECT 
  Product_Category,
  ROUND(AVG(Precio_Limpio), 2) AS Precio_Promedio_RM,
  MAX(Precio_Limpio) AS Precio_Maximo_RM
FROM `ecommerce-analytics-shopee.shopee_ecommerce_analytics.stg_shopee_products_v1`
GROUP BY Product_Category
ORDER BY Precio_Promedio_RM DESC
LIMIT 5;
