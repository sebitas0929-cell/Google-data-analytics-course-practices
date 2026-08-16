# 🌤️ Análisis Meteorológico de Nueva York (NOAA GSOD) en BigQuery

## 📌 Contexto del Proyecto
Extracción, transformación y materialización de datos meteorológicos históricos del dataset público de la **NOAA** (`bigquery-public-data.noaa_gsod.gsod2020`) para responder consultas climáticas de las estaciones de los aeropuertos **LaGuardia (LGA)** y **John F. Kennedy (JFK)** durante el año 2020.

---

## 🛠️ 1. Extracción, Limpieza de Valores Centinela y Materialización

Para optimizar costos de escaneo y tiempos de respuesta, se extrajo un subconjunto filtrado y saneado (convirtiendo los códigos de error por defecto `9999.9`, `999.9` y `99.99` a `NULL`) directamente en una nueva tabla analítica:

```sql
CREATE OR REPLACE TABLE `ecommerce-analytics-shopee.demos.nyc_weather` AS
SELECT
  stn AS station_id,
  date,
  IF(CAST(temp AS STRING) IN ('9999.9', '999.9', '9999'), NULL, CAST(temp AS FLOAT64)) AS temperature,
  IF(CAST(wdsp AS STRING) IN ('999.9', '99.99', '999'), NULL, CAST(wdsp AS FLOAT64)) AS wind_speed,
  IF(CAST(prcp AS STRING) IN ('99.99', '99.9'), NULL, CAST(prcp AS FLOAT64)) AS precipitation
FROM
  `bigquery-public-data.noaa_gsod.gsod2020`
WHERE
  stn IN ('725030', '744860')
ORDER BY
  date DESC,
  station_id ASC;
```
## 📊 2. Consultas Analíticas y Hallazgos

###  🌡️ Pregunta 1: Temperatura media en Junio de 2020

````sql
SELECT
  ROUND(AVG(temperature), 2) AS avg_temp_june_2020
FROM
  `ecommerce-analytics-shopee.demos.nyc_weather`
WHERE
  date BETWEEN '2020-06-01' AND '2020-06-30';
````
Resultado: 72.88 °F

###  💨 Pregunta 2: Velocidad media del viento en Diciembre de 2020

```sql
SELECT
  ROUND(AVG(wind_speed), 2) AS avg_wind_speed_dec_2020
FROM
  `ecommerce-analytics-shopee.demos.nyc_weather`
WHERE
  date BETWEEN '2020-12-01' AND '2020-12-31';
```
Resultado: 11.08 nudos

###  🛫 Pregunta 3: Comparativa Anual por Estación Meteorológica (LGA vs. JFK)

```sql
SELECT
  station_id,
  CASE
    WHEN station_id = '725030' THEN 'LaGuardia Airport (LGA)'
    WHEN station_id = '744860' THEN 'John F. Kennedy Intl (JFK)'
    ELSE 'Other'
  END AS airport_name,
  ROUND(AVG(temperature), 2) AS avg_temp_fahrenheit,
  ROUND(AVG(wind_speed), 2) AS avg_wind_speed_knots,
  ROUND(SUM(precipitation), 2) AS total_precipitation_inches
FROM
  `ecommerce-analytics-shopee.demos.nyc_weather`
GROUP BY
  station_id;
  ```
| ID Estación | Aeropuerto | Temp. Promedio (°F) | Velocidad Viento Prom. (nudos) | Precipitación Total (pulgadas) |
| :---: | :--- | :---: | :---: | :---: |
| **725030** | LaGuardia Airport (LGA) | 58.28 | 9.16 | 43.55 |
| **744860** | John F. Kennedy Intl (JFK) | 56.06 | 9.96 | 41.62 |

##  💡 Lecciones Clave para Análisis de Datos
Tratamiento de Valores Centinela (Sentinel Values): Identificar códigos técnicos de error (como 9999.9) y convertirlos a NULL antes de calcular promedios evita distorsiones estadísticas graves.

Estrategia Data Mart / Tablas Intermedias: Guardar subconjuntos en tablas dedicadas (demos.nyc_weather) reduce a cero el costo recurrente de escanear el dataset público global.
  
