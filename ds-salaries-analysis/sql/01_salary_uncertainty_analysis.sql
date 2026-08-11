-- Consulta de agregaciones e incertidumbre estadística para ds_salaries
SELECT
  experience_level,
  
  -- 1. Tamaño de la muestra (N)
  COUNT(*) AS muestra_n,
  
  -- 2. Promedio Salarial Anual en USD
  ROUND(AVG(salary_in_usd), 2) AS promedio_salarial,
  
  -- 3. Desviación Estándar Muestral (σ)
  ROUND(STDDEV_SAMP(salary_in_usd), 2) AS desviacion_estandar,
  
  -- 4. Margen de Error al 95% de confianza: Z * (σ / sqrt(N))  donde Z = 1.96
  ROUND(1.96 * (STDDEV_SAMP(salary_in_usd) / SQRT(COUNT(*))), 2) AS margen_error_95,
  
  -- 5. Porcentaje de Incertidumbre Salarial
  ROUND((1.96 * (STDDEV_SAMP(salary_in_usd) / SQRT(COUNT(*)))) / AVG(salary_in_usd) * 100, 2) AS pct_incertidumbre

FROM
  `ecommerce-analytics-shopee.ds_salaries.ds_salaries`

GROUP BY
  experience_level

ORDER BY
  promedio_salarial DESC;
