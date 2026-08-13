# ⚡ Análisis de Rendimiento SQL y Escala de Datos en BigQuery

## 📌 Objetivo del Laboratorio
Evaluar el impacto que tiene el volumen masivo de datos (Bytes vs. GB vs. TB) en los tiempos de ejecución y volumen procesado en Google BigQuery, utilizando datos públicos de consultas a Wikipedia.

---

## 📐 1. Jerarquía y Unidades de Almacenamiento de Datos

| Unidad | Abreviatura | Equivalente | Ejemplo Práctico |
| :--- | :---: | :---: | :--- |
| **Byte** | B | 8 bits | 1 carácter de texto |
| **Kilobyte** | KB | 1,024 Bytes | 1 página de texto (~4 KB) |
| **Megabyte** | MB | 1,024 KB | 1 canción MP3 (~3 MB) |
| **Gigabyte** | GB | 1,024 MB | Límite práctico de Hojas de Cálculo |
| **Terabyte** | TB | 1,024 GB | ~500 horas de video HD |
| **Petabyte** | PB | 1,024 TB | 10,000 millones de fotos en redes sociales |
| **Exabyte** | EB | 1,024 PB | 500 millones de horas de video HD |
| **Zettabyte** | ZB | 1,024 EB | Tráfico global estimado de Internet |

---

## ⚔️ Hojas de Cálculo vs. Bases de Datos SQL (OLAP)

* **Hojas de Cálculo (Google Sheets):**  
  Diseñadas para análisis visual y directo en datasets pequeños ($< 100$ MB / $< 10$ millones de celdas). Pierden estabilidad de rendimiento con archivos pesados.
* **Motores SQL Columnares (Google BigQuery):**  
  Diseñados para consultas analíticas sobre petabytes de información distribuidos en la nube, ejecutando cálculos complejos en cuestión de segundos.

---

## 🔬 Consultas Ejecutadas y Métricas de Rendimiento

```sql
SELECT
  language,
  title,
  SUM(views) AS total_views
FROM
  `bigquery-samples.wikipedia_benchmark.Wiki10B`
WHERE
  title LIKE '%Google%'
GROUP BY
  language,
  title
ORDER BY
  total_views DESC;
```
## 📊 Tabla Comparativa de Rendimiento

| Dataset | Número de Filas | Datos Procesados | Tiempo de Ejecución |
| :--- | :---: | :---: | :---: |
| **Wiki10B** | 10,000 Millones | ~415 GB | ~15.0 segundos |
| **Wiki100B** | 100,000 Millones | 4.1 TB | ~27.6 segundos |

---

## 💡 Lecciones Clave para Análisis de Datos

* **Relación Volumen - Tiempo:** Aumentar el dataset por un factor de 10x solo duplicó el tiempo de ejecución (de 15s a 27.6s) gracias a la arquitectura distribuida y paralela de BigQuery.
* **Optimizaciones de Costo:** En BigQuery, el costo de las consultas se calcula en función de la cantidad de Terabytes escaneados. Es crucial evitar cláusulas `SELECT *` innecesarias y seleccionar únicamente las columnas requeridas.
* **Almacenamiento en Caché:** Las reejecuciones de la misma consulta devuelven resultados de forma instantánea (0.0 segundos) a costo cero al aprovechar la memoria caché predeterminada.
