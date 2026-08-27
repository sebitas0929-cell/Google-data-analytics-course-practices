# 🎬 Análisis de Catálogo y Clasificación de Contenido: Netflix Streaming

## 📌 Resumen Ejecutivo
Este proyecto aborda el saneamiento, categorización y visualización del catálogo de películas y series de Netflix (`netflix_titles.csv`). El objetivo principal fue depurar inconsistencias de formatos y tipos de datos en Google Sheets, procesar reglas de clasificación y agregaciones de negocio en Google BigQuery (SQL), y diseñar un dashboard ejecutivo interactivo en Tableau Public[cite: 1, 4].

---

## 🛠️ Fase 1: Limpieza e Ingeniería de Datos en Google Sheets

1. **Estandarización de Directores (`director_clean`)**:
   - **Problema**: Presencia de múltiples celdas vacías o nulas en la columna `director`.
   - **Solución**: Aplicación de la fórmula `=SI(ESBLANCO(D2); "Sin Director Registrado"; ESPACIOS(D2))` para garantizar integridad en agrupaciones posteriores.

2. **Extracción Numérica de Duración (`duration_num`)**:
   - **Problema**: La columna original combinaba unidades de texto (`min` y `Seasons`) con cifras numéricas.
   - **Solución**: Extracción de dígitos enteros mediante expresiones regulares: `=SI.ERROR(VALOR(REGEXEXTRACT(K2; "\d+")); 0)`[cite: 1].

3. **Saneamiento de Fechas (`date_added_clean`)**:
   - **Problema**: Cadenas de texto con espacios adicionales al inicio y final[cite: 1].
   - **Solución**: Normalización de espacios con la función `=ESPACIOS(H2)`[cite: 1].

---

## 💻 Fase 2: Clasificación y Transformación en SQL (BigQuery)

Se ejecutó la siguiente consulta modular para transformar los registros numéricos y categorizar el metraje en segmentos de catálogo[cite: 1]:

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
## 📊 Fase 3: Hallazgos Principales (Insights)

* **Predominio de Películas Estándar:** El 78.6% de las películas catalogadas tienen una duración entre 40 y 120 minutos, con un promedio general de 92.6 minutos[cite: 1].

* **Retención en Series de TV:** El 67% de las series cuentan únicamente con 1 Temporada (1,793 títulos), mientras que las series multitemporada promedian 3.3 temporadas[cite: 1].

* **Pico Histórico de Producción:** El volumen de estrenos aceleró significativamente a partir de 2015, alcanzando su punto máximo entre 2017 y 2019 antes de desacelerar levemente en lanzamientos de largometrajes.

* **Calidad de Datos:** Se aislaron 3 registros atípicos (0.03%) con datos faltantes de metraje, contenidos de forma controlada bajo la etiqueta "Sin Clasificar"[cite: 1].

## 📈 Fase 4: Compartir (Dashboard Ejecutivo en Tableau)
Se construyó un dashboard interactivo en Tableau Public que consolida el análisis de catálogo y su comportamiento histórico:

* **Distribución por Categoría de Duración:** Gráfico de barras horizontales segmentado por tipo de formato y coloreado por categoría de metraje.

* **Evolución Temporal de Estrenos:** Gráfico de series temporales (2000–2021) que compara la trayectoria de lanzamientos de Movies frente a TV Shows.

* **Interactividad Dinámica:** Filtro global multidimensional por clasificación por edad (Rating) y acciones de filtrado cruzado mediante selección directa en las barras.

> 🔗 **Explorar Dashboard Interactivo:** [Ver en Tableau Public](https://public.tableau.com/views/StreamingContentAnalysisDashboard/Dashboard1)

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/d8c38003-5c82-4cc5-b26a-dd730156894c" />


