# 🌍 Análisis Demográfico y Educativo Global (World Bank & SQL JOINs)

## 📌 Contexto del Proyecto
Laboratorio práctico sobre el dataset público del Banco Mundial (`bigquery-public-data.world_bank_intl_education`), enfocado en la combinación relacional de tablas transaccionales y dimensionales mediante `INNER JOIN`, alias (`AS`), tratamiento de nulos y agregaciones grupales.

---

## 📐 Claves Relacionales e Integridad de Datos
- **Tabla de Hechos:** `international_education` (`indicator_name`, `value`, `year`).
- **Tabla Dimensional:** `country_summary` (`region`, `income_group`).
- **Llave Relacional (`ON`):** `country_code`.

---

## 🛠️ Consultas Ejecutadas

### 1. Validación de Conexión y Alias
```sql
SELECT 
  edu.country_name,
  summary.country_code,
  edu.value
FROM 
  `bigquery-public-data.world_bank_intl_education.international_education` AS edu
INNER JOIN 
  `bigquery-public-data.world_bank_intl_education.country_summary` AS summary
  ON edu.country_code = summary.country_code
LIMIT 10;
```
### 2. Agregación Regional: Población en Edad Escolar Secundaria (2015)
```sql
SELECT 
  summary.region, 
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
  summary.region
ORDER BY 
  secondary_edu_population DESC;
```
## 📊 Resultados Principales (2015)

| Región | Población Estudiantil Secundaria |
| :--- | :---: |
| **South Asia** | 237,541,684 |
| **East Asia & Pacific** | 172,016,129 |
| **Sub-Saharan Africa** | 135,639,085 |
| **Europe & Central Asia** | 70,181,959 |
| **Latin America & Caribbean** | 67,937,467 |
| **Middle East & North Africa** | 44,318,682 |
| **North America** | 27,003,321 |

## 💡 Lecciones Técnicas

* **Aliasing:** El uso de alias (`edu`, `summary`) reduce redundancia y mejora la legibilidad en cruces complejos.
* **Integridad Relacional:** La coincidencia de la clave `country_code` aseguró la consistencia de los datos entre la tabla métrica y la dimensional.
* **Cambio de Grano:** Se transformó el nivel de detalle de registro por país a un resumen consolidado continental mediante `GROUP BY summary.region`.
