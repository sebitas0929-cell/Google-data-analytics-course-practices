# 📌 Introducción al Repositorio

¡Bienvenido a mi portafolio de prácticas y proyectos de análisis de datos!

Este espacio está destinado a documentar mi aprendizaje continuo, ejercicios prácticos y proyectos de análisis de datos desarrollados de forma paralela al **Certificado Profesional de Análisis de Datos de Google**.

---

## 🎯 Objetivo del Portafolio
Aplicar técnicas de análisis exploratorio, saneamiento de datos, modelado relacional y visualización ejecutiva sobre casos de negocio reales, asegurando que cada proyecto cuente con una documentación clara, reproducible y enfocada en la toma de decisiones basada en datos.

---

## 🛠️ Herramientas y Tecnologías Aplicadas
* **Hojas de Cálculo (Google Sheets / Excel):** Auditoría visual, saneamiento de datos, expresiones regulares (`REGEXEXTRACT`), tratamiento de errores (`SI.ERROR`) y tablas dinámicas.
* **Bases de Datos & SQL (Google BigQuery):** Consultas analíticas, agregaciones (`GROUP BY`, `SUM`, `AVG`), funciones de conversión (`SAFE_CAST`, `PARSE_DATE`), condicionales (`CASE WHEN`) y preparación de modelos de datos a escala.
* **Visualización de Datos (Looker Studio):** Diseños de dashboards ejecutivos e interactivos con KPIs, gráficos de barras y mapas regionales.
* **Estadística Aplicada:** Evaluación de dispersión salarial, desviación estándar y cálculo del margen de error (intervalos de confianza al 95%).

---

## 📐 Metodología de Trabajo
Cada proyecto desarrollado en este repositorio sigue las 6 fases del ciclo de vida del análisis de datos de Google:

1. **Preguntar (Ask):** Definición del problema de negocio y objetivos analíticos.
2. **Preparar (Prepare):** Identificación de fuentes, estructura y evaluación de integridad de los datos.
3. **Procesar (Process):** Saneamiento de datos, tratamiento de nulos y estandarización mediante Sheets/SQL.
4. **Analizar (Analyze):** Modelado, consultas exploratorias y cálculos estadísticos en BigQuery.
5. **Compartir (Share):** Creación de tableros interactivos y reportes de hallazgos.
6. **Actuar (Act):** Formulación de conclusiones y recomendaciones estratégicas.
   
### 🔍 Respaldo de la Metodología en los Entregables

Cada fase de la metodología de Google está documentada y respaldada en los archivos de este repositorio:

* **Ask & Prepare:** Sección *Contexto y Diagnóstico* en las bitácoras `log_de_limpieza.md`.
* **Process:** Scripts de fórmulas en Google Sheets y preparación de archivos `.csv`.
* **Analyze:** Consultas SQL avanzadas guardadas en la carpeta `sql/` de cada proyecto (ej. `01_netflix_content_transformation.sql`).
* **Share & Act:** Reportes de *Hallazgos Principales* y enlaces a dashboards en Looker Studio.

  Esta metodología se alinea con los estándares oficiales del Google Data Analytics Professional Certificate, garantizando que cada análisis sea estructurado, reproducible y orientado a decisiones de negocio.
---

## 📂 Índice de Proyectos y Prácticas

| Proyecto / Práctica | Descripción | Herramientas | Estado |
| :--- | :--- | :--- | :---: |
| **`Analisis-ventas-ecommerce-`** | Limpieza de datos (+105k filas), consultas SQL y Dashboard en Looker. | Sheets, BigQuery, Looker Studio | [Ver Carpeta](./Analisis-ventas-ecommerce-) |
| **`ds-salaries-analysis`** | Estandarización de roles, cálculo de margen de error (95% confianza) y consulta SQL de incertidumbre. | Google Sheets, BigQuery | [Ver Carpeta](./ds-salaries-analysis) |
| **`streaming-content-analysis`** | Limpieza de expresiones regulares, extracción de duraciones numéricas y categorización de catálogo mediante `CASE WHEN`. | Google Sheets, BigQuery | [Ver Carpeta](./streaming-content-analysis) |

---

## 👤 Autor
**Sebastián Corrales Blanco**  
*San José, Costa Rica*
