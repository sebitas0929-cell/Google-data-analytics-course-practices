# 📉 Análisis de Rentabilidad y Política de Descuentos: Retail Superstore

## 📌 Resumen Ejecutivo
Análisis exploratorio y diagnóstico financiero sobre el conjunto de datos comercial Superstore (~10k transacciones) para identificar las causas de la pérdida operativa en la región **Central**. Se diseñó una matriz de rentabilidad con tablas dinámicas, segmentadores y gráficos de divergencia para formular una política de control de descuentos (*Discount Cap*).

---

## 📐 Metodología Aplicada (Ciclo de Vida de Google)

### 1. Preguntar (Ask)
- **Problema de Negocio:** A pesar de registrar un alto volumen de ventas en la región Central, la operación presenta márgenes negativos constantes en subcategorías clave.
- **Objetivo:** Determinar qué categorías concentran las pérdidas financieras y evaluar la correlación entre la tasa de descuento comercial y la rentabilidad neta.

### 2. Preparar (Prepare)
- **Origen de Datos:** Superstore Dataset (Kaggle / Tableau Community).
- **Estructura:** Datos transaccionales a nivel de línea de orden que incluyen dimensiones geográficas (`Region`), de producto (`Category`, `Sub-Category`), clientes (`Segment`) y métricas financieras (`Sales`, `Quantity`, `Discount`, `Profit`).

### 3. Procesar (Process)
- **Saneamiento Estructural:** Corrección de delimitadores y alineación de columnas numéricas desplazadas (`Sales`, `Quantity`, `Discount`, `Profit`).
- **Estandarización de Tipos:** Conversión de texto a valores numéricos continuos y configuración regional para preservación de decimales.
- **Ingeniería de Características:** Creación de la métrica a nivel fila `Profit_Margin = Profit / Sales` para agregación promedio en reportes.

### 4. Analizar (Analyze)
- **Matriz de Rentabilidad:** Agrupación multivariable por `Region`, `Sub-Category` y `Segment` con formato condicional para identificar valores en pérdida.
- **Diagnóstico de Causa Raíz:** Evaluación del descuento medio (`AVERAGE of Discount`):
  - **Región Central:** Subcategorías como `Appliances` (44.9% de descuento promedio) y `Binders` (50.9%) generan pérdidas sistemáticas (`-$12.7k` y `-$1.0k`). En la categoría *Furniture*, `Furnishings` y `Tables` presentan descuentos del 41.1% y 31.2% resultando en pérdidas de `-$1.4k` y `-$3.9k`.
  - **Otras Regiones (East, West, South):** Mantienen descuentos promedio $\le 16\%$, logrando márgenes operativos positivos.

---

## 📊 5. Compartir (Share)
- **Visualización:** Gráfico de divergencia de beneficios (`SUM of Profit`) con línea base en $0.00 que evidencia de forma inmediata el rendimiento de las 17 subcategorías.
- **Interactividad:** Integración de Segmentadores de Datos (*Slicers*) por `Category` y `Segment` para aislamiento y auditoría de métricas en tiempo real.

---

## 🎯 6. Actuar (Act - Recomendaciones Estratégicas)
1. **Política de Tope de Descuentos (*Discount Cap*):** Limitar el descuento máximo permitido al **15% - 20%** en las categorías de *Furniture* y *Office Supplies* para la región Central.
2. **Reestructuración Comercial:** Eliminar las promociones agresivas (>40%) en `Appliances`, `Binders` y `Tables`, permitiendo recuperar el margen operativo regional sin afectar el volumen orgánico rentable.
