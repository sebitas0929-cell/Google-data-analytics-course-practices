# 🧋 Bitácora de Limpieza: Tiendas de Té Boba en San Francisco

## 📌 Contexto del Proyecto
Saneamiento y validación de un dataset externo de ubicaciones de tiendas de té boba en San Francisco para preparar un análisis de factibilidad de campaña de marketing geolocalizada en un radio de 16 km.

---

## 🛠️ Procedimiento de Limpieza Paso a Paso

### 1. Eliminación de Duplicados
- **Criterio**: Evaluación sobre los campos clave `id` y `name`.
- **Resultado**: Detección y eliminación de 3 registros duplicados, reduciendo el dataset a 603 registros únicos.

### 2. Detección e Imputación de Outliers (`COUNTIF`)
- **Auditoría**: Se ejecutó `=COUNTIF(C:C, ">5")` identificando 9 tiendas con valoraciones fuera de la escala de Yelp (valores de hasta 9.2).
- **Tratamiento**: Se ordenó el rango de forma descendente por `rating` y se reemplazaron los 9 valores anómalos por la puntuación máxima permitida de la escala (`5.0`).

### 3. Parsing y Estandarización de Coordenadas (`SPLIT`)
- **Descomposición**: Separación de la columna combinada `lat-long` mediante el delimitador `-`.
- **Ajuste Cartográfico**: Multiplicación de la longitud por `-1` (`=G2 * -1`) y estandarización de punto decimal para garantizar coordenadas geográficas legibles (`lat`: `37.xxxx`, `long`: `-122.xxxx`).

---

## 📊 Resultados Obtenidos
- Dataset de 603 tiendas 100% verificado.
- Rango de valoraciones estandarizado estrictamente entre 2.0 y 5.0.
- Coordenadas geográficas `lat` y `long` independizadas, nombradas correctamente y listas para ingesta en Google BigQuery o herramientas GIS.
