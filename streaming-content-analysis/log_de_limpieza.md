# Bitácora de Limpieza y Transformación: Netflix Streaming Content

## 📌 Contexto del Proyecto
Este proyecto aborda la preparación y estructuración de un conjunto de datos sobre películas y series de TV de Netflix (`netflix_titles.csv`), aplicando técnicas de limpieza en Google Sheets e ingerir la información procesada en Google BigQuery para análisis clasificatorio en SQL.

---

## 🛠️ Fase 1: Limpieza e Ingeniería de Datos en Google Sheets

1. **Estandarización de Directores (`director_clean`)**:
   - **Problema**: Presencia de múltiples campos nulos o vacíos en la columna `director`.
   - **Solución**: Se aplicó la función `=SI(ESBLANCO(D2); "Sin Director Registrado"; ESPACIOS(D2))` para evitar valores nulos al agrupar.

2. **Extracción Numérica de Duración (`duration_num`)**:
   - **Problema**: La columna original mezclaba unidades (`min` y `Seasons`) con datos numéricos.
   - **Solución**: Extracción de dígitos enteros mediante expresiones regulares: `=SI.ERROR(VALOR(REGEXEXTRACT(K2; "\d+")); 0)`.

3. **Saneamiento de Cadenas de Texto (`date_added_clean`)**:
   - **Problema**: Espacios adicionales al inicio y final en la columna de fechas.
   - **Solución**: Limpieza de espacios con la función `=ESPACIOS(H2)`.

---

## 💻 Fase 2: Clasificación y Transformación en SQL (BigQuery)

Se ejecutó la consulta de transformación para mapear los tipos de contenido y convertirlos en categorías de negocio:

```sql
WITH netflix_transformed AS (
  SELECT
    type,
    title,
    director_clean,
    country,
    release_year,
    rating,
    SAFE_CAST(duration_num AS INT64) AS duration_num_clean
  FROM
    `ecommerce-analytics-shopee.shopee_ecommerce_analytics.netflix_titles`
),
categorized AS (
  SELECT
    *,
    CASE 
      WHEN type = 'Movie' AND duration_num_clean < 40 THEN 'Cortometraje (<40 min)'
      WHEN type = 'Movie' AND duration_num_clean BETWEEN 40 AND 120 THEN 'Duración Estándar (40-120 min)'
      WHEN type = 'Movie' AND duration_num_clean > 120 THEN 'Larga Duración (>120 min)'
      WHEN type = 'TV Show' AND duration_num_clean = 1 THEN '1 Temporada'
      WHEN type = 'TV Show' AND duration_num_clean > 1 THEN 'Multitemporada (>1 Temp)'
      ELSE 'Sin Clasificar'
    END AS categoria_duracion
  FROM
    netflix_transformed
)
SELECT
  type,
  categoria_duracion,
  COUNT(*) AS total_titulos,
  ROUND(AVG(duration_num_clean), 1) AS promedio_duracion_num
FROM
  categorized
GROUP BY
  type,
  categoria_duracion
ORDER BY
  type,
  total_titulos DESC;
```
### 📊 Hallazgos Principales

Predominio de Películas Estándar: El 78.6% de las películas catalogadas duran entre 40 y 120 minutos, con un promedio general de 92.6 minutos.

Retención en Series: El 67% de las series de TV cuentan únicamente con 1 Temporada, mientras que las series multitemporada promedian 3.3 temporadas.

Calidad de Datos: Se identificaron 3 registros atípicos (0.03%) con datos faltantes de duración, clasificados correctamente dentro del pipeline bajo la etiqueta "Sin Clasificar".

### 📌 Archivos recomendados para esta carpeta en GitHub:

1. `streaming-content-analysis/log_de_limpieza.md` (Este archivo).
2. `streaming-content-analysis/sql/01_netflix_content_transformation.sql` (El script SQL limpio).
