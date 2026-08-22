# 📌 Introducción al Repositorio

¡Bienvenido a mi portafolio de prácticas y proyectos de análisis de datos!

Este espacio está destinado a documentar mi aprendizaje continuo, ejercicios prácticos y proyectos de análisis de datos desarrollados de forma paralela al **Certificado Profesional de Análisis de Datos de Google**.

---

## 🎯 Objetivo del Portafolio
Aplicar técnicas de análisis exploratorio, saneamiento de datos, modelado relacional y visualización ejecutiva sobre casos de negocio reales, asegurando que cada proyecto cuente con una documentación clara, reproducible y enfocada en la toma de decisiones basada en datos.

---

## 🛠️ Herramientas y Tecnologías Aplicadas
* **Hojas de Cálculo (Google Sheets / Excel):** Auditoría visual, saneamiento de datos por menú, expresiones de texto (`LEFT`, `RIGHT`, `MID`, `CONCATENATE`), depuración de espacios (`TRIM`), tratamiento de errores, formato condicional de nulos/longitudes (`LEN`), desduplicación, tablas dinámicas, separación de subcadenas (`SPLIT`), funciones condicionales (`COUNTIF`) y cruce de datos mediante `VLOOKUP`.
* **Bases de Datos & SQL (Google BigQuery):** Consultas analíticas, agregaciones (`GROUP BY`, `SUM`, `AVG`), cruces relacionales (`INNER JOIN`, alias), funciones de conversión (`SAFE_CAST`, `PARSE_DATE`), condicionales (`CASE WHEN`), benchmarking de consultas masivas (10B vs. 100B de filas), sentencias DML (`UPDATE`, `DELETE`, `TRIM`, `LENGTH`), creación y materialización de tablas analíticas (`CREATE OR REPLACE TABLE`) con depuración de valores centinela (*sentinel values*).
* **Visualización de Datos (Looker Studio / Gráficos de Hojas de Cálculo):** Diseños de dashboards ejecutivos e interactivos con KPIs, gráficos de barras/columnas para detección de atípicos y mapas regionales.
* **Estadística Aplicada:** Evaluación de dispersión salarial, desviación estándar, cálculo del margen de error (intervalos de confianza al 95%) y detección de valores fuera de rango (`COUNTIF`).

---

## 📐 Metodología de Trabajo
Cada proyecto desarrollado en este repositorio sigue las 6 fases del ciclo de vida del análisis de datos de Google:

1. **Preguntar (Ask):** Definición del problema de negocio y objetivos analíticos.
2. **Preparar (Prepare):** Identificación de fuentes, estructura y evaluación de integridad de los datos.
3. **Procesar (Process):** Saneamiento de datos, tratamiento de nulos y estandarización mediante Sheets/SQL.
4. **Analizar (Analyze):** Modelado, consultas exploratorias, agregaciones con tablas dinámicas y cálculos conceptuales.
5. **Compartir (Share):** Creación de tableros interactivos, visualizaciones y reportes de hallazgos.
6. **Actuar (Act):** Formulación de conclusiones y recomendaciones estratégicas.

> <small>_*Esta metodología se alinea con los estándares oficiales del Google Data Analytics Professional Certificate, garantizando que cada análisis sea estructurado, reproducible y orientado a decisiones de negocio.*_</small>

---

## 📂 Índice de Proyectos y Prácticas

| Proyecto / Práctica | Descripción | Herramientas | Estado |
| :--- | :--- | :--- | :---: |
| **`Analisis-ventas-ecommerce-`** | Limpieza de datos (+105k filas), consultas SQL y Dashboard en Looker Studio. | Sheets, BigQuery, Looker Studio | [Ver Carpeta](./Analisis-ventas-ecommerce-) |
| **`ds-salaries-analysis`** | Estandarización de roles, cálculo de margen de error (95% confianza) y consulta SQL de incertidumbre. | Google Sheets, BigQuery | [Ver Carpeta](./ds-salaries-analysis) |
| **`streaming-content-analysis`** | Limpieza de expresiones regulares, extracción de duraciones numéricas y categorización de catálogo mediante `CASE WHEN`. | Google Sheets, BigQuery | [Ver Carpeta](./streaming-content-analysis) |
| **`spreadsheet-data-cleaning-practice`** | Saneamiento de nulos, desduplicación, fórmulas de texto/limpieza (`ESPACIOS`, `VALOR`, `DIVIDIR`, `LARGO`), consolidación relacional con `BUSCARV` (cálculo de nómina) y reportes con Tablas Dinámicas. | Google Sheets | [Ver Carpeta](./spreadsheet-data-cleaning-practice) |
| **`SQL-Laboratories`** | Laboratorios de SQL en BigQuery: Benchmarking masivo (Wikipedia 4.1 TB), saneamiento relacional DML (`cars.car_info`), materialización analítica (`NOAA NYC Weather 2020`) y cruces relacionales (`World Bank Education JOINs`). | Google BigQuery, SQL | [Ver Carpeta](./SQL-Laboratories) |

---

## 👤 Autor
**Sebastián Corrales Blanco**  
*San José, Costa Rica*
