# 🌍 Análisis Demográfico y Educativo Global: World Bank

## 📌 Resumen Ejecutivo
Análisis geoespacial y socioeconómico sobre el conjunto de datos público del Banco Mundial (`bigquery-public-data.world_bank_intl_education`) para evaluar la distribución de la población en edad de cursar educación secundaria (2015) en 193 países. El objetivo fue cruzar datos de hechos con tablas dimensionales mediante SQL en BigQuery y diseñar un dashboard coroplético interactivo en Tableau Public.

---

## 📐 Metodología Aplicada (Ciclo de Vida de Google)

### 1. Preguntar (Ask)
- **Problema de Negocio:** Identificar qué regiones y grupos de ingresos concentran la mayor demanda de infraestructura y cobertura educativa secundaria a nivel mundial.
- **Métricas Clave:** Población estudiantil secundaria consolidada (`secondary_edu_population`), región geográfica y estrato socioeconómico (`income_group`).

### 2. Preparar (Prepare)
- **Origen de Datos:** Google BigQuery Public Data (`world_bank_intl_education`).
- **Tablas:**
  - `international_education`: Métricas anuales e indicadores educativos oficiales.
  - `country_summary`: Metadatos regionales y categorización de ingresos por país.
- **Llave Relacional:** `country_code` (Primary Key / Foreign Key).

### 3. Procesar & Analizar (Process & Analyze)
Se ejecutó una consulta relacional con agregaciones para filtrar registros sin región, seleccionar el año 2015 y estructurar la población por país y región:

```sql
SELECT 
  edu.country_name,
  edu.country_code,
  summary.region,
  summary.income_group,
  ROUND(SUM(edu.value), 0) AS secondary_edu_population
FROM 
  `bigquery-public-data.world_bank_intl_education.international_education` AS edu
INNER JOIN 
  `bigquery-public-data.world_bank_intl_education.country_summary` AS summary 
  ON edu.country_code = summary.country_code
WHERE 
  summary.region IS NOT NULL
  AND edu.year = 2015
  AND edu.indicator_name = 'Population of the official age for secondary education, both sexes (number)'
GROUP BY 
  edu.country_name,
  edu.country_code,
  summary.region,
  summary.income_group
ORDER BY 
  secondary_edu_population DESC;
```
## 📊 4. Hallazgos Principales (Insights)

* **Concentración Demográfica:** Más del 54% de la población global en edad de educación secundaria se concentra en dos regiones: South Asia (~237.5M) y East Asia & Pacific (~172.0M).

* **Segmentación por Ingresos:** La mayor densidad estudiantil pertenece al estrato Lower middle income, encabezado por India y países del sudeste asiático.

* **Brecha Regional:** Mientras que Sub-Saharan Africa presenta una demanda creciente de ~135.6M de estudiantes, North America registra ~27.0M.

## 📈 5. Compartir (Dashboard Interactivo en Tableau)
Se desarrolló un tablero analítico e interactivo en Tableau Public que integra:

* **Mapa Coroplético Mundial:** Mapeo de densidad demográfica a través de 193 países con gradientes de color secuencial.

* **Gráfico de Barras Jerárquico:** Desglose multivariable por Region y Income Group ordenado de forma descendente.

* **Acciones de Filtro Interactivas:** Selección directa sobre el mapa para aislar métricas regionales en tiempo real.

> 🔗 **Explorar Dashboard Interactivo:** [Ver en Tableau Public:] (https://public.tableau.com/views/WorldBankGlobalEducationAnalysis/Dashboard1)
>
> <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/abd13342-95c9-49eb-ad6a-b25cf599943f" />
