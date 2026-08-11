-- Proyecto: Streaming Platform Analytics (Netflix Content)
-- Archivo: 01_netflix_content_transformation.sql

WITH netflix_transformed AS (
  SELECT
    type,
    title,
    director_clean,
    country,
    release_year,
    rating,
    
    -- Conversión segura de STRING a INT64
    SAFE_CAST(duration_num AS INT64) AS duration_num_clean

  FROM
    `ecommerce-analytics-shopee.shopee_ecommerce_analytics.netflix_titles`
),

categorized AS (
  SELECT
    *,
    -- Clasificación de películas y series usando la columna numérica convertida
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
